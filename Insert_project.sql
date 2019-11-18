
-- id, Name, Rate, prefered_subject, Contact_Method
INSERT INTO `Tutors` VALUES
('02', 'Jackson', '17.00', 'Anthropology', 'Email: BunchesofHunches3.14@mysteryInc.com'),
('03', 'Thelma', '21.00', 'Writting', 'Phone: 998-656 8169'),
('04', 'Amanda', '25.00', 'Economics', 'Email: whoneedsAmanDuh@pixie.org'),
('05', 'Mark', '19.45', 'Math,Statistics', 'Phone: 556-214-7845');


-- Location id, Name, Room, Building, Operating_hours

INSERT INTO Location VALUES
('44', 'LINC 111', '111', 'LINC', '8:00-17:00'),
('45', 'JOHNSON 456', '456', 'JOHNSON', '9:00-18:00'),
('46', 'KERR 212', '212', 'KERR Admin', '7:00-18:00'),
('47', 'MU 115', '115', 'Memorial Union', '8:00-22:00');


-- sessions id, Time, Rating, Lodcation-id, Student_id, Tutor_id
INSERT INTO Sessions VALUES
('27', '12:00-13:00', 'Great', '44', '84', '02'),
('28', '14:30-16:30', 'alright', '47', '83', '01'),
('22', '18:00-20:00', 'Yes', '46', '82' , '04'),
('23', '10:00-12:15', 'AMAZING!!!!!!!!!!!!', '45', '81', '05');

--Students ID, NAME,
INSERT INTO `Students` VALUES
('81', 'Susan', 'tickeledPink@yahoo.com', 'Email: tickeledPink@yahoo.com'),
('82', 'Rodger', 'whatdidIdoWrong@aol.com', 'Phone: 998-656 8169'),
('83', 'Crystal', 'fluffybunny45@gmail.com', 'Email: fluffybunny45@gmail.com'),
('84', 'Levi', 'bonesL@oregonstate.edu', 'Phone: 556-214-7845');

-- Student Courses Course ID, Student ID
INSERT INTO `Student_Courses` VALUES
('71', '84'),
('72', '82'),
('73', '81'),
('74', '83');


-- Course ID, name, Subject, Difficulty
INSERT INTO `Course` VALUES
('71', 'Intro To Math', 'MATH', '200'),
('72', 'Spelling 101', 'ENGLISH', '100'),
('73', 'Macro Economics', 'ECONOMICS', '400'),
('74', 'Cellular Biology', 'BIOLOGY', '500');


-- Prerequisites Course ID, Prerequ ID
INSERT INTO `Course` VALUES
('71', '72'),
('72', '74'),
('73', '71'),
('74', '');