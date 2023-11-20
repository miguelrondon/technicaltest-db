create procedure sp_createPolicy
(

in customerId bigint,
in branchGroupId integer,
inout vigencyStartDate datetime,
inout vigencyEndDate datetime,
out policyNumber varchar(20)
)
begin
	
    set policyNumber = (select CONCAT(branchGroupId,  '-' ,  FLOOR(1 + RAND() * 999)));  
    
insert into policy ( customerId, policyNumber, branchGroupId, vigencyStartDate, vigencyEndDate) 
values ( customerId, policyNumber, branchGroupId, vigencyStartDate, vigencyEndDate); 

end

 


