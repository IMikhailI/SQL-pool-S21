insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    currency.name AS currency_name,
    TRIM_SCALE((balance.money * currency.rate_to_usd)::NUMERIC) AS currency_in_usd
FROM balance
LEFT JOIN "user" u ON u.id = balance.user_id
INNER JOIN currency ON (balance.currency_id = currency.id
    AND currency.updated = COALESCE(
    (SELECT MAX(t1.updated)
    FROM currency AS t1
    WHERE currency.id = t1.id
    AND balance.updated >= t1.updated
    GROUP BY t1.id),
    (SELECT MIN(t2.updated)
    FROM currency AS t2
    WHERE currency.id = t2.id
    AND balance.updated < t2.updated
    GROUP BY t2.id)))
ORDER BY name DESC, lastname, currency_name;

