# Faça um SQL que retorne uma lista com os filmes mais alugados; 

SELECT F.TITULO, F.FILME_ID, COUNT(0) as total
FROM ALUGUEL A
INNER JOIN INVENTARIO I
ON A.inventario_id = I.inventario_id
INNER JOIN FILME F
ON F.filme_id = I.filme_id
GROUP BY F.titulo, F.filme_id
order by total desc

# Faça um SQL que retorne uma lista com os filmes que renderam mais dinheiro; 

SELECT SUM(P.VALOR) AS TOTAL, F.TITULO
FROM PAGAMENTO P
INNER JOIN aluguel A 
ON P.aluguel_id = A.aluguel_id
INNER JOIN inventario I
ON A.inventario_id = I.inventario_id
INNER JOIN FILME F 
ON I.FILME_ID = F.FILME_ID
GROUP BY F.TITULO
ORDER BY TOTAL DESC

SELECT C.CIDADE, COUNT(0) AS TOTAL 
FROM ALUGUEL A 
INNER JOIN FUNCIONARIO F 
ON A.funcionario_id = F.FUNCIONARIO_ID 
INNER JOIN LOJA L 
ON F.LOJA_ID = L.LOJA_ID 
INNER JOIN ENDERECO E 
ON L.ENDERECO_ID = E.ENDERECO_ID 
INNER JOIN CIDADE C 
ON E.CIDADE_ID = C.CIDADE_ID 
GROUP BY C.CIDADE 
ORDER BY `TOTAL` DESC


# Faça um SQL que retorne uma lista contendo cada idioma dos filmes, e a quantidade de filme para cada idioma;

SELECT i.nome, i.idioma_id, COUNT(0)
from filme f 
inner join idioma i 
on f.idioma_id = i.idioma_id 
group by i.idioma_id, i.nome
