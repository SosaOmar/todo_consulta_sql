CREATE TABLE "users" (
  "user_id" uuid PRIMARY KEY,
  "user_name" varchar NOT NULL,
  "user_email" varchar NOT NULL,
  "user_password" varchar NOT NULL,
  "user_age" int,
  "role_id" uuid NOT NULL
);

CREATE TABLE "courses" (
  "course_id" uuid PRIMARY KEY,
  "course_title" varchar NOT NULL,
  "course_description" varchar,
  "course_level" varchar NOT NULL,
  "teacher_user_id" uuid NOT NULL
);

CREATE TABLE "users_courses" (
  "user_course_id" uuid PRIMARY KEY,
  "user_code" uuid NOT NULL,
  "course_code" uuid NOT NULL
);

CREATE TABLE "courses_videos" (
  "course_video_id" uuid PRIMARY KEY,
  "course_video_title" varchar NOT NULL,
  "course_video_url" varchar NOT NULL,
  "course_code" uuid NOT NULL
);

CREATE TABLE "categories" (
  "categorie_id" uuid PRIMARY KEY,
  "categorie_name" varchar NOT NULL
);

CREATE TABLE "roles" (
  "role_id" uuid PRIMARY KEY,
  "role_name" varchar NOT NULL
);

CREATE TABLE "courses_categories" (
  "curse_categorie_id" uuid PRIMARY KEY,
  "curse_code" uuid NOT NULL,
  "categorie_code" uuid NOT NULL
);

ALTER TABLE "users_courses" ADD FOREIGN KEY ("course_code") REFERENCES "courses" ("course_id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("user_code") REFERENCES "users" ("user_id");

ALTER TABLE "courses_videos" ADD FOREIGN KEY ("course_code") REFERENCES "courses" ("course_id");

ALTER TABLE "courses_categories" ADD FOREIGN KEY ("curse_code") REFERENCES "courses" ("course_id");

ALTER TABLE "courses_categories" ADD FOREIGN KEY ("categorie_code") REFERENCES "categories" ("categorie_id");

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("role_id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_user_id") REFERENCES "users" ("user_id");


--//////////////////////// Inserción de datos ////////////////////////


--//////////////////////// Datos de roles ////////////////////////
insert into roles (
	role_id,
	role_name
)
values
(
	'20744075-d735-4024-80c3-beff9da7df03',
	'Student'
),(
	'5039f727-5eea-4299-a4b5-183e96bf48cd',
	'Teacher'
),(
	'c3b94dd2-987e-4579-b960-09050bf3dc3d',
	'Admin'
);



--//////////////////////// Datos de users ////////////////////////

insert into users (
	user_id,
	user_name,
	user_email,
	user_password,
	user_age,
	role_id 
)

values
	(
		'228ba974-b3e8-438a-9bf7-b80720414c53',
		'Omar',
		'Omar@example.com',
		'ErnestoPassword',
		20,
		'20744075-d735-4024-80c3-beff9da7df03'
	),(
		'67787e22-2baf-49fd-947e-b506fe07d6ad',
		'Aquino',
		'Aquino@example.com',
		'Password',
		21,
		'20744075-d735-4024-80c3-beff9da7df03'
	),(
		'dd85503d-0422-4936-8e5c-875dccece844',
		'Pepe',
		'Pepe@example.com',
		'PepePassword',
		22,
		'20744075-d735-4024-80c3-beff9da7df03'
	),(
		'9dc2275b-3d3a-4a23-aac6-94ff0079bc51',
		'Juan',
		'Juan@example.com',
		'JuanPassword',
		23,
		'5039f727-5eea-4299-a4b5-183e96bf48cd'
	),(
		'e2f494c2-a933-460d-bbfd-7c1cc14af92b',
		'Rodolfo',
		'Rodolfo@example.com',
		'RodolfoPassword',
		24,
		'5039f727-5eea-4299-a4b5-183e96bf48cd'
	),(
		'16f8df61-af14-4376-adbc-fd0edb8852db',
		'Igancio',
		'Igancio@example.com',
		'IgancioPassword',
		25,
		'c3b94dd2-987e-4579-b960-09050bf3dc3d'
	),(
		'159fcca1-6427-4072-85f3-9fb785483a79',
		'Ernesto',
		'Ernesto@example.com',
		'ErnestoPassword',
		26,
		'c3b94dd2-987e-4579-b960-09050bf3dc3d'
	),(
		'18b67473-a4db-41cc-aa53-017b91ebdaa3',
		'Franco',
		'Franco@example.com',
		'FrancoPassword',
		27,
		'c3b94dd2-987e-4579-b960-09050bf3dc3d'
	);



--////////////////////////  Datos de cursos ////////////////////////
insert into courses (
	course_id,
	course_title,
	course_description,
	course_level,
	teacher_user_id
) values (
	'4bf1548b-b39d-47bf-902e-150711531c5c',
	'Como aprender HTML',
	'Aprenderas HTML',
	'basic',
	'9dc2275b-3d3a-4a23-aac6-94ff0079bc51'
),(
	'e1f3c439-112e-4f6b-a882-39bb5620b36d',
	'Como aprender Css',
	'Aprenderas Css',
	'medium',
	'9dc2275b-3d3a-4a23-aac6-94ff0079bc51'
),(
	'aec750a1-461c-453d-bb3a-357139fd9d9c',
	'Como manejar la frustracion de no entender nada sin llorar 3h en la esquina de tu cuarto (guia definitiva)',
	'te menti, no se puede',
	'advance',
	'e2f494c2-a933-460d-bbfd-7c1cc14af92b'
);

--//////////////////////// Datos de categories ////////////////////////

insert into categories (
	categorie_id,
	categorie_name
) values (
	'91a68f5c-b37f-4120-9613-1790e488031f',
	'HTML'
),(
	'fb481028-1f76-4553-9910-70f1a8a8e525',
	'CSS'
),(
	'05277b69-a270-48ed-abee-4452a425220e',
	'Psicologia'
);


--//////////////////////// Datos de courses_videos ////////////////////////

insert into courses_videos (
	course_video_id,
	course_video_title,
	course_video_url,
	course_code
) values (
	'4b065046-846e-452b-8409-497c3ec5dc04',
	'Html-Video',
	'Html/Video.url',
	'4bf1548b-b39d-47bf-902e-150711531c5c'
),(
	'94eb6a57-2ec8-41b5-8b58-b3a8502f5b1c',
	'Css-Video',
	'Css/Video.url',
	'e1f3c439-112e-4f6b-a882-39bb5620b36d'
),(
	'16483bf4-40e2-4cb6-89ae-f72b2426358c',
	'Como_no_llorar-Video',
	'Como/No/Llorar/Video.url',
	'aec750a1-461c-453d-bb3a-357139fd9d9c'
);

--//////////////////////// Datos de courses_categories ////////////////////////
insert into courses_categories (
	curse_categorie_id,
	curse_code,
	categorie_code
	) 
	values
(
	'c127798d-96c5-478a-bb13-fc20c5445da9',
	'4bf1548b-b39d-47bf-902e-150711531c5c',
	'91a68f5c-b37f-4120-9613-1790e488031f'
),(
	'1443ba0c-0789-463e-b6ac-c43784f8a8c2',
	'e1f3c439-112e-4f6b-a882-39bb5620b36d',
	'fb481028-1f76-4553-9910-70f1a8a8e525'
),(
	'9aa10dad-d7e5-4c13-9a2c-42bb0d58d23f',
	'aec750a1-461c-453d-bb3a-357139fd9d9c',
	'05277b69-a270-48ed-abee-4452a425220e'
);

--//////////////////////// Datos de users_courses ////////////////////////
insert into users_courses (
	user_course_id,
	user_code,
	course_code
) values (
	'3dbee030-0dcd-4f8b-bbd0-dbfe20423075',
	'67787e22-2baf-49fd-947e-b506fe07d6ad',
	'4bf1548b-b39d-47bf-902e-150711531c5c'
),(
	'37c738cd-df4e-4446-8914-f758a0374dee',
	'dd85503d-0422-4936-8e5c-875dccece844',
	'e1f3c439-112e-4f6b-a882-39bb5620b36d'
),(
	'a53e284b-3e38-40bb-a430-4061cb9a40b9',
	'228ba974-b3e8-438a-9bf7-b80720414c53',
	'aec750a1-461c-453d-bb3a-357139fd9d9c'
);

select users.user_name, courses.course_title from users inner join users_courses on users.user_id = users_courses.user_code inner join courses on users_courses.course_code = courses.course_id;