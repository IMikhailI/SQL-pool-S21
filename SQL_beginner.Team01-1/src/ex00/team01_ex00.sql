
SELECT COALESCE(u.name, 'not defined') AS name,
	   COALESCE(u.lastname, 'not defined') AS lastname,
       balance.type,
       SUM(balance.money) AS valume,
       COALESCE(actual_currency.name, 'not defined') AS currency_name,
       COALESCE(actual_currency.rate_to_usd, 1) AS last_rate_to_usd,
       TRIM_SCALE((SUM(balance.money)*COALESCE(actual_currency.rate_to_usd, 1))::NUMERIC) AS total_volume_in_usd
FROM "user" AS u
FULL JOIN balance ON u.id = balance.user_id
FULL JOIN (SELECT DISTINCT ON (id, name)
    id AS currency_id,
    name,
    rate_to_usd,
    updated
    FROM currency) actual_currency ON balance.currency_id = actual_currency.currency_id

GROUP BY u.name, u.lastname, balance.type, balance.currency_id, actual_currency.name, actual_currency.rate_to_usd
ORDER BY u.name DESC NULLS LAST, lastname, type;