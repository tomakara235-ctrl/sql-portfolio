CREATE TABLE ways (
    point1 CHAR(1) NOT NULL,
    point2 CHAR(1) NOT NULL,
    cost INTEGER NOT NULL
);

INSERT INTO ways (point1, point2, cost)
VALUES
    ('a', 'b', 10), ('b', 'a', 10),
    ('b', 'c', 35), ('c', 'b', 35),
    ('a','c', 15), ('c', 'a', 15),
    ('a', 'd', 20), ('d','a', 20),
    ('b', 'd', 25), ('d', 'b', 25),
    ('c', 'd', 30), ('d', 'c', 30);

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
ORDER BY total_cost, tour;
