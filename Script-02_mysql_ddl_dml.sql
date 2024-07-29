-- db 생성, 
CREATE DATABASE depart_mnt;

-- DB 선택
use depart_mnt;

-- 테이블 생성
-- 학과 테이블
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- 학생 테이블
CREATE TABLE Students (
    std_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact VARCHAR(15) NOT NULL,
    gender CHAR(1) NOT NULL,
    std_year INT NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
) ;

-- 코스 테이블
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
) ;

-- 수강 테이블
CREATE TABLE Enrollments (
    std_id INT,
    course_id INT,
    grade DECIMAL(4,2),
    PRIMARY KEY (std_id, course_id),
    FOREIGN KEY (std_id) REFERENCES Students(std_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
) ;

-- 한 문장 실행 단축키 : ctrl + 엔터
-- 한꺼번에 실행하는 단축키  : 블록 설정 -> alt + x
-- 데이터 생성
-- 학과 데이터 
INSERT INTO Departments (department_id, department_name) VALUES
(1, '경영학과'),
(2, '컴퓨터공학과'),
(3, '경제학과'),
(4, '통계학과');

-- 학생 테이블
-- INSERT INTO Students (student_id, name, contact, gender, std_year, department_id) VALUES
-- (20230101, '홍길동', '010-0000-0000', '남', 4, 1),
-- (20230102, '성춘향', '010-1111-1111', '여', 4, 2),
-- (20230103, '김철수', '010-2222-2222', '남', 3, 3);

INSERT INTO Students (std_id, name, contact, gender, std_year, department_id) VALUES
(20230101, '홍길동', '010-0000-0000', '남', 4, 1),
(20230102, '성춘향', '010-1111-1111', '여', 4, 2),
(20230103, '김철수', '010-2222-2222', '남', 3, 3);

-- 코스 테이블
INSERT INTO Courses (course_id, course_name, department_id) VALUES
(1, '데이터베이스', 1),
(2, '알고리즘', 2)
(3, '웹프로그래밍', 3);

-- 수강 데이터
-- INSERT INTO enrollments (student_id, course_id, grade) VALUES
-- (20230101, 1, 85.6),
-- (20230102, 2, 95),
-- (20230103, 3, 95),
-- (20230101, 2, 80),
-- (20230103, 1, 100);

INSERT INTO enrollments (std_id, course_id, grade) VALUES
(20230101, 1, 85.6),
(20230102, 2, 95),
(20230103, 3, 95),



