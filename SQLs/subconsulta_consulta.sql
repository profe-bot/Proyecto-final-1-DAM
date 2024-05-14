-- Esta consulta SQL selecciona los nombres de usuario de la tabla "usuarios" 
-- cuyos ID coinciden con los de la tabla "registros_partidas".

SELECT nombre_usuario
FROM usuarios
WHERE id_usuario IN (SELECT id_usuario FROM registros_partidas);