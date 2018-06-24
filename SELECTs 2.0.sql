-Retorne todos os alunos que não estão matriculados em uma matéria de sua escolha por ordem de nome de aluno;

SELECT a.nome, m.nome, m.id_materia, mm.id_matricula
from aluno a
inner join materia m on a.id_curso = m.id_curso
inner join materia_matricula mm on m.id_materia = mm.id_materia
where mm.id_materia != 22
order by a.nome 

-Retorne todos os alunos que possuem telefone cadastrado por ordem de RA do maior para o menor; 

SELECT a.nome, t.RA, t.numero
from telefone t
inner join aluno a on a.RA = t.RA
ORDER BY t.RA

-Retorne uma lista de cursos que tem alunos registrados por ordem de nome de curso sem repetição;

SELECT DISTINCT c.id_curso, c.nome as "Nome Curso"
from curso c
inner join aluno a on a.id_curso = c.id_curso
order by c.nome 