WITH find_lowest AS (
    WITH RECURSIVE 
        normalized_nodes AS (
            SELECT
                LOWER(point1) AS point1,
                LOWER(point2) AS point2,
                cost
            FROM
                nodes
        ),

        cities AS (
            SELECT DISTINCT city
            FROM (
                SELECT point1 AS city FROM normalized_nodes
                UNION
                SELECT point2 AS city FROM normalized_nodes
            ) all_cities
            WHERE city <> 'a'
        ),

        edges AS (
            SELECT
                point1,
                point2,
                cost
            FROM
                normalized_nodes
        ),

        path AS (
            SELECT
                ARRAY[point1, point2] AS path_arr,
                point2 AS last_city,
                cost AS total_cost,
                ARRAY[point1, point2] AS visited
            FROM
                edges
            WHERE
                point1 = 'a'

            UNION ALL

            SELECT
                ARRAY_APPEND(path_arr, e.point2),
                e.point2,
                p.total_cost + e.cost,
                ARRAY_APPEND(visited, e.point2)
            FROM
                path p
            JOIN
                edges e ON p.last_city = e.point1
            WHERE
                e.point2 <> 'a'
                AND NOT e.point2 = ANY(p.visited)
        ),

        complete_tours AS (
            SELECT
                total_cost + return_edge.cost AS total_cost,
                ARRAY_APPEND(path_arr, 'a') AS tour_path
            FROM
                path p
            JOIN
                edges return_edge ON p.last_city = return_edge.point1 AND return_edge.point2 = 'a'
            WHERE
                CARDINALITY(p.visited) = (SELECT COUNT(*) FROM cities) + 1
        )
    SELECT
        total_cost,
        '{' || array_to_string(tour_path, ',') || '}' AS tour
    FROM
        complete_tours
    WHERE
        total_cost = (SELECT MIN(total_cost) FROM complete_tours) 
        OR  total_cost = (SELECT MAX(total_cost) FROM complete_tours)
        ORDER BY total_cost, tour
)

SELECT * FROM find_lowest;