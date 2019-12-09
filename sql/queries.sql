-- At least one INSERT
INSERT INTO `Tutor` VALUES
('06', 'James', '23.00', 'Computer Science', 'Email: james@oregonstate.edu');


-- At least one UPDATE or DELETE
DELETE FROM `Tutor` WHERE id="06";


-- At least three SELECTs of which at least one involves multiple tables
SELECT name, rate FROM `Tutor` WHERE id="05";

SELECT name, subject, difficulty FROM `Course` WHERE subject="MATH";

SELECT Subject, Email FROM `Course`
INNER JOIN (SELECT * FROM `Student`
INNER JOIN `Student_Courses`
ON Student_Courses.student_id = Student.id) AS Student_Courses_Data
ON Student_Courses_Data.course_id = Course.id;


-- View, Trigger, Function or Procedure
CREATE VIEW session_location
AS 
SELECT Name, Room, Building, Operating_Hours, Address, Time, Rating, Student_id, Tutor_id FROM `Location`
INNER JOIN (SELECT * FROM Sessions) AS T3 
ON T3.location_id = Location.id;
-- This view is used to collate the sessions and their location information, so that you can potentially correlate session rating with location.


CREATE VIEW course_prereq_data
AS 
SELECT id AS course1_id, name AS course1_name, subject AS course1_subject, difficulty AS course1_difficulty,
course2_id, course2_name, course2_subject, course2_difficulty FROM Course
INNER JOIN (SELECT course_id AS other_id, id AS course2_id, name AS course2_name, subject AS course2_subject, difficulty AS course2_difficulty FROM Course
			INNER JOIN (SELECT * FROM Prerequisite) AS T2 ON Course.id = T2.prerequisite_id) AS T1
ON Course.id = other_id;
-- This view is used to gather all course prerequisite data together, so that you don't have to query for all that information directly.
