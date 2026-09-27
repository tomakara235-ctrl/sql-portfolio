WITH RECURSIVE paths AS (
    SELECT
        point1,
        point2,
        ARRAY[point1, point2]::char(1)[] AS visited,
        cost AS total_cost
    FROM ways
    WHERE point1 = 'a'

    UNION ALL

    SELECT
        w.point1,
        w.point2,
        (p.visited || w.point2)::char(1)[] AS visited,
        p.total_cost + w.cost AS total_cost
    FROM paths p
    JOIN ways w ON p.point2 = w.point1
    WHERE w.point2 != ALL(p.visited)
       OR (w.point2 = 'a' AND array_length(p.visited, 1) = 4)
),
full_tours AS (
    SELECT total_cost, visited AS tour
    FROM paths
    WHERE point2 = 'a'
      AND array_length(visited, 1) = 5
)
SELECT total_cost, tour
FROM full_tours
WHERE total_cost = (SELECT MIN(total_cost) FROM full_tours)
   OR total_cost = (SELECT MAX(total_cost) FROM full_tours)
ORDER BY total_cost, tour;