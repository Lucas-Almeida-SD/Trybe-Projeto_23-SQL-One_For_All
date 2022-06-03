SELECT
	COUNT(users.nome) AS quantidade_musicas_no_historico
FROM SpotifyClone.users AS users
INNER JOIN SpotifyClone.historico AS historico
ON users.user_id = historico.user_id
WHERE users.nome = 'Bill'
GROUP BY users.user_id;
