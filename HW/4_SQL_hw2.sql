--Создать таблицу employees
--- id. serial,  primary key,
--- employee_name. Varchar(50), not null
--Наполнить таблицу employee 70 строками.

create table employees (
	id serial primary key,
	employee_name varchar(50) not null
);

insert into employees(employee_name)
values  ('Egor Kotov'),
		('Sergey Kartauz'),
		('Stanislav Budnukov'),
		('Alena Ignatenko'),
		('Svetlana Schischko'),
		('Ivan Zaharov'),
		('Vitali Pokachev'),
		('Eduardo Chachin'),
		('Rafael Garaev'),
		('Igor Gavrilenko'),
		('Igor Nikonov'),
		('Vasilii Drobishevski'),
		('Denis Haretdinov'),
		('Ruslan Lepiruhin'),
		('Viktor Zaec'),
		('Slava Murzakaev'),
		('Slava Kiryachkov'),
		('Sergry Firsev'),
		('Andrei Korohov'),
		('Daniil Dolgopolov'),
		('Andrei Solomati'),
		('Artur Novikov'),
		('Anatoli Melnichenko'),
		('Vladimir Pupkin'),
		('Evgenio Trupochov'),
		('Vladimir Malik'),
		('Alena Kurmechova'),
		('Maria Shcatula'),
		('Iana Fomenkovs'),
		('Angelina Kosturina'),
		('Nelia Prutnikola'),
		('Galina Takina'),
		('Vladimer Tashkinov'),
		('Ramil Hafizov'),
		('Dmitrii Pishkin'),
		('Dmitrii Lebed'),
		('Dmitrii Rilskih'),
		('Egor Kolesnikov'),
		('Anton Tanadgi'),
		('Aleksandr Deina'),
		('Oleg Lomatchenko'),
		('Aleksandr Sharov'),
		('Oleg Tinkov'),
		('Oleg Nekrasov'),
		('Aleksandr Korabeinokov'),
		('Denis Sankov'),
		('Taras Moroz'),
		('Anatolii Vermenko'),
		('Denis Paleckih'),
		('Vladimir Mototin'),
		('Adrei Ovchinikov'),
		('Arsenii Enikeev'),
		('Margarita Telenchenko'),
		('Timofei Pasuta'),
		('Andrei Larichev'),
		('Anatolii Karmanov'),
		('Vlavimir Treyv'),
		('Rinat Batirkaev'),
		('Andrei Rudenko'),
		('Roman Hrapko'),
		('Oksana Lisok'),
		('Evgenii Stupakov'),
		('Alexsandr Lymin'),
		('Igor Kononov'),
		('Denis Urmanov'),
		('Rustam Zainulin'),
		('Ekaterina Krasinskaia'),
		('Svetlana Salevich'),
		('Vadim Galiev'),
		('Evgenii Zadarognii');
 

--Создать таблицу salary
--- id. Serial  primary key,
--- monthly_salary. Int, not null
--Наполнить таблицу salary 15 строками:
--- 1000
--- 1100
--- 1200
--- 1300
--- 1400
--- 1500
--- 1600
--- 1700
--- 1800
--- 1900
--- 2000
--- 2100
--- 2200
--- 2300
--- 2400
--- 2500

create table salary (
	id serial primary key,
	monthly_salary int not null
);

insert into salary(monthly_salary)
values  (1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500);
	

--Создать таблицу employee_salary
--- id. Serial  primary key,
--- employee_id. Int, not null, unique
--- salary_id. Int, not null
--Наполнить таблицу employee_salary 40 строками:
--- в 10 строк из 40 вставить несуществующие employee_id

create table employee_salary (
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);		

insert into employee_salary(employee_id, salary_id) 
values (10, 1),
		(11,2),
		(12, 3),
		(14, 4),
		(15, 5),
		(16, 6),
		(17, 7),
		(18, 8),
		(19, 9),
		(20, 10),
		(21, 11),
		(22, 12),
		(23, 13),
		(24, 14),
		(25, 15),
		(26, 15),
		(27, 14),
		(28, 13),
		(29, 12),
		(30, 11),
		(31, 10),
		(32, 9),
		(33, 8),
		(34, 7),
		(35, 5),
		(36, 4),
		(37, 3),
		(38, 2),
		(39, 1),
		(40, 4),
		(71, 1),
		(72,2),
		(73,10),
		(74,11),
		(75,12),
		(76,13),
		(77,9),
		(78,8),
		(79,6),
		(80,5);
	
	
--Создать таблицу roles
--- id. Serial  primary key,
--- role_name. int, not null, unique
--Поменять тип столба role_name с int на varchar(30)
--Наполнить таблицу roles 20 строками:

create table roles (
	id serial primary key,
	role_name int not null unique
);

alter table roles
alter column role_name type varchar(30);

insert into roles(role_name)
values ('Junior Python developer'),
	   ('Middle Python developer'),
	   ('Senior Python developer'),
	   ('Junior Java developer'),
	   ('Middle Java developer'),
	   ('Senior Java developer'),
	   ('Junior JavaScript developer'),
	   ('Middle JavaScript developer'),
	   ('Senior JavaScript developer'),
	   ('Junior Manual QA engineer'),
	   ('Middle Manual QA engineer'),
	   ('Senior Manual QA engineer'),
	   ('Project Manager'),
	   ('Designer'),
	   ('HR'),
	   ('CEO'),
	   ('Sales manager'),
	   ('Junior Automation QA engineer'),
	   ('Middle Automation QA engineer'),
	   ('Senior Automation QA engineer');
	   

--Создать таблицу roles_employee
--- id. Serial  primary key,
--- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
--Наполнить таблицу roles_employee 40 строками:

create table roles_employee(
	    id serial primary key,
	   employee_id int not null unique,
	   role_id int not null,
	   foreign key (employee_id)
	   references employees(id),
	   foreign key (role_id)
	   references roles(id)
	  );
	 
insert into roles_employee(employee_id, role_id)
values (1, 20),
	   (2, 19),
	   (3, 18),
	   (4, 17),
	   (5, 16),
	   (6, 15),
	   (7, 14),
	   (8, 13),
	   (9, 12),
	   (10, 11),
	   (11, 10),
	   (12, 9),
	   (13, 8),
	   (14, 7),
	   (15, 6),
	   (16, 5),
	   (17, 4),
	   (18, 3),
	   (19, 2),
	   (20, 1),
	   (21, 1),
	   (22, 2),
	   (23, 3),
	   (24, 4),
	   (25, 5),
	   (26, 6),
	   (27, 7),
	   (28, 8),
	   (29, 9),
	   (30, 10),
	   (31, 11),
	   (32, 12),
	   (33, 13),
	   (34, 14),
	   (35, 15),
	   (36, 16),
	   (37, 17),
	   (38, 18),
	   (39, 19),
	   (40, 15);
	   			
