USE db_biblioteca;

-- INNER JOIN
-- Exercício 1: Liste os nomes dos membros que pegaram livros emprestados e
-- o título dos livros que eles emprestaram.
SELECT nome, data_emprestimo, data_devolucao, titulo FROM membros AS M
INNER JOIN 	emprestimos AS E ON M.id_membro = E.id_membro
INNER JOIN livros AS L ON E.id_livro = L.id_livro;

SELECT * FROM tb_emprestimos;

-- RIGHT / LEFT JOIN
-- Exercício 1: Liste todos os membros, incluindo aqueles que não realizaram nenhum empréstimo.
-- RIGHT JOIN
SELECT * FROM emprestimos AS E 
RIGHT JOIN membros AS M
ON M.id_membros = E.id_membro
WHERE E.id_emprestimo IS NULL;

-- LEFT JOIN
SELECT * FROM membros AS M
LEFT JOIN emprestimos AS E
ON M.id_membro = E.id_membro
WHERE E.id_emprestimo IS NULL;

SELECT nome, titulo, ano_publicacao, data_emprestimo FROM autores AS A
INNER JOIN livros AS L ON A.id_autor = L.id_autor
INNER JOIN emprestimos AS E ON L.id_livro = E.id_livro;

-- Exercício 2: Liste todos os autores e seus livros, incluindo livros que não foram emprestados.
SELECT * FROM livros AS L
LEFT JOIN emprestimos AS E ON L.id_emprestimo = E.id_emprestimo
INNER JOIN autores AS A ON L.id_autor = A.id_autor
WHERE E.id IS NULL;


-- UNION
-- Exercício 1: Liste todos os livros e seus autores, incluindo livros que não têm
-- autores associados e autores que não têm livros cadastrados.


-- Exercício 2: Liste todos os membros e livros emprestados, incluindo membros
-- que não pegaram livros e livros que não foram emprestados.
