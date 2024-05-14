-- Recupera los nombres de usuario y los nombres de los mazos, 
-- priorizando todos los mazos y haciendo coincidir los mazos de los usuarios.

SELECT usuarios.nombre_usuario, mazos.nombre
FROM usuarios
RIGHT JOIN mazos ON usuarios.id_mazo = mazos.id_mazo;