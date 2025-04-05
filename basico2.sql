select bainome, baicodigo from bairro;

select distinct bainome, baicodigo from bairro;

select count(distinct baizoncodigo) from bairro;

select baiqtdepessoas from bairro
where baicodigo = 2;

select * from bairro
where bainome = 'centro';
/*
= - Equal
> - Greater than
< - Less than
>= - Greater than or equal
<= - Less than or equal
<> - Not equal(maybe can be !=)
BETWEEN - between a certain range
LIKE - Search for a pattern
IN - To specify multiple possible values for a column
*/

SELECT clicodigo, clinome
from cliente
where clirendamensal > 4000 and clisexo = 'f';

SELECT clicodigo, clinome, clirendamensal
from cliente
where clirendamensal > 4000 or clirendamensal <1300;

SELECT clicodigo, clinome, clirendamensal
from cliente
where not clirendamensal < 4000;

SELECT clicodigo, clinome, clirendamensal
from cliente
where clisexo = 'f' and (clirandamensal > 4000 or clirendamensal < 1250);

SELECT clicodigo, clinome, clirendamensal
from cliente
where not clirendamensal < 4000
order by clicodigo ASC;

SELECT clicodigo, clinome, clirendamensal
from cliente
where not clirendamensal < 4000
order by clicodigo DESC;

select * from bairro order by baizoncodigo ASC, baicodigo DESC;

SELECT column_names
FROM table_name
WHERE column_name IS NULL; 

select * from cliente limit 3; -- mostra 3 atributos

select * from cliente limit 3 offset 3; -- mostra 3 a partir do quarto

