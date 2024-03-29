SELECT
	users.nome AS usuario,
	CASE 
	WHEN MAX(YEAR(historico.data_reproducao)) = 2021 THEN 'Usuário ativo'
		ELSE 'Usuário inativo'
	END AS condicao_usuario
FROM SpotifyClone.users AS users

INNER JOIN SpotifyClone.historico AS historico
ON users.user_id = historico.user_id
GROUP BY users.nome, historico.user_id
ORDER BY users.nome;
