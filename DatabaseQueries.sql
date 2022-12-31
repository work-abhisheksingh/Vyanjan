 //To modify column data type
 alter table admin
 modify column admin_mobile bigint;
 
//Initial value for auto-increement is not necessary :
 alter table customers
 modify column customer_mobile bigint;
 
 //delete row :
 delete from customers
    where customer_id=1;
 
 // alter auto-increment value
 ALTER TABLE customers AUTO_INCREMENT =1
