-- a. Liste os autores que possuem livros com ano de publicação maior que a média de anos de publicação de todos os livros cadastrados.

-- Media do ano de publicacao dos livros
SELECT AVG(ano_publicacao) FROM tb_livros;

-- Puxar os livros acima dessa media
SELECT id, titulo FROM tb_livros WHERE ano_publicacao > 20130916.00;

-- Puxar autores
SELECT * FROM tb_autores;

-- RESULTADO 
SELECT nome FROM tb_autores WHERE id in (SELECT id_autor FROM tb_livros WHERE ano_publicacao > (SELECT AVG(ano_publicacao) FROM tb_livros));


-- b. Encontre os membros que realizaram mais de um empréstimo.
set @@autocommit = ON;
-- SELECT na tb_membros
SELECT nome FROM tb_membros; 
-- SELECT na tb_emprestimo
SELECT id_membro FROM tb_emprestimo GROUP BY id HAVING COUNT(id) > 1;

-- RESULTADO 
SELECT nome FROM tb_membros WHERE id IN (SELECT id_membro FROM tb_emprestimo GROUP BY id HAVING COUNT(id) > 1);

-- c. Liste os livros que foram emprestados ao menos uma vez 
-- Os titulos 
-- RESULTADO 
SELECT titulo FROM tb_livros
WHERE id IN (SELECT id_livro FROM tb_emprestimo);
