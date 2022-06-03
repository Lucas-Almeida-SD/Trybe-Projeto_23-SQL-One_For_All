SELECT
	cancoes.cancoes AS cancao,
    COUNT(historico.cancao_id) AS reproducoes
FROM SpotifyClone.cancoes AS cancoes
INNER JOIN SpotifyClone.historico AS historico
ON cancoes.cancao_id = historico.cancao_id
GROUP BY cancoes.cancoes
ORDER BY COUNT(historico.cancao_id) DESC, cancoes.cancoes ASC
LIMIT 2;
