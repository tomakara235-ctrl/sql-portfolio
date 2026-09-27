WITH t1 AS (
    SELECT DISTINCT ON (c.id)
        c.id AS currency_id,
        c.name AS currency_name,
        c.rate_to_usd
    FROM currency c
    ORDER BY c.id, c.updated DESC NULLS LAST
),
t2 AS (
    SELECT
        b.user_id,
        b.type,
        b.currency_id,
        SUM(b.money) AS volume
    FROM balance b
    GROUP BY b.user_id, b.type, b.currency_id
)
SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    t2.type,
    t2.volume,
    COALESCE(t1.currency_name, 'not defined') AS currency_name,
    COALESCE(t1.rate_to_usd, 1) AS last_rate_to_usd,
    t2.volume * COALESCE(t1.rate_to_usd, 1) AS total_volume_in_usd
FROM t2
LEFT JOIN t1 ON t1.currency_id = t2.currency_id
LEFT JOIN public."user" u ON u.id = t2.user_id
ORDER BY name DESC, lastname ASC, type ASC;