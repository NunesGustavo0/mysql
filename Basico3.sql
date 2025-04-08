-- Mínimo e máximo
select clinome, clifone, clibaicodigo, min(clirendamensal) -- min retorna o valor mínimo, max o valor máximo 
from cliente
where clisexo = 'f';

select max(clirendamensal) as maior_renda from cliente;

select count(clirendamensal) from cliente where clirendamensal > 4000; -- COUNT conta

select clinome, clibaicodigo, avg(clirendamensal) from cliente; -- AVG valor médio

select sum(clirendamensal) from clientes where clirendamensal > 4000; -- SUM = soma
/*
LIKE Operator 			Description
WHERE CustomerName LIKE 'a%' 	Finds any values that start with "a"
WHERE CustomerName LIKE '%a' 	Finds any values that end with "a"
WHERE CustomerName LIKE '%or%' 	Finds any values that have "or" in any position
WHERE CustomerName LIKE '_r%' 	Finds any values that have "r" in the second position
WHERE CustomerName LIKE 'a_%' 	Finds any values that start with "a" and are at least 2 characters in length
WHERE CustomerName LIKE 'a__%' 	Finds any values that start with "a" and are at least 3 characters in length
WHERE ContactName LIKE 'a%o' 	Finds any values that start with "a" and ends with "o"
*/


select clinome, clibaicodigo, clisexo from cliente where clinome like 'a%';

select * from zona where zoncidcodigo in (select cidcodigo from cidade);

select * from filial where filbaicodigo in (1, 2);
