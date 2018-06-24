###########################################################################
DELIMITER $$

CREATE PROCEDURE atualiza(velho_id INT, novo_id INT)
	BEGIN
		UPDATE filme f SET f.disponivel=(
       SELECT COUNT(0)
           FROM inventario i 
           WHERE i.filme_id=novo_id
           )
           -
           (
           SELECT COUNT(0)
               from aluguel a 
               INNER JOIN inventario i on i.inventario_id = a.inventario_id
               WHERE data_de_devolucao IS null and i.filme_id = novo_id 
           );
	END $$
DELIMITER ;

###########################################################################
DELIMITER $$ 

CREATE TRIGGER atualiza_insert 
AFTER INSERT ON aluguel 
FOR EACH ROW
BEGIN
	CALL atualiza((
        SELECT i.filme_id from inventario i
    	WHERE i.inventario_id=new.inventario_id));
END $$

DELIMITER ;

###########################################################################
DELIMITER $$

CREATE TRIGGER atualiza_update
AFTER UPDATE ON aluguel
FOR EACH ROW
BEGIN
	CALL atualiza((SELECT i.filme_id FROM inventario i
                  WHERE i.inventario_id=new.inventario_id));
END $$

DELIMITER ;