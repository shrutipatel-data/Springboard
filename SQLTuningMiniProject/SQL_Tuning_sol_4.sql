USE springboardopt;

declare @v5 as varchar(255)
-- -------------------------------------
--SET @v1 = 1612521;
--SET @v2 = 1145072;
--SET @v3 = 1828467;
--SET @v4 = 'MGT382';
SET @v5 = 'Amber Hill';
--SET @v6 = 'MGT';
--SET @v7 = 'EE';			  
--SET @v8 = 'MAT';

-- 4. List the names of students who have taken a course taught by professor v5 (name).
--SELECT name FROM Student,
--	(SELECT studId FROM Transcript,
--		(SELECT crsCode, semester FROM Professor
--			JOIN Teaching --on professor.id = teaching.profId
--			WHERE Professor.name = 'Amber Hill'
--			 AND professor.id = teaching.profId) as alias1
--	WHERE Transcript.crsCode = alias1.crsCode AND Transcript.semester = alias1.semester) as alias2
--WHERE Student.id = alias2.studId;

-- MGT382	F350

--update transcript 
--set semester = 'F350'
--where crscode = 'MGT382' and semester = 'F427'

select *
from professor P
inner join teaching t on p.id = t.profid
left join transcript trans on t.crscode = trans.crscode and t.semester = trans.semester
inner join student s on s.id = trans.studid
where p.name = 'Amber Hill'




		


