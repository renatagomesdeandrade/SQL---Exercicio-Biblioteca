USE db_biblioteca;
-- EXERCICIO 1. Crie uma stored procedure que insira um novo autor na tabela Autores.
DELIMITER $$

CREATE PROCEDURE insiraAutor(
IN nome_p VARCHAR(100),
IN data_nascimento_p DATE
)

BEGIN
INSERT INTO autores( nome, data_nascimento)
VALUES (nome_p, data_nascimento_p);
END $$
DELIMITER ;


CALL insiraAutor('Julio Montanha', '1910-02-15');
SELECT * FROM autores;
UPDATE autores SET nome = "Hannah Montana" WHERE id_autor = 9;

-- EXERCICIO 2. Crie uma stored procedure para atualizar a data de devolução de um empréstimo já registrado.
DELIMITER $$
CREATE PROCEDURE atualizaDataDevolucao(id_emprestimo_p, id_membro_p, id_livro_p, data_emprestimo_p, data_devolucao_p)
BEGIN
DECLARE data_devolucao_p DATE;
SELECT data_devolucao INTO data_devolucao_p FROM emprestimos WHERE id_emprestimo = id_emprestimo_p FOR UPDATE;
UPDATE emprestimos SET data_devolucao = data_devolucao_p WHERE id_emprestimo = id_emprestimo_p;

INSERT INTO atualizaDataDevolucao(id_emprestimo, id_membro, id_livro, data_emprestimo, data_devolucao)
VALUES(id_emprestimo_p, id_membro_p, id_livro_p, data_emprestimo_p, data_devolucao_p)
END $$
DELIMITER ;

CALL atualizaDataDevolucao('1', '1', '1', '2024-10-10', '2024-10-29');
SELECT * FROM emprestimos;
