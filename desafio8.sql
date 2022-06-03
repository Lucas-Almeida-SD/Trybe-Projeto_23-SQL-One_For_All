SELECT
	  artistas.artista,
    albuns.album
FROM Spotify.artistas AS artistas
INNER JOIN Spotify.albuns AS albuns
ON artistas.artista_id = albuns.artista_id
WHERE artistas.artista = 'Walter Phoenix'
ORDER BY albuns.album ASC;
