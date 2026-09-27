

WITH stats AS (
    SELECT 
        pz.name AS pizzeria_name,
        SUM(CASE WHEN pe.gender = 'female' THEN 1 ELSE 0 END) AS female_count,
        SUM(CASE WHEN pe.gender = 'male' THEN 1 ELSE 0 END) AS male_count
    FROM person_visits pv
    JOIN person pe ON pv.person_id = pe.id
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    GROUP BY pz.name
)
SELECT pizzeria_name
FROM stats
WHERE female_count > male_count 
   OR male_count > female_count
ORDER BY pizzeria_name;

