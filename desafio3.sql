SELECT 
	users.nome AS usuario,
	COUNT(historico.user_id) AS qtde_musicas_ouvidas,
  ROUND(SUM(cancoes.duracao / 60), 2) AS total_minutos
FROM SpotifyClone.users AS users

INNER JOIN SpotifyClone.historico AS historico
ON users.user_id = historico.user_id

INNER JOIN SpotifyClone.cancoes AS cancoes
ON historico.cancao_id = cancoes.cancao_id

GROUP BY users.nome, historico.user_id
ORDER BY users.nome;
