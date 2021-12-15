-- Selezionare tutti gli studenti nati nel 1990 
select name, surname, date_of_birth 
from students s 
where year (date_of_birth) = 1990
;

-- Selezionare tutti i corsi che valgono più di 10 crediti
select name, cfu 
from courses c 
where cfu > 10
;

-- Selezionare tutti gli studenti che hanno più di 30 anni
select name, surname, date_of_birth 
from students s 
where year (date_of_birth) < 1991
; 

-- Selezionare tutti i corsi di laurea magistrale
select id, name, level 
from degrees d 
where level= 'magistrale'
;

-- Da quanti dipartimenti è composta l’università?
select count(id) as departments_number
from departments d 
;

-- Quanti sono gli insegnanti che non hanno un numero di telefono
select count(phone) as teacher_having_phone
from teachers t 
;

-- Contare quanti iscritti ci sono stati ogni anno
select count(id) ,enrolment_date 
from students s 
group by year(enrolment_date) 
;

-- Calcolare la media dei voti di ogni appello d’esame
select avg(vote), exam_id 
from exam_student es
group by exam_id 
;

-- Contare quanti corsi di laurea ci sono per ogni dipartimento
select count(d.id) as number_of_courses,  de.name as department_name
from degrees d, departments de
where d.department_id = de.id 
group by department_id
;

-- 53 è il corso di economia (ctrl f nel database) 2 varianti
-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
select s.name, s.surname, d.id as id_degree
from students s, degrees d
where s.degree_id = d.id
having d.id=53
;
-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
select name, surname, degree_id 
from students s
where degree_id = 53
;

-- anche quello sopra poteva essere fatto in questo modo e questo come quello sopra
-- Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
select d2.name as 'degree', d.name as 'department'
from degrees d2, departments d
where d2.department_id=d.id
having d.name = 'Dipartimento di Neuroscienze'
;

-- Selezionare tutti i corsi in cui insegna Fulvio Amato
select t.name, t.surname, c.name as course_name
from teachers t, courses c, course_teacher ct 
where ct.course_id = c.id and ct.teacher_id = t.id 
having t.name = 'fulvio' and t.surname = 'amato'
;


-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
select s.surname, s.name,  d2.*, d.*
from students s, degrees d2 , departments d 
where s.degree_id = d2.id and d2.department_id=d.id 
order by s.surname, s.name asc
;

-- Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami
select count(s.id), s.id, s.name, s.surname, es.exam_id 
from students s, exam_student es
where es.student_id = s.id
group by s.id 
order by s.surname, s.name
;
