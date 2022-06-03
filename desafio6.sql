SELECT
	FORMAT(MIN(planos.valor_plano), 2) AS faturamento_minimo,
	FORMAT(MAX(planos.valor_plano),2) AS faturamento_maximo,
    FORMAT(AVG(planos.valor_plano), 2) AS faturamento_medio,
    FORMAT(SUM(planos.valor_plano), 2) AS faturamento_total
FROM SpotifyClone.planos AS planos
INNER JOIN SpotifyClone.users AS users
ON planos.plano_id = users.plano_id;
