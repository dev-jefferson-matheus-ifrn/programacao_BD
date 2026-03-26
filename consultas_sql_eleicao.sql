/*
SCRIPT: consultas_sql_eleicao
OBJETIVO: Retornar informações com base em perguntas/duvidas em relação ao dados armazenados
SGBD: MySQL 8.x
AUTORES: Jefferson Matheus Ferreira de Lima, Letícia Geovava Lopes dos Santos
*/

--. Liste os nomes dos candidatos cujo partido possui orientação "Centro". 1

-- 2. Liste os nomes dos partidos e as respectivas quantidades de candidatos associados.
SELECT SgPartido, COUNT(NoCandidato)FROM TbPartido as p
INNER JOIN TbCandidato as c ON p.CoPartido = c.CoPartido
GROUP BY SgPartido;

-- 3. Agora, liste apenas os partidos cuja a quantidade de candidatos associados seja maior que 5.=> Comentar sobre HAVING
SELECT SgPartido, COUNT(NoCandidato)FROM TbPartido as p
INNER JOIN TbCandidato as c
ON p.CoPartido = c.CoPartido
GROUP BY SgPartido
HAVING COUNT(NoCandidato) > 5;

--4. Selecione os candidatos que receberam mais votos do que a média de votos de todos os candidatos.
SELECT c.NoCandidato, sum(v.QtVotos) FROM tbvotos as v 
JOIN tbcandidato as c ON v.NuCandidato = c.NuCandidato 
group by c.NoCandidato having(sum(v.QtVotos)) > (SELECT AVG(QtVotos) as votos FROM tbvotos);

--5. Mostre os candidatos que não receberam votos em nenhuma zona.

--6. Liste os partidos que possuem, pelo menos, um candidato associado.
SELECT DISTINCT p.SgPartido FROM TbPartido as p 
WHERE EXISTS(SELECT p.CoPartido FROM TbPartido JOIN TbCandidato as c ON p.CoPartido - c.CoPartido);

--7. Agora, liste (se houver) os partidos que não há candidatos associados.
SELECT p.NoPartido 
FROM TbPartido p
LEFT JOIN TbCandidato c ON p.CoPartido = c.CoPartido
WHERE c.NuCandidato IS NULL;

--8. Liste os partidos que não possuem orientação política.
SELECT p.NoPartido FROM TbPartido as p
LEFT JOIN TbOrientacao as o ON p.CoOrientacao = o.CoOrientacao
WHERE o.CoOrientacao IS NULL;