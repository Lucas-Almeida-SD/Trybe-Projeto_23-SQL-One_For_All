SELECT
	artistas.artista,
    albuns.album,
    COUNT(seguidores.artista_id) AS seguidores
FROM SpotifyClone.artistas AS artistas
INNER JOIN SpotifyClone.albuns AS albuns
ON artistas.artista_id = albuns.artista_id

INNER JOIN SpotifyClone.seguidores AS seguidores
ON artistas.artista_id = seguidores.artista_id

GROUP BY artistas.artista, albuns.album, seguidores.artista_id
ORDER BY COUNT(seguidores.artista_id) DESC, artistas.artista, albuns.album;
