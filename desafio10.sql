SELECT
	cancoes.cancoes AS nome,
  COUNT(historico.cancao_id) AS reproducoes
FROM SpotifyClone.users AS users
INNER JOIN SpotifyClone.historico AS historico
ON users.user_id = historico.user_id

INNER JOIN SpotifyClone.cancoes AS cancoes
ON cancoes.cancao_id = historico.cancao_id

WHERE users.plano_id IN (1, 4)
GROUP BY cancoes.cancao_id, historico.cancao_id
ORDER BY cancoes.cancoes ASC;
