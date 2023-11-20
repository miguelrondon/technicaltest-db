create procedure sp_createPolicy_item_vehicle(
in policyNumber varchar(20) ,
in brandId integer ,
in modelId integer ,
in modelyear integer ,
in vinNumber varchar(50) ,
in placa varchar(15)
)
begin
	insert into policy_items_vehicles (policyNumber, brandId, modelId, modelyear, vinNumber, placa) 
    values(policyNumber, brandId, modelId, modelyear, vinNumber, placa );
end

