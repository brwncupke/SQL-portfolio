use HR;

create table regions (
	region_id int identity(1,1) primary key,
	region_name varchar(25) default null
);

create table countries
(
	country_id CHAR(2) primary key,
	country_name varchar(40) default null,
	region_id int not null,
	foreign key (region_id) references regions (region_id)
);
create table locations
(
	location_id int identity(1,1) primary key,
	street_address varchar (40) default null,
	postal_code varchar (12) default null,
	city varchar(30) not null,
	state_province varchar(25) default null,
	country_id char(2) not null,
	foreign key (country_id) references countries (country_id)
);

create table jobs(
    job_id int identity(1,1) primary key,
	job_title varchar(35) not null,
	min_salary decimal(8,2) default null,
	max_salary decimal(8,2) default null
);

create table departments(
	department_id int identity(1,1) primary key,
	department_name VARCHAR (30) NOT NULL,
	location_id int default null,
	foreign key (location_id) references locations (location_id)
);

CREATE TABLE employees (
	employee_id INT IDENTITY(1,1) PRIMARY KEY,
	first_name VARCHAR (20) DEFAULT NULL,
	last_name VARCHAR (25) NOT NULL,
	email VARCHAR (100) NOT NULL,
	phone_number VARCHAR (20) DEFAULT NULL,
	hire_date DATE NOT NULL,
	job_id INT NOT NULL,
	salary DECIMAL (8, 2) NOT NULL,
	manager_id INT DEFAULT NULL,
	department_id INT DEFAULT NULL,
	foreign key (job_id) references jobs (job_id),
	foreign key (department_id) references departments (department_id),
	foreign key (manager_id) references employees (employee_id),
);

CREATE TABLE dependents (
	dependent_id INT IDENTITY(1,1) PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	relationship VARCHAR (25) NOT NULL,
	employee_id INT NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees (employee_id) 
);