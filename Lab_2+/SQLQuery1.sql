use [Labs_6_sem]

create  table users(
	id int primary key,
	email varchar,
	password varchar,
	name varchar,
	time_registr timestamp
);
--

create table roles(
	id int primary key,
	role varchar
);
--

create table users_to_roles(
user_id int,
role_id int
);
--

create table friends(
user_first_id int,
user_second_id int);
--

create table albums(
id int primary key,
name varchar,
user_id int,
time_create timestamp
);
--

create table photos(
id int primary key,
path varchar,
descr varchar,
album_id int,
time_create timestamp);
--

create table dialogs(
id int primary key,
name varchar,
time_create timestamp);
--

create table users_to_dialogs(
user_id int,
dialog_id int);
--

create table messages(
id int primary key,
dialog_id int,
user_id int,
text text,
time_create timestamp);