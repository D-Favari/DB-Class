DELIMITER $$

    CREATE OR REPLACE PROCEDURE atualiza_ator(velhoid INT, novoid INT, nome VARCHAR(45), sobrenome varchar(45))   
    
        BEGIN
            INSERT INTO ator(ator_id, primeiro_nome, ultimo_nome)
            VALUES(novoid, nome, sobrenome);
            UPDATE filme_ator SET ator_id = novoid WHERE ator_id = velhoid;
            DELETE FROM ator WHERE ator_id = velho_id
		END $$
        
DELIMITER ;