USE db_biblioteca;

-- INNER JOIN
-- Exercício 1: Liste os nomes dos membros que pegaram livros emprestados e
-- o título dos livros que eles emprestaram.
SELECT nome, data_emprestimo, data_devolucao, titulo FROM membros AS M
INNER JOIN 	emprestimos AS E ON M.id_membro = E.id_membro
INNER JOIN livros AS L ON E.id_livro = L.id_livro;

SELECT * FROM tb_emprestimo;


-- RIGHT JOIN
-- Exercício 1: Liste todos os membros, incluindo aqueles que não realizaram nenhum empréstimo.
-- Exercício 2: Liste todos os autores e seus livros, incluindo livros que não foram emprestados.
SELECT nome, titulo, ano_publicacao, data_emprestimo FROM autores AS A
INNER JOIN livros AS L ON A.id_autor = L.id_autor
INNER JOIN emprestimos AS E ON L.id_livro = E.id_livro;

-- UNION
-- Exercício 1: Liste todos os livros e seus autores, incluindo livros que não têm
-- autores associados e autores que não têm livros cadastrados.
-- Exercício 2: Liste todos os membros e livros emprestados, incluindo membros
-- que não pegaram livros e livros que não foram emprestados.

