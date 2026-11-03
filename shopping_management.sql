drop database if exists shopping_management;
create database shopping_management;
use shopping_management;

create table customers(
         customers_id int primary key auto_increment,
         customer_name varchar(100) not null,
         email varchar(100) unique,
         phone_number varchar(10) not null,
         age tinyint unsigned check(age>0),
         gender enum('male','female','others') default 'male',
         country varchar(50) default 'india',
         city varchar(20) default 'delhi',
         pincode varchar(6) default '201301',
         registration_date date default(current_date),
         registration_time time default (current_time),
         created_at timestamp default (current_timestamp),
         address varchar(250) not null,
         customer_status enum('active','inactive','blocked') default 'active',
         customer_notes tinytext);
         
show create table customers;
select *from customers;

insert into customers(customer_name ,email, phone_number,age,gender,address,customer_status)values

('vaishnavi','vaishu@gmail.com','9989657784',23,'female','rohini','active'),
('radhika','radhika@gmail.com','9989657734',24,'female','bareliy','inactive'),
('kartik','kartik@gmail.com','9989657456',26,'male','vasant kunj','inactive'),
('kunal','kunal@gmail.com','9989657423',28,'male','preet vihar','active'),
('kajol','kajol@gmail.com','9989657678',23,'female','kirti nagar','inactive');


alter table customers
drop check customers_chk_1;

alter table customers add constraint chk_age check (age >=0);

create table orders(
     order_id int primary key auto_increment,
     customers_id int,
     order_date date default (current_date),
     order_amount decimal(10,2) not null,
     order_status enum('pending','processing','shipped','delivered','cancelled') default 'pending',
     payment_method enum('cash','card','upi','net banking'),
     payment_status enum('pending','paid','failed') default 'pending',
     shipping_address varchar(250) not null,
     delivery_pincode varchar(6),
     quantity int unsigned check (quantity > 0),
     discount_amount decimal (10,2),
     delivery_date date default (current_date),
     created_at timestamp default (current_timestamp),
     tracking_number varchar(30) default 'not null',
	 delivery_status  enum('not dispatched','in transit','delivered','returned') default 'not dispatched',
     order_notes  tinytext, 
     foreign key (customer_id) references customers(id) on delete cascade,
     foreign key (customer_id) references customers(id) on update cascade
     );
     
show create table orders;

select * from orders;

insert into orders(order_amount,order_status,payment_method,payment_status,shipping_address,delivery_pincode,discount_amount,tracking_number,delivery_status,order_notes)
values

('23.56','shipped','cash','pending','vasantkunj','110056','50.89','3457869','not dispatched','thankyou for your order'),
('28.23','cancelled','card','paid','kirti nagar','11045','30.89','3453459','delivered','thankyou for your order'),
('24.89','pending','upi','failed','preet vihar','200056','20.89','3457567','in transit','thankyou for your order'),
('89.12','shipped','cash','pending','janakpuri','190056','50.89','3453452','returned','thankyou for your order'),
('48.34','cancelled','card','paid','south ex','129056','45.89','2356790','not dispatched','thankyou for your order'),
('67.45','shipped','upi','paid','rohini','112056','80.89','3455678','returned','thankyou for your order');


use shopping_management;
show tables;

describe customers;
describe orders;






