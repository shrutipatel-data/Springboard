USE springboardopt;

declare @v6 as varchar(255)
declare @v7 as varchar(255)

-- -------------------------------------
--SET @v1 = 1612521;
--SET @v2 = 1145072;
--SET @v3 = 1828467;
--SET @v4 = 'MGT382';
--SET @v5 = 'Amber Hill';
SET @v6 = 'MGT';
SET @v7 = 'EE';			  
--SET @v8 = 'MAT';

-- 5. List the names of students who have taken a course from department v6 (deptId), but not v7.
--SELECT * FROM Student, 
--	(SELECT studId FROM Transcript, Course WHERE deptId = @v6 AND Course.crsCode = Transcript.crsCode
--	AND studId NOT IN
--	(SELECT studId FROM Transcript, Course WHERE deptId = @v7 AND Course.crsCode = Transcript.crsCode)) as alias
--WHERE Student.id = alias.studId order by name;


select student.id, student.name, student.address, student.status 
from student inner join transcript 
on student.id = transcript.studid 
inner join course on course.crscode = transcript.crscode
where course.deptid = @v6 and course.deptid != @v7
order by name
