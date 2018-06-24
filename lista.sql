# Faça uma consulta que retorne as três primeiras letras dos nomes dos atores.

SELECT CONCAT(CONCAT(
    UPPER(LEFT(A.primeiro_nome, 3))))
FROM ATOR A


# Faça uma consulta que retorne o nome completo em um campo, e as iniciais do nome em outro campo.

SELECT CONCAT (A.PRIMEIRO_NOME, " ", A.ULTIMO_NOME) AS NOME,
CONCAT (LEFT(A.PRIMEIRO_NOME, 1), " ", LEFT(A.ultimo_nome, 1)) AS INICIAIS
FROM ATOR A



# Monte uma lista de todos os atores classificados de acordo com o maior nome completo (Primeiro nome e último nome).

SELECT 
LENGTH(
CONCAT(a.primeiro_nome, " ", a.ultimo_nome)) AS Tamanho,
CONCAT(a.primeiro_nome, " ", a.ultimo_nome) AS Nome
FROM ator a
ORDER BY Tamanho DESC


# Monte uma consulta que agrupe e mostre a quantidade de cada grupo de nomes que rimam (Considere nomes que rimam, aqueles que terminam com as mesmas duas letras).


SELECT RIGHT(A.primeiro_nome, 2) AS NOME , COUNT(0)
FROM ATOR A
GROUP BY NOME
ORDER BY NOME


# Faça uma consulta que transforme os nomes da seguinte maneira:

SELECT A.PRIMEIRO_NOME, A.ULTIMO_NOME, 
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
LOWER(CONCAT(A.primeiro_nome, ' ', A.ultimo_nome)),
'a', 'A'),
'e', 'E'),
'i', "i"), 
'o', 'O'),
'u', 'U')         

as Nome
FROM ATOR A


# Faça uma estimativa de quanto a locadora teria ganho se cada filme custasse valor arredondado, ou seja $3,00 ao invés de $2,99; $5,00 ao invés de $4,99 e assim por diante.

SELECT

SUM(p.valor) AS "Valor Normal",
SUM(ROUND(P.valor)) AS "Valor Arredondado"

FROM pagamento p


# Faça uma estimativa de quanto a locadora teria ganho se sempre fosse dado desconto dos valores em centavos (Se um filme custa $3,50 teria $0,50 de desconto, se custa $1,80 teria $0,80 de desconto).

SELECT

SUM(p.valor) AS "Valor Normal",
SUM(FLOOR(P.valor)) AS "Valor Arredondado"

FROM pagamento p


# Faça uma lista classificando os filmes pela quantidade de dias que os mesmos ficam nos clientes.

SELECT F.TITULO, SUM(DATEDIFF(AL.DATA_DE_DEVOLUCAO, AL.DATA_DE_ALUGUEL)) AS QUANTIDADE
FROM filme F
INNER JOIN inventario INV 
ON F.filme_id = INV.filme_id
INNER JOIN aluguel AL 
ON AL.inventario_id = INV.inventario_id
GROUP BY F.titulo  
ORDER BY `QUANTIDADE`  DESC



# Qual dia da semana têm mais aluguéis de filmes.

SELECT DAYNAME(AL.DATA_DE_ALUGUEL) AS Dia, 
COUNT(0) AS Total
FROM aluguel AL
GROUP BY DIA
ORDER BY TOTAL DESC 


# Faça uma lista dos atores que a segunda letra do nome seja "A".

SELECT  DISTINCT LOWER(A.PRIMEIRO_NOME)
FROM ator A 
where a.primeiro_nome like "_a%"


# Faça uma lista dos filmes que contenham no campo recursos especiais "Behind the Scenes"

SELECT F.titulo
FROM filme F
WHERE F.recursos_especiais LIKE '%BEHIND THE SCENES%'


# Faça uma lista com a quantidade de filmes de cada categoria, porém o nome da categoria deve estar em Português.

 
SELECT COUNT(0) AS Quantidade,
(CASE C.NOME
 
 WHEN "ACTION" THEN "ACAO"
 WHEN "ANIMATION" THEN "ANIMACAO"
 WHEN "CHILDREN" THEN "INFANTIL"
 WHEN "CLASSICS" THEN "CLASSICO"
 WHEN "COMEDY" THEN "COMEDIA"
 WHEN "DOCUMENTARY" THEN "DOCUMENTARIO"
 WHEN "DRAMA" THEN "DRAMA"
 WHEN "FAMILY" THEN "FAMILIA"
 WHEN "FOREIGN" THEN "EXTRANGEIRO"
 WHEN "GAMES" THEN "JOGOS"
 WHEN "HORROR" THEN "HORROR"
 WHEN "MUSIC" THEN "MUSICA"
 WHEN "NEW" THEN "NOVO"
 WHEN "SCI-FI" THEN "FICACAO CIENTIFICA"
 WHEN "SPORTS" THEN "ESPORTES"
 WHEN "TRAVEL" THEN "VIAGEM"
 
END) AS CATEGORIA

FROM FILME F INNER JOIN filme_categoria FC
ON F.filme_id = FC.filme_id
INNER JOIN categoria C 
ON C.categoria_id = FC.categoria_id

GROUP BY categoria

