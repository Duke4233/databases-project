CREATE TABLE `Tutor` (
    `id` INT NOT NULL,
    `Name` varchar(255) NOT NULL,
    `Rate` FLOAT NOT NULL,
    `Prefered_Subject` varchar(255) DEFAULT NULL,
    `Contact_Method` varchar(255) NOT NULL
);

ALTER TABLE `Tutor` ADD PRIMARY KEY (`id`);



CREATE TABLE `Student` ( 
	`id` INT NOT NULL, 
	`Name` varchar(255) NOT NULL, 
	`Email` varchar(255) NOT NULL, 
	`Contact_Method` varchar(255) NOT NULL 
);

ALTER TABLE `Student` ADD PRIMARY KEY (`id`);



CREATE TABLE `Course` ( 
	`id` INT NOT NULL, 
	`Name` varchar(255) NOT NULL, 
	`Subject` varchar(255) NOT NULL, 
	`Difficulty` INT DEFAULT NULL
);

ALTER TABLE `Course` ADD PRIMARY KEY (`id`);



CREATE TABLE `Prerequisite` ( 
    `course_id` INT NOT NULL,
    `prerequisite_id` INT NOT NULL
);

ALTER TABLE `Prerequisite` ADD CONSTRAINT fk_prerequisite_course_id FOREIGN KEY (prerequisite_id) REFERENCES Course(id);
ALTER TABLE `Prerequisite` ADD CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES Course(id);



CREATE TABLE `Student_Courses` ( 
    `course_id` INT NOT NULL,
    `student_id` INT NOT NULL
);

ALTER TABLE `Student_Courses` ADD CONSTRAINT fk_course_student_id FOREIGN KEY (course_id) REFERENCES Course(id);
ALTER TABLE `Student_Courses` ADD CONSTRAINT fk_student_id FOREIGN KEY (student_id) REFERENCES Student(id);



CREATE TABLE Location (
    id INT NOT NULL,
    Name varchar(255) NOT NULL,
    Room varchar(128) NOT NULL,
    Building varchar(255) NOT NULL,
    Operating_Hours varchar(255) DEFAULT NULL,
    Address varchar(255) NOT NULL,
    PRIMARY KEY (id)
);



CREATE TABLE `Sessions` ( 
	`id` INT NOT NULL, 
	`Time` varchar(255) NOT NULL, 
	`Rating` varchar(255) DEFAULT NULL,
        `Location_id` INT NOT NULL,
	`Student_id` INT NOT NULL,
	`Tutor_id` INT NOT NULL
);

ALTER TABLE `Sessions` ADD PRIMARY KEY (`id`);
ALTER TABLE `Sessions` ADD CONSTRAINT fk_location_id FOREIGN KEY (Location_id) REFERENCES Location(id);
ALTER TABLE `Sessions` ADD CONSTRAINT fk_session_student_id FOREIGN KEY (Student_id) REFERENCES Student(id);
ALTER TABLE `Sessions` ADD CONSTRAINT fk_session_tutor_id FOREIGN KEY (Tutor_id) REFERENCES Tutor(id);