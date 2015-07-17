--creating database

create  database test_management;

---creating tables

create table users_tab(id int not null auto_increment, username char(25) not null, password char(15) not null, utype boolean, primary key(id));

create table questions_tab(id int not null auto_increment, question varchar(50) not null, primary key(id));

create table options_tab(id int not null auto_increment, answer varchar(40) not null, is_correct boolean not null, question_id int not null, primary key(id), foreign key(question_id) references questions_tab(id) on delete cascade);

create table tests_tab(id int not null auto_increment, test_no int not null, question_id int not null, primary key(id), foreign key(question_id) references questions_tab(id) on delete cascade);

create table answers_tab(id int not null auto_increment, user_id int not null, test_id int not null, answer int(11), duration int(3), primary key(id), foreign key(user_id) references users_tab(id), foreign key(test_id) references tests_tab(id)); 


-----inserting  into users_tab

insert into users_tab values(null, 'siddhant', 'siddhant',1);
insert into users_tab values(null, 'sid', 'sid', 0);
insert into users_tab values(null, 'damane', 'damane', 0);
insert into users_tab values(null, 'virat', 'virat', 0);
insert into users_tab values(null, 'sachin', 'sachin', 0);
insert into users_tab values(null, 'name', 'pass', 1);

----inserting into questions table

insert into questions_tab values(null, 'The DBMS acts as an interface between what two components of an enterprise-class database system?');
insert into questions_tab values(null, 'Which of the following products was an early implementation of the relational model developed by E.F. Codd of IBM?');
insert into questions_tab values(null, 'The following are components of a database except _');
insert into questions_tab values(null, 'An application where only one user accesses the database at a given time is an example of a(n) ');
insert into questions_tab values(null, 'An on-line commercial site such as Amazon.com is an example of a(n)');
insert into questions_tab values(null, 'Which of the following products was the first to implement true relational algebra in a PC DBMS?');
insert into questions_tab values(null, 'SQL stands for ________ .');
insert into questions_tab values(null, 'Because it contains a description of its own structure, a database is considered to be ________ .');
insert into questions_tab values(null, 'The following are functions of a DBMS except ________ .');
insert into questions_tab values(null, 'Helping people keep track of things is the purpose of a(n) ________ ');
insert into questions_tab values(null, 'Which of the following products implemented the CODASYL DBTG model?');
insert into questions_tab values(null, 'An Enterprise Resource Planning application is an example of a(n) ________ .');
insert into questions_tab values(null, 'A DBMS that combines a DBMS and an application generator is ________ .');


insert into options_tab values(null, 'Data and the database', 0, 1);
insert into options_tab values(null, 'Database application and SQL', 0, 1);
insert into options_tab values(null, 'The user and the database application', 0, 1);
insert into options_tab values(null, 'Database application and the database', 1, 1);
insert into options_tab values(null, 'IDMS', 0, 2), (null, 'DB2', 1, 2), (null, 'dBase-II', 0, 2), (null, 'R:base', 0, 2);
insert into options_tab values(null, 'reports', 1, 3), (null, 'metadata', 0, 3), (null, 'indexes', 0, 3);
insert into options_tab values(null, 'multiuser database application', 0, 4), (null, 'single-user database application', 1, 4);
insert into options_tab values(null, 'IDMS', 0, 5), (null, 'R:base', 1, 5);
insert into options_tab values(null, 'Structured Query Language', 1, 6), (null, 'Sequential Query Language', 0, 6);
insert into options_tab values(null, 'debug', 0, 7), (null, 'self-describing', 1, 7);
insert into options_tab values(null, 'processing data', 0, 8), (null, 'creating and processing forms', 1, 8);
insert into options_tab values(null, 'true', 1, 9), (null, 'false', 0, 9);
insert into options_tab values(null, 'instance', 0, 10), (null, 'database', 1, 10);
insert into options_tab values(null, 'DB2', 0, 11), (null, 'IDMS', 1, 11);
insert into options_tab values(null, 'e-commerce database application', 0, 12), (null, 'multiuser database application', 1, 12);
insert into options_tab values(null, 'Microsoft's Access', 1, 13), (null, 'Microsoft's SQL Server', 0, 13);



--inserting into tests_tab

insert into tests_tab values ('null',2,3);
insert into tests_tab values ('null',2,2); 
insert into tests_tab values ('null',2,1);
insert into tests_tab values ('null',1,1);
insert into tests_tab values ('null',1,2); 
insert into tests_tab values ('null',1,3);



--inserting into answers_tab


insert into answers_tab  select 'null','2',id,'9','2' from tests_tab where test_no = 1 AND question_id = 3;

insert into answers_tab  select 'null','3',id,'10','1' from tests_tab where test_no = 2 AND question_id = 3;

insert into answers_tab  select 'null','3',id,'6','1' from tests_tab where test_no = 2 AND question_id = 2;

insert into answers_tab  select 'null','2',id,'6','1' from tests_tab where test_no = 2 AND question_id = 2;

insert into answers_tab  select 'null','2',id,'9','1' from tests_tab where test_no = 2 AND question_id = 3;

insert into answers_tab  select 'null','2',id,'1','1' from tests_tab where test_no = 2 AND question_id = 1;


---selecting list of users with their marks 

select user_id,test_no,count(*) as marks from answers_tab as a,tests_tab t where 1 =  ( select is_correct from options_tab where id = a.answer ) and a.test_id = t.id group by user_id,test_no;


----creating view

CREATE OR REPLACE VIEW result_list AS select user_id,test_no,count(*) as marks from answers_tab as a,tests_tab t where 1 =  ( select is_correct from options_tab where id = a.answer ) and a.test_id = t.id group by user_id,test_no;


---pivote table


 DELIMITER //
CREATE PROCEDURE results() BEGIN SET @sql = NULL; 
	select group_concat(distinct concat( 'max(if(t.question_id = ''', question_id,''',
    '> a.answer,NULL))
    '> as', quote(question_id))) into @sql from answers_tab as a,tests_tab as t where a.test_id = t.id;
    
    
      set @sql = concat('select a.user_id,u.username,t.test_no,',@sql,'from answers_tab a,users_tab u,tests_tab t where a.test_id = t.id and a.user_id = u.id GROUP BY a.user_id,t.test_no'); 
      
      
      prepare statement from @sql; 
      
      
      execute statement;
      
      
       END//


 DELIMITER ;
 call results();







