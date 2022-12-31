//trigger for customers
create table customers_before_delete (
     customer_id int,
     customer_name varchar(50),
     customer_password varchar(20),
     customer_mobile int,
     customer_email varchar(50));

delimiter //
 create trigger customers_before_delete before delete on customers
     for each row
     begin
     insert into customers_before_delete values(old.customer_id,old.customer_name,old.customer_password,old.customer_mobile,old.customer_email);
     end//
delimiter ;

create table customers_after_insert(
     customer_id int,
     customer_name varchar(50),
     customer_password varchar(20),
     customer_mobile int,
     customer_email varchar(50));

delimiter //
 create trigger customers_after_insert after insert on customers
     for each row
     begin
     insert into cust_after_insert values(new.customer_id,new.customer_name,new.customer_password, new.customer_mobile,customer_email);
     end//
delimiter ;
