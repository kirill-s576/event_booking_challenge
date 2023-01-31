# File path: /Users/kirill/own_projects/event_booking/event/runner.py
# Function: function main
# Queries count for wrapped method: 2
# Total query execution time: 0.088
# Total function execution time: 0.1748

SELECT "demo_booking"."id",
       "demo_event"."id" AS "event_id",
       (EXTRACT('hour'
                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer AS "hour_start",
       ((((EXTRACT('hour'
                   FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer AS "hour_end",
       (ARRAY
          (SELECT a.n
           FROM generate_series((EXTRACT('hour'
                                         FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                     FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))) AS "number_range",
       CARDINALITY((ARRAY
                      (SELECT a.n
                       FROM generate_series((EXTRACT('hour'
                                                     FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n)))) AS "count",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 0) AS "hour_0_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 0) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_0",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 1) AS "hour_1_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 1) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_1",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 2) AS "hour_2_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 2) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_2",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 3) AS "hour_3_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 3) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_3",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 4) AS "hour_4_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 4) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_4",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 5) AS "hour_5_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 5) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_5",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 6) AS "hour_6_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 6) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_6",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 7) AS "hour_7_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 7) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_7",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 8) AS "hour_8_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 8) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_8",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 9) AS "hour_9_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 9) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_9",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 10) AS "hour_10_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 10) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_10",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 11) AS "hour_11_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 11) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_11",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 12) AS "hour_12_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 12) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_12",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 13) AS "hour_13_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 13) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_13",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 14) AS "hour_14_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 14) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_14",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 15) AS "hour_15_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 15) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_15",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 16) AS "hour_16_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 16) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_16",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 17) AS "hour_17_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 17) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_17",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 18) AS "hour_18_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 18) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_18",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 19) AS "hour_19_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 19) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_19",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 20) AS "hour_20_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 20) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_20",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 21) AS "hour_21_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 21) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_21",
       array_position((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 22) AS "hour_22_position",
       CASE
           WHEN array_position((ARRAY
                                  (SELECT a.n
                                   FROM generate_series((EXTRACT('hour'
                                                                 FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                             FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 22) IS NOT NULL THEN 1
           ELSE 0
       END AS "hour_22"
FROM "demo_event"
INNER JOIN "demo_booking" ON ("demo_event"."id" = "demo_booking"."event_id")
WHERE "demo_booking"."id" IS NOT NULL
GROUP BY "demo_booking"."id",
         "demo_event"."id",
         (EXTRACT('hour'
                  FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer,
         ((((EXTRACT('hour'
                     FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer
LIMIT 21;


SELECT SUM("hour_0"),
       SUM("hour_1"),
       SUM("hour_2"),
       SUM("hour_3"),
       SUM("hour_4"),
       SUM("hour_5"),
       SUM("hour_6"),
       SUM("hour_7"),
       SUM("hour_8"),
       SUM("hour_9"),
       SUM("hour_10"),
       SUM("hour_11"),
       SUM("hour_12"),
       SUM("hour_13"),
       SUM("hour_14"),
       SUM("hour_15"),
       SUM("hour_16"),
       SUM("hour_17"),
       SUM("hour_18"),
       SUM("hour_19"),
       SUM("hour_20"),
       SUM("hour_21"),
       SUM("hour_22")
FROM
  (SELECT "demo_booking"."id" AS "col1",
          "demo_event"."id" AS "event_id",
          (EXTRACT('hour'
                   FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer AS "hour_start",
          ((((EXTRACT('hour'
                      FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer AS "hour_end",
          (ARRAY
             (SELECT a.n
              FROM generate_series((EXTRACT('hour'
                                            FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))) AS "number_range",
          CARDINALITY((ARRAY
                         (SELECT a.n
                          FROM generate_series((EXTRACT('hour'
                                                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n)))) AS "count",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 0) AS "hour_0_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 0) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_0",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 1) AS "hour_1_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 1) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_1",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 2) AS "hour_2_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 2) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_2",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 3) AS "hour_3_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 3) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_3",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 4) AS "hour_4_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 4) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_4",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 5) AS "hour_5_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 5) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_5",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 6) AS "hour_6_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 6) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_6",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 7) AS "hour_7_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 7) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_7",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 8) AS "hour_8_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 8) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_8",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 9) AS "hour_9_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 9) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_9",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 10) AS "hour_10_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 10) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_10",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 11) AS "hour_11_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 11) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_11",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 12) AS "hour_12_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 12) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_12",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 13) AS "hour_13_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 13) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_13",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 14) AS "hour_14_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 14) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_14",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 15) AS "hour_15_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 15) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_15",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 16) AS "hour_16_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 16) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_16",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 17) AS "hour_17_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 17) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_17",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 18) AS "hour_18_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 18) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_18",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 19) AS "hour_19_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 19) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_19",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 20) AS "hour_20_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 20) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_20",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 21) AS "hour_21_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 21) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_21",
          array_position((ARRAY
                            (SELECT a.n
                             FROM generate_series((EXTRACT('hour'
                                                           FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                       FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 22) AS "hour_22_position",
          CASE
              WHEN array_position((ARRAY
                                     (SELECT a.n
                                      FROM generate_series((EXTRACT('hour'
                                                                    FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer, ((((EXTRACT('hour'
                                                                                                                                                FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) AS a(n))), 22) IS NOT NULL THEN 1
              ELSE 0
          END AS "hour_22"
   FROM "demo_event"
   INNER JOIN "demo_booking" ON ("demo_event"."id" = "demo_booking"."event_id")
   WHERE "demo_booking"."id" IS NOT NULL
   GROUP BY "demo_booking"."id",
            "demo_event"."id",
            (EXTRACT('hour'
                     FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer,
            ((((EXTRACT('hour'
                        FROM "demo_booking"."time_start" AT TIME ZONE 'UTC'))::integer + ("demo_booking"."duration" / 60)) + 1))::integer) subquery;


#