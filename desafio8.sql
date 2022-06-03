SELECT
	  artistas.artista,
    albuns.album
FROM SpotifyClone.artistas AS artistas
INNER JOIN SpotifyClone.albuns AS albuns
ON artistas.artista_id = albuns.artista_id
WHERE artistas.artista = 'Walter Phoenix'
ORDER BY albuns.album ASC;
