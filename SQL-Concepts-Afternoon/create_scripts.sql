create table category (
	category_code varchar(3) not null,
    category_name varchar(10) not null,
    primary key(category_code)
);
create table product (
	product_code varchar(3) not null,
    category_code varchar(3) not null,
    product_name varchar(10) not null,
    unit_price decimal(5, 2) not null,
    primary key(product_code)
);
create table customer (
	customer_id varchar(3) not null,
    location_code varchar(3) not null,
    name varchar(20) not null,
    date_born date not null,
    gender char(1) not null,
    mobile_no VARCHAR(10) not null,
    primary key(customer_id)
);
create table location (
	location_code varchar(3) not null,
    location_name varchar(10) not null,
    primary key(location_code)
);
create table sales_executive (
	sales_exec_id varchar(3) not null,
    name varchar(20) not null,
    date_born date,
    gender char(1) not null,
    primary key(sales_exec_id)
);
create table purchases (
	customer_id varchar(3) not null,
    product_code varchar(3) not null,
    sales_exec_id varchar(3) not null,
    purchase_date date not null,
    units integer not null,
    primary key(customer_id, product_code, sales_exec_id)
);
create table sale_locations (
	sales_exec_id varchar(3) not null,
    location_code varchar(3) not null,
    primary key(sales_exec_id, location_code)
);
alter table sales_executive modify date_born date not null;
alter table sales_executive modify mobile_no varchar(10) not null;

alter table product add check (unit_price >= 0.0);
alter table customer add check (gender in ('M', 'F', 'O'));
alter table sales_executive add check (gender in ('M', 'F', 'O'));
alter table purchases add check (units > 0);

alter table product add foreign key (category_code) references category(category_code);
alter table customer add foreign key (location_code) references location(location_code);
alter table purchases add foreign key (customer_id) references customer(customer_id);
alter table purchases add foreign key (product_code) references product(product_code);
alter table purchases add foreign key (sales_exec_id) references sales_executive(sales_exec_id);
alter table sale_locations add foreign key (sales_exec_id) references sales_executive(sales_exec_id);
alter table sale_locations add foreign key (location_code) references location(location_code);

insert into category values ('C01', 'Icecreams');
insert into category values ('C02', 'Chocolates');
insert into category values ('C03', 'Beverages');
insert into category values ('C04', 'Tiffin');

insert into product values ('P01', 'C01', 'Vanilla', 10.00);
insert into product values ('P02', 'C01', 'Choco', 15.00);
insert into product values ('P03', 'C04', 'Chapati', 5.00);
insert into product values ('P04', 'C03', 'Tea', 10.00);

insert into location values ('L01', 'Chennai');
insert into location values ('L02', 'Hyderabad');
insert into location values ('L03', 'Delhi');
insert into location values ('L04', 'Bangalore');

insert into customer values ('CU1', 'L01', 'Sreeram', '2000-03-28', 'M', '9876543210');
insert into customer values ('CU2', 'L01', 'Sreeja', '1999-03-28', 'F', '9776543210');
insert into customer values ('CU3', 'L04', 'Raiza', '2000-01-28', 'F', '9875543210');
insert into customer values ('CU4', 'L01', 'Rohini', '1987-04-19', 'M', '9876548210');
insert into customer values ('CU5', 'L02', 'Daniel', '2001-01-26', 'M', '9886543219');

insert into sales_executive values ('S01', 'Roger', '2000-03-01', 'M');
insert into sales_executive values ('S02', 'Gayatri', '1998-02-28', 'F');
insert into sales_executive values ('S03', 'Johnny', '1977-03-02', 'O');
insert into sales_executive values ('S04', 'Carol', '2000-03-01', 'F');
insert into sales_executive values ('S05', 'Roger', '2000-03-01', 'M');

insert into purchases values('CU1', 'P01', 'S02', '2021-01-08', 5);
insert into purchases values('CU2', 'P01', 'S03', '2021-01-09', 5);
insert into purchases values('CU3', 'P02', 'S02', '2021-01-10', 10);
insert into purchases values('CU2', 'P01', 'S01', '2021-01-09', 12);
insert into purchases values('CU2', 'P03', 'S02', '2020-12-08', 11);

insert into sale_locations values ('S01', 'L01');
insert into sale_locations values ('S02', 'L01');
insert into sale_locations values ('S02', 'L02');
insert into sale_locations values ('S03', 'L01');
insert into sale_locations values ('S03', 'L02');

