/*
    Manipulação de Strings no workbench
    Mais eficiente do que realizar as operações fora, o banco não precisa mandar todas informações para serem processadas
   
    Atneção: os indices no mysql começam a partir do 1
*/

SELECT LEFT('Banco de dados', 4); -- seleciona a partir da esquerda
SELECT RIGHT('Banco de dados', 4); -- seleciona a partir da direita

SELECT  substring('Banco de dados', 4) 'substring', -- seleciona até o quarto índice
        substring('Banco de dados', 4, 2) 'substring', -- ?
        length('Banco de dados') 'length', -- Retorna a quantidade de caracteres
        locate('o', 'Banco de dados') 'locate', -- Localiza o caracter específico
        reverse('Banco de dados') 'reverse', -- Mostra a string reversa
        concat('Banco', ' ', 'de', '', 'dados') 'concat'; -- Concatena a string
       
SELECT left(substring('banco de dados', 4, 10), 5);

USE bd2025;

SELECT clinome,
left(clinome, locate(' ', clinome) -1) 'left', -- -1 para pegar o nome sem o caracter espaço
length(left(clinome, locate(' ', clinome)-1)) 'tamanho'
FROM cliente;

-- Mostra apenas os primeiros nomes
SELECT funnome,
    left(funnome, locate(' ', funnome)-1) 'Primeiro nome'
from funcionario
left outer join venda on funcodigo = venfuncodigo
where vencodigo is null;
