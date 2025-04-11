/*
Triggers
	Gatilho
		eventos DML{inserts={new campo}, updates={new, old}, deletes={old}}

Tabela
	timing{before, after}
*/

use bd2025;

delimiter $$
create trigger tg_atualiza_bairro after update on cliente
for each row
begin
	if new.clibaicodigo != old.clibaicodigo then
		update bairro set beiqtdepessoas = beiqtdepessoas + 1
		where baicodigo = new.clibaicodigo;
		update bairro set beiqtdepessoas = beiqtdepessoas + 1
		where baicodigo = old.clibaicodigo;
	end if;
end$$
delimiter ;

select * from bairro;

update cliente
set clibaicodigo = 2
where clicodigo = 1;
'1', 'ADRIANÓPOLIS', '1', '10549'
	
delimiter $$
create trigger tg_monitora_preco before insert on produto
for each row
begin
	if new.procusto >= new.propreco then
		SIGNAL SQLSTATE '855555' SET MESSAGE_TEXT = 'Erro! Custo maior ou igual ao produto';
    end if;
end$$
delimiter ;
