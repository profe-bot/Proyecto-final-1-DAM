--  selecciona el nombre de usuario y cuenta el número de registros asociados a cada usuario de la tabla "registros_partidas", 
-- unida a la tabla "usuarios" en sus IDs de usuario, agrupando los resultados por nombre de usuario.

SELECT nombre_usuario, COUNT(*) AS total_partidas
FROM usuarios
JOIN registros_partidas ON usuarios.id_usuario = registros_partidas.id_usuario
GROUP BY nombre_usuario;