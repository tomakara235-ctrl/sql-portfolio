insert into currency
values (100, 'EUR', 0.85, '2022-01-01 13:29');


insert into currency
values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH t1 AS
        (SELECT b.user_id,
                b.money,
                b.type,
                b.currency_id,
                b.updated AS balance_updated,
                MAX(c.updated) AS max_past_updated
         FROM balance b
         JOIN currency c ON b.currency_id = c.id
         AND c.updated <= b.updated
         GROUP BY b.user_id,
                  b.money,
                  b.type,
                  b.currency_id,
                  b.updated),
     t2 AS
        (SELECT b.user_id,
                b.money,
                b.type,
                b.currency_id,
                b.updated AS balance_updated,
                MIN(c.updated) AS min_future_updated
         FROM balance b
         JOIN currency c ON b.currency_id = c.id
         AND c.updated > b.updated
         WHERE NOT EXISTS
                         (SELECT 1
                          FROM currency c_past
                          WHERE c_past.id = b.currency_id
                                  AND c_past.updated <= b.updated)
         GROUP BY b.user_id,
                  b.money,
                  b.type,
                  b.currency_id,
                  b.updated),
     matched_rates AS
        (SELECT t1.user_id,
                t1.money,
                t1.type,
                t1.currency_id,
                t1.balance_updated,
                t1.max_past_updated AS rate_updated
         FROM t1
         UNION ALL SELECT t2.user_id,
                          t2.money,
                          t2.type,
                          t2.currency_id,
                          t2.balance_updated,
                          t2.min_future_updated AS rate_updated
         FROM t2)
SELECT COALESCE(u.name, 'not defined') AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       c.name AS currency_name,
       (mr.money * c.rate_to_usd)::float AS currency_in_usd
FROM matched_rates mr
LEFT JOIN "user" u ON mr.user_id = u.id
JOIN currency c ON mr.currency_id = c.id
AND mr.rate_updated = c.updated
ORDER BY name DESC,
         lastname ASC,
         currency_name ASC;
