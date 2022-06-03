SELECT
	cancoes AS nome_musica,
  CASE
      WHEN cancoes LIKE '%Streets%' THEN REPLACE(cancoes, 'Streets', 'Code Review')
      WHEN cancoes LIKE '%Her Own%' THEN REPLACE(cancoes, 'Her Own', 'Trybe')
      WHEN cancoes LIKE '%Inner Fire%' THEN REPLACE(cancoes, 'Inner Fire', 'Project')
      WHEN cancoes LIKE '%Silly%' THEN REPLACE(cancoes, 'Silly', 'Nice')
      WHEN cancoes LIKE '%Circus%' THEN REPLACE(cancoes, 'Circus', 'Pull Request')
	END AS novo_nome
FROM SpotifyClone.cancoes
WHERE cancoes LIKE '%Streets%' 
	OR cancoes LIKE '%Her Own%'
  OR cancoes LIKE '%Inner Fire%'
  OR cancoes LIKE '%Silly%'
  OR cancoes LIKE '%Circus%'
ORDER BY cancoes;
