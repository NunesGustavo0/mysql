/*
    Stored Procedures

DELIMITER $$ == delimitador de fim de comando
CREATE procedure SP_nome(paremetro1, parematro2)
    BEGIN
    ...
    ...
    ...
    END$$
DELIMITER;
*/

delimiter $$
create procedure sp_clientes_por_bairro(p_bairro varchar(30)) -- parametros sempre comaça com p
begin
    select bainome, clinome
    from bairro
    inner join cliente on baicodigo = clibaicodigo
    where bainome = p_bairro;
end$$
delimiter ;

drop procedure sp_clientes_por_bairro; -- Deve dar drop procedure, não adianta apenas mudar o código

call sp_clientes_por_bairro('cachoeirinha'); -- Qualquer bairro funciona

select bainome, clinome, clisexo, estdescricao
from bairro
inner join cliente on baicodigo = clibaicodigo
inner join estadocivil on estcodigo = cliestcodigo
where bainome = 'centro'
and clisexo = 'f'
and estdescricao = 'casado';
/*
    p_ = parametro
    v_ variavel
*/

-- Procedure com tratamento de erro
delimiter $$
create procedure sp_clientes__bairro_sex_estciv_val(p_bairro varchar(30),
                                                    p_sexo char(1),
                                                    p_est_civ varchar(40))
begin
    declare v_existe_bairro boolean default false; -- declarar variavel, sempre usar v_
   
    set v_existe_bairro = (select count(*) from bairro
                            where bainome = p_bairro); -- Verifica existencia do bairro
    if v_existe_bairro then -- if em mysql
        select bainome, clinome, clisexo, estdescricao
        from bairro
        inner join cliente on baicodigo = clibaicodigo
        inner join estadocivil on estcodigo = cliestcodigo
        where bainome = p_bairro
        and clisexo = p_sexo
        and estdescricao = p_est_civ;
    else
        select concat('O bairro ', p_bairro, ' não existe.') resposta;
    end if; -- todo if deve ter end if
end$$
delimiter ;

call sp_clientes__bairro_sex_estciv_val('coroado', 'm', 'casado');
