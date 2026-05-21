create schema university;
create table university.students
(
    student_id serial primary key,
    first_name varchar(50)         not null,
    last_name  varchar(50)         not null,
    email      varchar(100) unique not null,
    birth_date date
);
create table university.courses
(
    course_id   serial primary key,
    course_name varchar(100) not null,
    credits     int
);
create table university.enrollments
(
    enrollment_id serial primary key,
    student_id    int references university.students(student_id),
    course_id     int references university.courses(course_id),
    enroll_date date
);
alter table university.students
    add constraint birth_date_check check (
        extract(year from age(current_date,birth_date))>18
        );
drop table university.enrollments;
drop table university.courses;
drop table university.students;
