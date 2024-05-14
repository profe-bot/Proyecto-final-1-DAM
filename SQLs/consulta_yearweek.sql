-- Esta selecciona todas las filas de la tabla "visitantes" en las que el año y la semana 
-- de la columna "fecha" coinciden con el año y la semana actuales, o con la semana anterior o siguiente. 
-- En efecto, recupera los datos de la semana en curso 
-- e incluye algunos datos de las semanas adyacentes por razones de contexto.

SELECT *
FROM visitantes
WHERE YEARWEEK(fecha) = YEARWEEK(CURDATE()) 
   OR YEARWEEK(fecha) = YEARWEEK(CURDATE()) - 1 
   OR YEARWEEK(fecha) = YEARWEEK(CURDATE()) + 1;