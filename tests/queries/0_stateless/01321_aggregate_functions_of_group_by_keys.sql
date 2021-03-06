set optimize_aggregators_of_group_by_keys = 1;
set enable_debug_queries = 1;
set optimize_any_input = 0;

SELECT min(number % 2) AS a, max(number % 3) AS b FROM numbers(10000000) GROUP BY number % 2, number % 3 ORDER BY a, b;
SELECT any(number % 2) AS a, anyLast(number % 3) AS b FROM numbers(10000000) GROUP BY number % 2, number % 3 ORDER BY a, b;
SELECT max((number % 5) * (number % 7)) AS a FROM numbers(10000000) GROUP BY number % 7, number % 5 ORDER BY a;

analyze SELECT min(number % 2) AS a, max(number % 3) AS b FROM numbers(10000000) GROUP BY number % 2, number % 3 ORDER BY a, b;
analyze SELECT any(number % 2) AS a, anyLast(number % 3) AS b FROM numbers(10000000) GROUP BY number % 2, number % 3 ORDER BY a, b;
analyze SELECT max((number % 5) * (number % 7)) AS a FROM numbers(10000000) GROUP BY number % 7, number % 5 ORDER BY a;

set optimize_aggregators_of_group_by_keys = 0;

SELECT min(number % 2) AS a, max(number % 3) AS b FROM numbers(10000000) GROUP BY number % 2, number % 3 ORDER BY a, b;
SELECT any(number % 2) AS a, anyLast(number % 3) AS b FROM numbers(10000000) GROUP BY number % 2, number % 3 ORDER BY a, b;
SELECT max((number % 5) * (number % 7)) AS a FROM numbers(10000000) GROUP BY number % 7, number % 5 ORDER BY a;

analyze SELECT min(number % 2) AS a, max(number % 3) AS b FROM numbers(10000000) GROUP BY number % 2, number % 3 ORDER BY a, b;
analyze SELECT any(number % 2) AS a, anyLast(number % 3) AS b FROM numbers(10000000) GROUP BY number % 2, number % 3 ORDER BY a, b;
analyze SELECT max((number % 5) * (number % 7)) AS a FROM numbers(10000000) GROUP BY number % 7, number % 5 ORDER BY a;
