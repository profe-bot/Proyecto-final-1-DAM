-- esta selecciona la id_busqueda y cuenta las ocurrencias de cada valor único 
-- y filtra los resultados para incluir solo aquellos con recuentos superiores a 1.

SELECT id_busqueda, COUNT(*) AS cantidad_busquedas
FROM historia_de_busquedas
GROUP BY id_busqueda
HAVING COUNT(*) > 1;