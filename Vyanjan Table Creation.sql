create table admin(
     admin_id int primary key AUTO_INCREMENT,
     admin_Name varchar(20),	
     admin_password varchar(20),
     admin_mobile bigint unique not null,
     admin_email varchar(50) unique not null);
 

create table customers(
     customer_id int  primary key AUTO_INCREMENT ,
     customer_name varchar(50) not null,
     customer_password varchar(20) not null,
     customer_mobile bigint unique not null,
     customer_email varchar(50) unique not null,
     admin_id int,     
     constraint customer_admin_id foreign key(admin_id) references admin(admin_id)
     on update cascade
     on delete cascade);



create table DelieveryAgents(
     DelieveryAgent_id int primary key AUTO_INCREMENT,
     DelieveryAgent_name varchar(50) not null,
     DelieveryAgent_password varchar(20) not null,
     DelieveryAgent_mobile bigint unique not null,
     DelieveryAgent_email varchar(50) unique not null,
     admin_id int,
     payment_id Bigint,
     constraint DelieveryAgent_admin_id foreign key(admin_id) references admin(admin_id)
     on update cascade
     on delete cascade,
     constraint DelieveryAgent_payment_id foreign key(payment_id) references payments(payment_id)
     on update cascade
     on delete cascade);

create table carts(
     cart_id int primary key  AUTO_INCREMENT,
     order_id int,
     food_id int,
     constraint cart_food_id foreign key(food_id) references foods(food_id)
       on update cascade
       on delete cascade,
     constraint cart_order_id foreign key(order_id) references orders(order_id)
       on update cascade
       on delete cascade);

create table orders(
     order_id int primary key  AUTO_INCREMENT,
     order_date DATETIME,
     order_address varchar(50) not null,
     order_status varchar(20) default "Placed",
     order_otp int unique not null,
     customer_id int,
     feedback_id int,
     constraint order_customer_id foreign key(customer_id) references customers(customer_id)
     on update cascade
     on delete cascade,
     constraint order_feedback_id foreign key(feedback_id) references feedbacks(feedback_id)
     on update cascade
     on delete cascade);


create table feedbacks(
     feedback_id int primary key AUTO_INCREMENT,
     feedback_desc varchar(50));

create table foods(
     food_id int primary key AUTO_INCREMENT,
     food_name varchar(50) not null,
     food_desc varchar(20) not null,
     food_price decimal(9,2) not null,
     food_qty int,
     admin_id int,
     constraint food_admin_id foreign key(admin_id) references admin(admin_id)
          on update cascade
          on delete cascade);


create table payments(
     payment_id Bigint primary key AUTO_INCREMENT,
     payment_type varchar(20) not null,
     cart_id int,
     wallet_id int,
     admin_id int,
     constraint payment_cart_id foreign key(cart_id) references carts(cart_id)
          on update cascade
          on delete cascade,
     constraint payment_wallet_id foreign key(wallet_id) references wallets(wallet_id)
          on update cascade
          on delete cascade,
     constraint payment_admin_id foreign key(admin_id) references admin(admin_id)
          on update cascade
          on delete cascade);

create table wallets(
     wallet_id int primary key AUTO_INCREMENT,
     wallet_balance decimal(9,2),
     wallet_points int);


create table vendors(
     vendor_id int primary key AUTO_INCREMENT ,
     vendor_name varchar(50) not null,
     vendor_password varchar(20) not null,
     vendor_mobile bigint unique not null,
     vendor_email varchar(50) unique not null,
     vendor_address varchar(50) not null,
     admin_id int,
     constraint vendor_admin_id foreign key(admin_id) references admin(admin_id)
     on update cascade
     on delete cascade);

create table stocks(
     stock_id int primary key AUTO_INCREMENT,
     stock_item varchar(20) not null,
     admin_id int,
     constraint stock_admin_id foreign key(admin_id) references admin(admin_id)
     on update cascade
     on delete cascade);


create table requirements(
     requirement_id int primary key AUTO_INCREMENT ,
     requirement_qty int not null,
     expected_price varchar (20) not null, 
     stock_id int,
     constraint requirement_stock_id foreign key(stock_id) references stocks(stock_id)
     on update cascade
     on delete cascade,
     admin_id int,
     constraint requirement_admin_id foreign key(admin_id) references admin(admin_id)
     on update cascade
     on delete cascade);

create table quotations(
     quotation_id int primary key AUTO_INCREMENT ,
     quotation_price decimal(9,2) not null, 
     vendor_id int,
     constraint quotation_vendor_id foreign key(vendor_id) references vendors(vendor_id)
     on update cascade
     on delete cascade,
     requirement_id int,
     constraint quotation_requirement_id foreign key(requirement_id) references requirements(requirement_id)
     on update cascade
     on delete cascade,
     admin_id int,
     constraint quotation_admin_id foreign key(admin_id) references admin(admin_id)
     on update cascade
     on delete cascade);







