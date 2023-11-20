create PROCEDURE `sp_createCustomer`(
in name varchar(50)
)
begin
	insert into customers(name) values(name);
end









