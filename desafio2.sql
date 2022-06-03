SELECT 
	COUNT(cancoes.cancoes) AS cancoes,
    (SELECT DISTINCT COUNT(*) FROM artistas) AS artistas,
    (SELECT DISTINCT COUNT(*) FROM albuns) AS albuns
FROM SpotifyClone.cancoes AS cancoes

INNER JOIN SpotifyClone.albuns AS albuns
ON cancoes.album_id = albuns.album_id

INNER JOIN SpotifyClone.artistas AS artistas
ON albuns.artista_id = artistas.artista_id;