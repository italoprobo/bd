select * from cliente
select * from pedido

delete from pedido where cod_pedido = 5 

insert into pedido values (6, 3, 'passagem de bus')

CREATE OR REPLACE FUNCTION atualizar_total_pedidos()
returns trigger as $$
begin 
	update cliente set total_pedidos = (select count(*) from pedido where id_cliente = new.id_cliente)
	where cod_cliente = new.id_cliente;
return new;
end;
$$ language plpgsql;

create trigger att_p_trigger
after insert on pedido for each row
execute procedure atualizar_total_pedidos();

create or replace function obter_quantidade_pedidos(id_clientes int) 
returns int as
$$
declare quantidade_pedidos int;
begin
	select count(*) into quantidade_pedidos 
	from pedido as pe
	where pe.id_cliente = id_clientes;
	
	return quantidade_pedidos;
end;
$$ language plpgsql

DROP FUNCTION obter_quantidade_pedidos(integer)

select obter_quantidade_pedidos(3);

create or replace function delete_funcao()
returns trigger as $$
	begin 
		update cliente set total_pedidos = (select count(*) from pedido where id_cliente = old.id_cliente)
		where cod_cliente = old.id_cliente;
	return null;
	end;
$$ language plpgsql

create or replace trigger delete_trigger
after delete on pedido
for each row
execute procedure delete_funcao()
