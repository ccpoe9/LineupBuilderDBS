#
# TABLE STRUCTURE FOR: leagues
#


INSERT INTO `leagues` (`league_id`, `name`) VALUES (1, 'qui');
INSERT INTO `leagues` (`league_id`, `name`) VALUES (2, 'voluptatem');
INSERT INTO `leagues` (`league_id`, `name`) VALUES (3, 'sapiente');
INSERT INTO `leagues` (`league_id`, `name`) VALUES (4, 'eos');
INSERT INTO `leagues` (`league_id`, `name`) VALUES (5, 'aperiam');



#
# TABLE STRUCTURE FOR: formations
#

INSERT INTO `formations` (`id`, `name`) VALUES (1, '2-1-1');
INSERT INTO `formations` (`id`, `name`) VALUES (2, '2-2');
INSERT INTO `formations` (`id`, `name`) VALUES (3, '1-1-2');
INSERT INTO `formations` (`id`, `name`) VALUES (4, '1-2-1');


#
# TABLE STRUCTURE FOR: teams
#

INSERT INTO `teams` (`teamid`, `name`, `formation`, `league`) VALUES (1, 'cumque', 1, 1);
INSERT INTO `teams` (`teamid`, `name`, `formation`, `league`) VALUES (2, 'omnis', 2, 2);
INSERT INTO `teams` (`teamid`, `name`, `formation`, `league`) VALUES (3, 'eveniet', 3, 3);
INSERT INTO `teams` (`teamid`, `name`, `formation`, `league`) VALUES (4, 'ducimus', 4, 4);
INSERT INTO `teams` (`teamid`, `name`, `formation`, `league`) VALUES (5, 'necessitatibus', 1, 5);
INSERT INTO `teams` (`teamid`, `name`, `formation`, `league`) VALUES (6, 'perferendis', 2, 1);
INSERT INTO `teams` (`teamid`, `name`, `formation`, `league`) VALUES (7, 'rerum', 3, 2);
INSERT INTO `teams` (`teamid`, `name`, `formation`, `league`) VALUES (8, 'sapiente', 4, 3);
INSERT INTO `teams` (`teamid`, `name`, `formation`, `league`) VALUES (9, 'eveniet', 1, 4);
INSERT INTO `teams` (`teamid`, `name`, `formation`, `league`) VALUES (10, 'veniam', 2, 5);
INSERT INTO `teams` (`teamid`, `name`, `formation`, `league`) VALUES (11, 'harum', 3, 1);
INSERT INTO `teams` (`teamid`, `name`, `formation`, `league`) VALUES (12, 'sed', 4, 2);
INSERT INTO `teams` (`teamid`, `name`, `formation`, `league`) VALUES (13, 'quasi', 1, 3);
INSERT INTO `teams` (`teamid`, `name`, `formation`, `league`) VALUES (14, 'quo', 2, 4);
INSERT INTO `teams` (`teamid`, `name`, `formation`, `league`) VALUES (15, 'dolores', 3, 5);
INSERT INTO `teams` (`teamid`, `name`, `formation`, `league`) VALUES (16, 'fuga', 4, 1);
INSERT INTO `teams` (`teamid`, `name`, `formation`, `league`) VALUES (17, 'ut', 1, 2);
INSERT INTO `teams` (`teamid`, `name`, `formation`, `league`) VALUES (18, 'eius', 2, 3);
INSERT INTO `teams` (`teamid`, `name`, `formation`, `league`) VALUES (19, 'et', 3, 4);
INSERT INTO `teams` (`teamid`, `name`, `formation`, `league`) VALUES (20, 'rerum', 4, 5);



#
# TABLE STRUCTURE FOR: coaches
#

DROP TABLE IF EXISTS `coaches`;

CREATE TABLE `coaches` (
  `coachid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `team` int(11) DEFAULT NULL,
  PRIMARY KEY (`coachid`),
  KEY `team_idx` (`team`),
  CONSTRAINT `coach_team` FOREIGN KEY (`team`) REFERENCES `teams` (`teamid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `coaches` (`coachid`, `firstname`, `lastname`, `team`) VALUES (1, 'Gunnar', 'Abshire', 1);
INSERT INTO `coaches` (`coachid`, `firstname`, `lastname`, `team`) VALUES (2, 'Alva', 'Konopelski', 2);
INSERT INTO `coaches` (`coachid`, `firstname`, `lastname`, `team`) VALUES (3, 'Lauren', 'Langosh', 3);
INSERT INTO `coaches` (`coachid`, `firstname`, `lastname`, `team`) VALUES (4, 'Taryn', 'Hagenes', 4);
INSERT INTO `coaches` (`coachid`, `firstname`, `lastname`, `team`) VALUES (5, 'Tanya', 'Ullrich', 5);
INSERT INTO `coaches` (`coachid`, `firstname`, `lastname`, `team`) VALUES (6, 'Pinkie', 'Abernathy', 6);
INSERT INTO `coaches` (`coachid`, `firstname`, `lastname`, `team`) VALUES (7, 'Madonna', 'Kreiger', 7);
INSERT INTO `coaches` (`coachid`, `firstname`, `lastname`, `team`) VALUES (8, 'Rosemary', 'Hyatt', 8);
INSERT INTO `coaches` (`coachid`, `firstname`, `lastname`, `team`) VALUES (9, 'Ezekiel', 'Kertzmann', 9);
INSERT INTO `coaches` (`coachid`, `firstname`, `lastname`, `team`) VALUES (10, 'Amina', 'Schiller', 10);
INSERT INTO `coaches` (`coachid`, `firstname`, `lastname`, `team`) VALUES (11, 'Johnathan', 'Kassulke', 11);
INSERT INTO `coaches` (`coachid`, `firstname`, `lastname`, `team`) VALUES (12, 'Robin', 'Swaniawski', 12);
INSERT INTO `coaches` (`coachid`, `firstname`, `lastname`, `team`) VALUES (13, 'Arvid', 'Lind', 13);
INSERT INTO `coaches` (`coachid`, `firstname`, `lastname`, `team`) VALUES (14, 'Catharine', 'Kerluke', 14);
INSERT INTO `coaches` (`coachid`, `firstname`, `lastname`, `team`) VALUES (15, 'Destinee', 'Weissnat', 15);
INSERT INTO `coaches` (`coachid`, `firstname`, `lastname`, `team`) VALUES (16, 'Horace', 'Jacobson', 16);
INSERT INTO `coaches` (`coachid`, `firstname`, `lastname`, `team`) VALUES (17, 'Davin', 'Kunze', 17);
INSERT INTO `coaches` (`coachid`, `firstname`, `lastname`, `team`) VALUES (18, 'Justina', 'Hahn', 18);
INSERT INTO `coaches` (`coachid`, `firstname`, `lastname`, `team`) VALUES (19, 'Claude', 'Hickle', 19);
INSERT INTO `coaches` (`coachid`, `firstname`, `lastname`, `team`) VALUES (20, 'Rozella', 'Barton', 20);



#
# TABLE STRUCTURE FOR: players
#


INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (1, 'Runolfsson', 'Trudie', 0, 61, 1);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (2, 'Weimann', 'Antonietta', 0, 84, 2);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (3, 'Dooley', 'Hermann', 0, 92, 3);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (4, 'Turcotte', 'Juvenal', 0, 88, 4);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (5, 'Bosco', 'Raegan', 0, 65, 5);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (6, 'Considine', 'Cory', 0, 96, 6);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (7, 'Cartwright', 'Douglas', 0, 82, 7);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (8, 'Krajcik', 'Hailey', 0, 62, 8);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (9, 'Pagac', 'Winnifred', 0, 90, 9);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (10, 'Steuber', 'Irwin', 0, 95, 10);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (11, 'Nolan', 'Eldred', 0, 96, 11);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (12, 'Boehm', 'Peter', 0, 61, 12);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (13, 'Johnston', 'Nathanial', 0, 89, 13);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (14, 'Kunde', 'Daren', 0, 69, 14);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (15, 'Smitham', 'Holden', 0, 96, 15);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (16, 'Willms', 'Brent', 0, 77, 16);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (17, 'Pacocha', 'Kiley', 0, 82, 17);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (18, 'Cummerata', 'Ava', 0, 65, 18);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (19, 'Pollich', 'Dorian', 0, 71, 19);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (20, 'Stanton', 'Marisol', 0, 65, 20);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (21, 'Hayes', 'Alberta', 0, 87, 1);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (22, 'Nienow', 'Yasmine', 0, 62, 2);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (23, 'Swaniawski', 'Emmanuelle', 0, 92, 3);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (24, 'Ruecker', 'Wilson', 0, 94, 4);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (25, 'Ryan', 'Nils', 0, 70, 5);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (26, 'Braun', 'Joe', 0, 88, 6);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (27, 'Larkin', 'Ryann', 0, 72, 7);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (28, 'Bashirian', 'Lupe', 0, 62, 8);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (29, 'Cormier', 'Elisabeth', 0, 77, 9);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (30, 'Gibson', 'Ila', 0, 99, 10);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (31, 'Maggio', 'Frieda', 0, 87, 11);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (32, 'Padberg', 'Joy', 0, 98, 12);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (33, 'Jaskolski', 'Kali', 0, 93, 13);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (34, 'Pollich', 'Gloria', 0, 61, 14);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (35, 'Rempel', 'Rodolfo', 0, 78, 15);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (36, 'Hoppe', 'Mabel', 0, 62, 16);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (37, 'Stamm', 'Marc', 0, 76, 17);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (38, 'Veum', 'Marty', 0, 78, 18);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (39, 'Kuvalis', 'Mazie', 0, 88, 19);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (40, 'Bruen', 'Sonny', 0, 91, 20);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (41, 'Klocko', 'Layla', 0, 79, 1);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (42, 'Wuckert', 'Sadie', 0, 84, 2);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (43, 'Kirlin', 'Vicky', 0, 88, 3);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (44, 'Brown', 'Marisa', 0, 74, 4);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (45, 'Goldner', 'Gardner', 0, 73, 5);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (46, 'Boyle', 'Roberta', 0, 80, 6);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (47, 'Hayes', 'Dayna', 0, 72, 7);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (48, 'West', 'Trinity', 0, 94, 8);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (49, 'Kling', 'Alfonso', 0, 68, 9);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (50, 'Jacobson', 'Neoma', 0, 81, 10);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (51, 'Ankunding', 'Pamela', 0, 67, 11);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (52, 'Zulauf', 'Reinhold', 0, 62, 12);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (53, 'Jacobs', 'Sylvester', 0, 76, 13);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (54, 'Herman', 'Otilia', 0, 62, 14);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (55, 'Durgan', 'Horace', 0, 92, 15);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (56, 'Braun', 'Wilber', 0, 69, 16);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (57, 'Nikolaus', 'Tomas', 0, 61, 17);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (58, 'Considine', 'Juanita', 0, 75, 18);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (59, 'Gerhold', 'Skye', 0, 68, 19);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (60, 'Boyle', 'Abdul', 0, 80, 20);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (61, 'Rolfson', 'Zita', 0, 64, 1);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (62, 'Gorczany', 'Virginie', 0, 60, 2);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (63, 'Mayert', 'Brooks', 0, 98, 3);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (64, 'Dickens', 'Rosella', 0, 72, 4);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (65, 'Yundt', 'Sammie', 0, 92, 5);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (66, 'Hauck', 'Haven', 0, 83, 6);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (67, 'Lindgren', 'Pablo', 0, 88, 7);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (68, 'Tromp', 'Herminia', 0, 64, 8);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (69, 'Cremin', 'Zetta', 0, 98, 9);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (70, 'Kuhic', 'Simeon', 0, 80, 10);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (71, 'Morissette', 'Ophelia', 0, 84, 11);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (72, 'Towne', 'Mark', 0, 77, 12);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (73, 'Kuphal', 'Danny', 0, 96, 13);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (74, 'Jakubowski', 'Elmira', 0, 92, 14);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (75, 'Goldner', 'Aylin', 0, 77, 15);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (76, 'Heathcote', 'Tanya', 0, 98, 16);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (77, 'Feeney', 'Dakota', 0, 96, 17);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (78, 'McClure', 'Josefina', 0, 88, 18);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (79, 'Huel', 'Skylar', 0, 64, 19);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (80, 'Schaefer', 'Katharina', 0, 68, 20);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (81, 'Considine', 'Mittie', 0, 97, 1);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (82, 'Jenkins', 'Carmel', 0, 87, 2);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (83, 'Cronin', 'Cody', 0, 71, 3);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (84, 'Cartwright', 'Tyrell', 0, 85, 4);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (85, 'Watsica', 'Bart', 0, 73, 5);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (86, 'Upton', 'Marietta', 0, 83, 6);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (87, 'Ledner', 'Rhoda', 0, 95, 7);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (88, 'Mosciski', 'Malinda', 0, 67, 8);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (89, 'Cummings', 'Devante', 0, 71, 9);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (90, 'Romaguera', 'Valentin', 0, 89, 10);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (91, 'Doyle', 'Deja', 0, 87, 11);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (92, 'Walsh', 'Kevon', 0, 69, 12);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (93, 'West', 'Alfred', 0, 90, 13);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (94, 'Flatley', 'Nolan', 0, 80, 14);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (95, 'Quigley', 'Estevan', 0, 97, 15);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (96, 'Lebsack', 'Hermina', 0, 97, 16);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (97, 'Mertz', 'Arden', 0, 95, 17);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (98, 'Krajcik', 'Mathew', 0, 75, 18);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (99, 'Feil', 'Mitchell', 0, 70, 19);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (100, 'Schultz', 'Esta', 0, 64, 20);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (101, 'Haley', 'Louie', 0, 92, 1);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (102, 'Tromp', 'Fritz', 0, 62, 2);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (103, 'Kovacek', 'Amir', 0, 92, 3);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (104, 'Runolfsdottir', 'Mylene', 0, 76, 4);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (105, 'Schowalter', 'Kenyon', 0, 73, 5);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (106, 'Metz', 'Louisa', 0, 76, 6);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (107, 'Kling', 'Emil', 0, 75, 7);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (108, 'Yost', 'Alex', 0, 76, 8);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (109, 'Bahringer', 'Lucious', 0, 95, 9);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (110, 'Cole', 'Cara', 0, 91, 10);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (111, 'Fahey', 'Zoey', 0, 77, 11);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (112, 'Gislason', 'Santina', 0, 82, 12);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (113, 'Mills', 'Emely', 0, 71, 13);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (114, 'Turner', 'Augusta', 0, 74, 14);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (115, 'Hudson', 'Jeanne', 0, 91, 15);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (116, 'Watsica', 'Albina', 0, 78, 16);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (117, 'Erdman', 'Carli', 0, 79, 17);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (118, 'Sawayn', 'Brittany', 0, 67, 18);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (119, 'Farrell', 'Candace', 0, 68, 19);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (120, 'O\'Reilly', 'Taylor', 0, 83, 20);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (121, 'Streich', 'Manuela', 0, 97, 1);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (122, 'Kohler', 'Myrtice', 0, 94, 2);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (123, 'Morar', 'Tatyana', 0, 83, 3);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (124, 'Abshire', 'Hiram', 0, 80, 4);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (125, 'Gulgowski', 'Harvey', 0, 96, 5);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (126, 'Mitchell', 'Rocky', 0, 92, 6);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (127, 'Kling', 'Leola', 0, 71, 7);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (128, 'Upton', 'Cynthia', 0, 67, 8);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (129, 'Rolfson', 'Rosalee', 0, 74, 9);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (130, 'Rempel', 'Kennith', 0, 60, 10);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (131, 'Parker', 'Eleazar', 0, 71, 11);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (132, 'Kertzmann', 'Connor', 0, 68, 12);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (133, 'Kuhn', 'Albertha', 0, 97, 13);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (134, 'Kris', 'Keyshawn', 0, 92, 14);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (135, 'Ritchie', 'Lowell', 0, 78, 15);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (136, 'Bergnaum', 'Sam', 0, 63, 16);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (137, 'Jast', 'Jarvis', 0, 73, 17);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (138, 'Trantow', 'Shana', 0, 65, 18);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (139, 'Weber', 'Lavon', 0, 92, 19);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (140, 'Bins', 'Pete', 0, 83, 20);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (141, 'Stokes', 'Angelita', 0, 71, 1);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (142, 'Beatty', 'Graciela', 0, 67, 2);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (143, 'Schinner', 'Bret', 0, 87, 3);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (144, 'Borer', 'Sterling', 0, 70, 4);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (145, 'Kovacek', 'Cooper', 0, 71, 5);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (146, 'Conroy', 'Fatima', 0, 74, 6);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (147, 'Smith', 'Waino', 0, 85, 7);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (148, 'Price', 'Therese', 0, 99, 8);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (149, 'Krajcik', 'Neva', 0, 61, 9);
INSERT INTO `players` (`player_id`, `lastname`, `firstname`, `position`, `rating`, `team`) VALUES (150, 'Kemmer', 'Luisa', 0, 76, 10);



#
# TABLE STRUCTURE FOR: player_stats
#

DROP TABLE IF EXISTS `player_stats`;

CREATE TABLE `player_stats` (
  `player_id` int(11) NOT NULL,
  `goals` int(11) DEFAULT NULL,
  `assists` int(11) DEFAULT NULL,
  `saves` int(11) DEFAULT NULL,
  `tackles` int(11) DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  UNIQUE KEY `player_id_UNIQUE` (`player_id`),
  CONSTRAINT `playerid_stats` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (1, 4, 5, 7, 7);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (2, 1, 2, 8, 2);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (3, 0, 3, 1, 2);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (4, 4, 1, 2, 9);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (5, 5, 1, 11, 4);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (6, 1, 0, 13, 4);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (7, 3, 5, 6, 8);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (8, 4, 3, 4, 7);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (9, 3, 0, 1, 1);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (10, 4, 2, 5, 1);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (11, 0, 2, 14, 1);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (12, 0, 4, 13, 4);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (13, 1, 2, 8, 5);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (14, 0, 2, 10, 0);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (15, 2, 3, 7, 1);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (16, 1, 0, 3, 0);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (17, 1, 0, 13, 9);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (18, 5, 3, 11, 7);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (19, 0, 4, 2, 0);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (20, 3, 1, 6, 6);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (21, 2, 3, 14, 3);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (22, 1, 5, 4, 6);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (23, 0, 3, 4, 4);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (24, 2, 5, 6, 4);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (25, 0, 2, 8, 2);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (26, 3, 3, 8, 6);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (27, 5, 4, 12, 5);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (28, 3, 2, 13, 6);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (29, 3, 0, 0, 2);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (30, 1, 1, 11, 1);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (31, 0, 4, 2, 7);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (32, 3, 0, 14, 0);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (33, 4, 4, 15, 6);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (34, 2, 3, 3, 8);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (35, 1, 3, 8, 5);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (36, 0, 3, 2, 1);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (37, 2, 3, 15, 2);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (38, 2, 4, 11, 4);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (39, 4, 3, 7, 8);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (40, 5, 5, 15, 7);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (41, 3, 3, 7, 2);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (42, 4, 1, 0, 7);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (43, 3, 4, 1, 4);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (44, 3, 1, 8, 3);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (45, 0, 0, 11, 6);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (46, 4, 3, 14, 6);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (47, 3, 0, 13, 1);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (48, 4, 5, 7, 7);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (49, 4, 2, 4, 4);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (50, 0, 2, 1, 6);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (51, 5, 3, 6, 7);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (52, 3, 0, 9, 4);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (53, 1, 4, 4, 3);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (54, 5, 4, 6, 0);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (55, 0, 2, 13, 6);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (56, 3, 2, 7, 9);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (57, 1, 2, 13, 0);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (58, 3, 4, 2, 3);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (59, 0, 3, 9, 3);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (60, 2, 1, 7, 1);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (61, 3, 5, 9, 8);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (62, 5, 3, 11, 0);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (63, 4, 2, 12, 9);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (64, 1, 1, 4, 9);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (65, 2, 5, 1, 3);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (66, 3, 4, 8, 4);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (67, 5, 1, 0, 6);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (68, 3, 1, 4, 2);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (69, 0, 2, 6, 4);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (70, 3, 3, 11, 9);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (71, 2, 5, 13, 2);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (72, 1, 1, 8, 1);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (73, 4, 2, 11, 6);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (74, 2, 0, 11, 3);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (75, 2, 2, 3, 5);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (76, 5, 3, 5, 4);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (77, 1, 0, 9, 5);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (78, 0, 1, 9, 2);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (79, 3, 5, 4, 6);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (80, 3, 3, 10, 9);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (81, 5, 3, 14, 3);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (82, 2, 5, 8, 2);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (83, 1, 5, 1, 3);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (84, 2, 1, 8, 8);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (85, 2, 3, 1, 5);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (86, 0, 3, 2, 1);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (87, 3, 5, 13, 6);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (88, 1, 5, 12, 7);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (89, 5, 1, 3, 2);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (90, 5, 5, 14, 2);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (91, 5, 0, 6, 1);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (92, 3, 5, 7, 4);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (93, 3, 5, 11, 2);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (94, 4, 0, 2, 6);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (95, 5, 2, 15, 8);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (96, 4, 4, 3, 2);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (97, 2, 5, 3, 4);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (98, 3, 1, 5, 9);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (99, 3, 2, 14, 7);
INSERT INTO `player_stats` (`player_id`, `goals`, `assists`, `saves`, `tackles`) VALUES (100, 4, 5, 7, 4);


