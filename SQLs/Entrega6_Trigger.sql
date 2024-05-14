DELIMITER //

CREATE TRIGGER before_delete_visitante
BEFORE DELETE ON visitantes
FOR EACH ROW
BEGIN
    DECLARE ultima_conexion DATE;
    SELECT MAX(fecha) INTO ultima_conexion FROM visitantes WHERE id_visitante = OLD.id_visitante;
    IF DATEDIFF(CURDATE(), ultima_conexion) <= 365 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede borrar este visitante porque se ha conectado en el último año.';
    END IF;
END //
