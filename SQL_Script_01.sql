-- db생성,
create database depart_mnt;

-- DB 선택
use depart_mnt;

-- 물리 스키마
-- 테이블 생성

-- 학과 테이블 생성
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- 학생 테이블 생성
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact VARCHAR(15) NOT NULL,
    gender CHAR(1) NOT NULL,
    year INT NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
) ENGINE=InnoDB;

-- 코스 테이블 생성
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
) ENGINE=InnoDB;

-- 수강 테이블 생성
CREATE TABLE Enrollments (
    student_id INT,
    course_id INT,
    grade DECIMAL(4,2),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
) ENGINE=InnoDB;