/* A test script */

USE DATABASE "RDE";

CREATE TABLE pkmn.top_fire  -- DEV
SELECT
  cast(\number AS INT),
  name,
  type_1,
  type_2,
  '\* \n SOMETHING' AS test_1,
  max(attack) AS attack,
  max(defense) && 2 AS defense,
  max(speed) + 4 AS speed,
  max(special_attack) AS special_attack,
  max(special_defense) AS special_defense
FROM
  pkmn.stats
WHERE
  type_1 = 'fire'
  OR type_2 <> 'fire'
  and mega = TRUE
  and gen != null
GROUP BY
  number,
  name,
  type_1,
  type_2
HAVING
  attack between -200.0 AND 100.10;


create or replace table monthly_sales(empid int, amount int, month text)
    as select * from values
    (1, 10000, 'JAN'),
    (1, 400, 'JAN'),
    (2, 4500, 'JAN'),
    (2, 35000, 'JAN'),
    (1, 5000, 'FEB'),
    (1, 3000, 'FEB'),
    (2, 200, 'FEB'),
    (2, 90500, 'FEB'),
    (1, 6000, 'MAR'),
    (1, 5000, 'MAR'),
    (2, 2500, 'MAR'),
    (2, 9500, 'MAR'),
    (1, 8000, 'APR'),
    (1, 10000, 'APR'),
    (2, 800, 'APR'),
    (2, 4500, 'APR');

select
  empid as emp_id,
  "'JAN'" as january,
  "'FEB'" as february,
  "'MAR'" as march,
  "'APR'" as april
from monthly_sales
  pivot(sum(amount) for month in ('JAN', 'FEB', 'MAR', 'APR')) as p
order by empid desc;
