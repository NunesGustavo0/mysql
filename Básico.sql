/*
Projeto: 
Pessoa com{
Nome
Sexo
Data de nascimento
Endereço
Comidas favoritas
}
*/
create table person
	(person_id SMALLINT UNSIGNED,
	fname VARCHAR(20),
    	lname VARCHAR(20), 
   	gender ENUM('M','F'), -- usado para restringir e aceitar apenas M ou F
    	birth_date DATE,
    	street VARCHAR(30),
    	city VARCHAR(20), 
    	state VARCHAR(20),
    	country VARCHAR(20),
    	postal_code VARCHAR(20),
    	CONSTRAINT pk_person PRIMARY KEY (person_id) -- CONSTRAINT == Restrição, usada para informar qual ou quais colunas serviram de chave primaria na tabela
);

DESC person;

CREATE TABLE favorite_food
	(person_id SMALLINT UNSIGNED,
	food VARCHAR(20),
	CONSTRAINT pk_favorite_food PRIMARY KEY (person_id, food),
	CONSTRAINT fk_fav_food_person_id FOREIGN KEY (person_id)
		REFERENCES person (person_id)
);

ALTER TABLE person MODIFY person_id SMALLINT UNSIGNED AUTO_INCREMENT;

INSERT INTO person
	(person_id, fname, lname, gender, birth_date)
	values(null, 'William', 'Turner', 'M', '1972-05-27');
	
SELECT person_id, fname, lname, gender, birth_date
FROM person
WHERE person_id = 1;

SELECT person_id, fname, lname, gender, birth_date
FROM person
WHERE lname = 'Turner';

INSERT INTO favorite_food(person_id, food)
VALUES(1, 'nachos');

SELECT food
FROM favorite_food
WHERE person_id = 1
ORDER BY food;

INSERT INTO person
	(person_id, fname, lname, gender, birth_date,
	street, city, state, country, postal_code)
	VALUES (null, 'Susan', 'Smith', 'F', '1975-11-02',
	'23 Maple St.', 'Arlington', 'VA', 'USA', '20220');

UPDATE person
SET street = '1235 Tremont St',
city = 'Boston',
state = 'MA',
country = 'USA',
postal_code = '02138'
WHERE person_id = 1;

DELETE FROM person
WHERE person_id = 2;

--Outra forma melhor de fazer update em data
UPDATE person
SET birth_date = str_to_date('DEC-21-1980', '%b-%d-%Y')
WHERE person_id = 1;
