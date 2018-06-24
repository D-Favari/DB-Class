# RETORNA 5 CLIENTES ALEATÓRIOS QUE GASTARAM MAIS QUE 100 REAIS EM FILMES:

SELECT sum(p.valor) as total, c.primeiro_nome as Nome, c.cliente_id
from pagamento p
inner join cliente c 
on c.cliente_id = p.cliente_id
group by c.cliente_id, c.primeiro_nome
having total >=100
order by rand()
limit 5 


# Retorna o dia da semana e o nome do mês em português e em tabelas diferentes

Select  DAYNAME(NOW()) AS DAY,  
		(CASE DAYNAME(NOW()) 
       		WHEN 'MONDAY' THEN 'SEGUNDA'
		WHEN "TUESDAY" THEN 'TERÇA'
   		WHEN "WEDNESDAY" THEN 'QUARTA'
		WHEN 'THURSDAY'THEN "QUINTA"
       		WHEN "FRIDAY" THEN "SEXTA"
      		WHEN "SATURDAY" THEN "SABADO"
        	WHEN "SUNDAY" THEN "DOMINGO"
       	
      	  END) AS DIA, 
	


	
(CASE month(NOW()) 
       when 1 then 'Janeiro'
       when 2 then 'Fevereiro'
       when 3 then 'Março'
       when 4 then 'Abril'
       when 5 then 'Maio'
       when 6 then 'Junho'
       when 7 then 'Julho'
       when 8 then 'Agosto'
       when 9 then 'Setembro'
       when 10 then 'Outubro'
       when 11 then 'Novembro'
       when 12 then 'Dezembro'
       END) AS mes