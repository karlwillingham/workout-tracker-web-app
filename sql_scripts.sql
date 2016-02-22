

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `db_Name`
--

-- --------------------------------------------------------

--
-- Table structure for table `DataCollection`
--

DROP TABLE IF EXISTS `DataCollection`;
CREATE TABLE IF NOT EXISTS `DataCollection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `workout_workoutListId` int(11) DEFAULT NULL,
  `reps` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `dateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=173 ;


--
-- Stand-in structure for view `dataCollectionHistory`
--
DROP VIEW IF EXISTS `dataCollectionHistory`;
CREATE TABLE IF NOT EXISTS `dataCollectionHistory` (
`userId` int(11)
,`workoutListName` varchar(4000)
,`workoutName` varchar(4000)
,`setNum` int(11)
,`repsRequired` int(11)
,`reps` int(11)
,`amount` int(11)
,`dateTime` timestamp
,`workoutId` int(11)
,`workoutListId` int(11)
,`groupingId` int(11)
,`workoutListOrder` int(11)
,`workoutOrder` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `recentDataCollection`
--
DROP VIEW IF EXISTS `recentDataCollection`;
CREATE TABLE IF NOT EXISTS `recentDataCollection` (
`dataId` int(11)
,`userId` int(11)
,`workout_workoutListId` int(11)
,`reps` int(11)
,`amount` int(11)
,`dateTime` timestamp
);
-- --------------------------------------------------------

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
CREATE TABLE IF NOT EXISTS `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `User`
--

-- --------------------------------------------------------

--
-- Table structure for table `Workout`
--

DROP TABLE IF EXISTS `Workout`;
CREATE TABLE IF NOT EXISTS `Workout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(4000) NOT NULL,
  `help` text,
  `order` int(11) DEFAULT NULL,
  `hide` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=147 ;

--
-- Dumping data for table `Workout`
--

INSERT INTO `Workout` (`id`, `name`, `help`, `order`, `hide`) VALUES
(1, 'Incline Barbell Press', NULL, 1, 0),
(2, 'Barbell Flat Bench', NULL, 2, 0),
(3, 'Incline Dumbbell Fly', NULL, 3, 0),
(4, 'Chest Dips (body weight)', NULL, 4, 0),
(5, 'Standing French Press', NULL, 5, 0),
(6, 'Dumbbell Kickbacks', NULL, 6, 0),
(7, 'Deadlift', NULL, 7, 0),
(8, 'Pull-Ups', NULL, 8, 0),
(9, 'Single Arm Dumbbell Row', NULL, 9, 0),
(10, 'Underhand Barbell Row', NULL, 10, 0),
(11, 'Incline Dumbbell Curl', NULL, 11, 0),
(12, 'Preacher Curl', NULL, 12, 0),
(13, 'Squats', NULL, 13, 0),
(14, 'Walking Lunges', NULL, 14, 0),
(15, 'Leg Press', NULL, 15, 0),
(16, 'Standing Leg Curls (machine)', NULL, 16, 0),
(17, 'Seated Calf Raise', NULL, 17, 0),
(18, 'Overhead Press', NULL, 18, 0),
(19, 'Upright Row', NULL, 19, 0),
(20, 'Dumbbell Lateral Raise', NULL, 20, 0),
(21, 'Face Pulls (rope)', NULL, 21, 0),
(22, 'Barbell Shrugs', NULL, 22, 0),
(23, 'Pull-Ups', NULL, 23, 0),
(24, 'Incline Barbell Press', NULL, 24, 0),
(25, 'Bent Over T-Bar Row', NULL, 25, 0),
(26, 'Flat Dumbbell Press', NULL, 26, 0),
(27, 'Dumbbell Pull Overs', NULL, 27, 0),
(28, 'Landmine Press', NULL, 28, 0),
(29, 'Single Arm Dumbbell Row (Chainsaws)', NULL, 29, 0),
(30, 'Chest Dips (weighted)', NULL, 30, 0),
(31, 'Squats', NULL, 31, 0),
(32, 'Romanian Deadlifts', NULL, 32, 0),
(33, 'Walking Lunges', NULL, 33, 0),
(34, 'Hack Squats', NULL, 34, 0),
(35, 'Seated Hamstring Curls', NULL, 35, 0),
(36, 'Leg Extensions', NULL, 36, 0),
(37, 'Seated Calf Raises', NULL, 37, 0),
(38, 'Overhead Press', NULL, 38, 0),
(39, 'Dumbbell Lateral Raise', NULL, 39, 0),
(40, 'Upright Rows (wide grip)', NULL, 40, 0),
(41, 'Bent Over Dumbbell Reverse Fly', NULL, 41, 0),
(42, 'Reverse Upright Row', NULL, 42, 0),
(43, 'Alternating Dumbbell Front Raise', NULL, 43, 0),
(44, 'Barbell Shrugs', NULL, 44, 0),
(45, 'Dead Lift', NULL, 45, 0),
(46, 'Seated Cable Rows', NULL, 46, 0),
(47, 'Straight Arm Pull Downs', NULL, 47, 0),
(48, 'Under Hand Pull Downs', NULL, 48, 0),
(49, 'Barbell Curls', NULL, 49, 0),
(50, 'Alternating Dumbbell Hammer Curls', NULL, 50, 0),
(51, 'Preacher Bench Concentration Curls', NULL, 51, 0),
(52, 'Incline Dumbbell Fly to Close Press', NULL, 52, 0),
(53, 'Flat Barbell Bench Press', NULL, 53, 0),
(54, 'Underhand Cable Fly', NULL, 54, 0),
(55, 'Decline Dumbbell Press', NULL, 55, 0),
(56, 'EZ-bar Skull Crusher', NULL, 56, 0),
(57, 'Rope Extensions', NULL, 57, 0),
(58, 'Cross Bench Dips (weighted)', NULL, 58, 0),
(59, 'Leg Press', NULL, 59, 0),
(60, 'Step Ups (weighted)', NULL, 60, 0),
(61, 'Dumbbell Romanian Deadlifts', NULL, 61, 0),
(62, 'Single Leg Extensions', NULL, 62, 0),
(63, 'Lying Leg Curls', NULL, 63, 0),
(64, 'Standing Calf Raises', NULL, 64, 0),
(65, 'Pull-Ups', NULL, 65, 0),
(66, 'Incline Barbell Press', NULL, 66, 0),
(67, 'Bent Over T-Bar Row', NULL, 67, 0),
(68, 'Flat Dumbbell Press', NULL, 68, 0),
(69, 'Dumbbell Pull Overs', NULL, 69, 0),
(70, 'Landmine Press', NULL, 70, 0),
(71, 'Single Arm Dumbbell Row (Chainsaws)', NULL, 71, 0),
(72, 'Chest Dips (weighted)', NULL, 72, 0),
(73, 'Squats', NULL, 73, 0),
(74, 'Romanian Deadlifts', NULL, 74, 0),
(75, 'Walking Lunges', NULL, 75, 0),
(76, 'Hack Squats', NULL, 76, 0),
(77, 'Seated Hamstring Curls', NULL, 77, 0),
(78, 'Leg Extensions', NULL, 78, 0),
(79, 'Seated Calf Raises', NULL, 79, 0),
(80, 'Overhead Press', NULL, 80, 0),
(81, 'Dumbbell Lateral Raise', NULL, 81, 0),
(82, 'Upright Rows (wide grip)', NULL, 82, 0),
(83, 'Bent Over Dumbbell Reverse Fly', NULL, 83, 0),
(84, 'Reverse Upright Row', NULL, 84, 0),
(85, 'Alternating Dumbbell Front Raise', NULL, 85, 0),
(86, 'Barbell Shrugs', NULL, 86, 0),
(87, 'Dead Lift', NULL, 87, 0),
(88, 'Seated Cable Rows', NULL, 88, 0),
(89, 'Straight Arm Pull Downs', NULL, 89, 0),
(90, 'Under Hand Pull Downs', NULL, 90, 0),
(91, 'Barbell Curls', NULL, 91, 0),
(92, 'Alternating Dumbbell Hammer Curls', NULL, 92, 0),
(93, 'Preacher Bench Concentration Curls', NULL, 93, 0),
(94, 'Incline Dumbbell Fly to Close Press', NULL, 94, 0),
(95, 'Flat Barbell Bench Press', NULL, 95, 0),
(96, 'Underhand Cable Fly', NULL, 96, 0),
(97, 'Decline Dumbbell Press', NULL, 97, 0),
(98, 'EZ-bar Skull Crusher', NULL, 98, 0),
(99, 'Rope Extensions', NULL, 99, 0),
(100, 'Cross Bench Dips (weighted)', NULL, 100, 0),
(101, 'Leg Press', NULL, 101, 0),
(102, 'Step Ups (weighted)', NULL, 102, 0),
(103, 'Dumbbell Romanian Deadlifts', NULL, 103, 0),
(104, 'Single Leg Extensions', NULL, 104, 0),
(105, 'Lying Leg Curls', NULL, 105, 0),
(106, 'Standing Calf Raises', NULL, 106, 0),
(107, 'Squats', NULL, 107, 0),
(108, 'Romanian Dead Lifts *', NULL, 108, 0),
(109, 'Single Leg Hip Lifts*', NULL, 109, 0),
(110, 'Walking Lunges', NULL, 110, 0),
(111, 'Leg Extensions**', NULL, 111, 0),
(112, 'Leg Curls**', NULL, 112, 0),
(113, 'Standing Calf Raises***', NULL, 113, 0),
(114, 'Straight Arm Pull Down*', NULL, 114, 0),
(115, 'Pull-Ups*', NULL, 115, 0),
(116, 'Incline Barbell Press**', NULL, 116, 0),
(117, 'Incline Dumbbell Fly**', NULL, 117, 0),
(118, 'Bent Over Dumbbell Row (Bi-Lateral)***', NULL, 118, 0),
(119, 'Flat Bench Dumbbell Press***', NULL, 119, 0),
(120, 'Dumbbell Pull-Over****', NULL, 120, 0),
(121, 'Dips (weighted)****', NULL, 121, 0),
(122, 'Lateral Raise (pre-exhaust)', NULL, 122, 0),
(123, 'Overhead Press', NULL, 123, 0),
(124, 'Bent Over Reverse Dumbbell Fly*', NULL, 124, 0),
(125, 'Cable Front Raise (rope) *', NULL, 125, 0),
(126, 'Upright Row**', NULL, 126, 0),
(127, 'Reverse Upright Row**', NULL, 127, 0),
(128, 'Seated Dumbbell Shrugs', NULL, 128, 0),
(129, 'Standing Behind the Back Barbell Shrugs', NULL, 129, 0),
(130, 'EZ – Bar Skull Crusher*', NULL, 130, 0),
(131, 'EZ – Bar Close Grip Press*', NULL, 131, 0),
(132, 'Barbell Curls (5 reps wide, mid, and then close grip)', NULL, 132, 0),
(133, '*Giant Set – 4 sets x 10 reps each: Pronated Triceps Extension / Supinated Triceps Extension / Rope Triceps Extension', NULL, 133, 0),
(134, 'Dumbbell Hammer Curls (bi-lateral)', NULL, 134, 0),
(135, 'Concentration Curls', NULL, 135, 0),
(136, 'Leg Press – Drop set 5 times on last set', NULL, 136, 0),
(137, 'Hack Squats', NULL, 137, 0),
(138, 'Standing Leg Curls', NULL, 138, 0),
(139, 'Single Seated Calf Raise', NULL, 139, 0),
(140, 'Standing Calf Raise', NULL, 140, 0),
(141, 'Bent Over Row *', NULL, 141, 0),
(142, 'Flat Barbell Bench Press*', NULL, 142, 0),
(143, 'Seated Low Row (cable) **', NULL, 143, 0),
(144, 'Machine Fly **', NULL, 144, 0),
(145, 'Underhand Pull Downs***', NULL, 145, 0),
(146, 'Underhand Dumbbell Fly ***', NULL, 146, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `workoutForm`
--
DROP VIEW IF EXISTS `workoutForm`;
CREATE TABLE IF NOT EXISTS `workoutForm` (
`id` int(11)
,`workoutListId` int(11)
,`workoutId` int(11)
,`listName` varchar(4000)
,`workoutName` varchar(4000)
,`setNum` int(11)
,`reps` int(11)
,`help` text
,`listOrder` int(11)
,`workoutOrder` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `workoutFormAndData`
--
DROP VIEW IF EXISTS `workoutFormAndData`;
CREATE TABLE IF NOT EXISTS `workoutFormAndData` (
`id` int(11)
,`workoutListId` int(11)
,`workoutId` int(11)
,`listName` varchar(4000)
,`workoutName` varchar(4000)
,`setNum` int(11)
,`reps` int(11)
,`help` text
,`listOrder` int(11)
,`workoutOrder` int(11)
,`userId` int(11)
,`workout_workoutListId` int(11)
,`prevReps` int(11)
,`prevAmount` int(11)
,`dateTime` timestamp
);
-- --------------------------------------------------------

--
-- Table structure for table `WorkoutList`
--

DROP TABLE IF EXISTS `WorkoutList`;
CREATE TABLE IF NOT EXISTS `WorkoutList` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupingId` int(11) DEFAULT NULL,
  `name` varchar(4000) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `hide` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `WorkoutList`
--

INSERT INTO `WorkoutList` (`id`, `groupingId`, `name`, `order`, `hide`) VALUES
(1, 1, 'Monday - Chest and Triceps', 1, 0),
(2, 1, 'Tuesday - Back and Biceps', 2, 0),
(3, 1, 'Wednesday - Legs and Calves', 3, 0),
(4, 1, 'Thursday - Shoulders and Trapezius', 4, 0),
(5, 2, 'Monday - Chest and Back', 5, 0),
(6, 2, 'Tuesday - Legs', 6, 0),
(7, 2, 'Wednesday - Shoulders and Trapezius', 7, 0),
(8, 2, 'Thursday - Back and Biceps', 8, 0),
(9, 2, 'Friday - Chest and Triceps', 9, 0),
(10, 2, 'Saturday - Legs and Calves', 10, 0),
(11, 3, 'Monday - Chest and Back', 11, 0),
(12, 3, 'Tuesday - Legs', 12, 0),
(13, 3, 'Wednesday - Shoulders and Trapezius', 13, 0),
(14, 3, 'Thursday - Back and Biceps', 14, 0),
(15, 3, 'Friday - Chest and Triceps', 15, 0),
(16, 3, 'Saturday - Legs and Calves', 16, 0),
(17, 4, 'Monday - Legs', 17, 0),
(18, 4, 'Tuesday - Chest and Back', 18, 0),
(19, 4, 'Wednesday - Shoulders and Trapezius', 19, 0),
(20, 4, 'Thursday - Triceps and Biceps', 20, 0),
(21, 4, 'Friday - Legs', 21, 0),
(22, 4, 'Saturday - Chest and Back', 22, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Workout_WorkoutList`
--

DROP TABLE IF EXISTS `Workout_WorkoutList`;
CREATE TABLE IF NOT EXISTS `Workout_WorkoutList` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workoutListId` int(11) DEFAULT NULL,
  `workoutId` int(11) DEFAULT NULL,
  `setNum` int(11) DEFAULT NULL,
  `reps` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=586 ;

--
-- Dumping data for table `Workout_WorkoutList`
--

INSERT INTO `Workout_WorkoutList` (`id`, `workoutListId`, `workoutId`, `setNum`, `reps`) VALUES
(1, 1, 1, 1, 15),
(2, 1, 1, 2, 12),
(3, 1, 1, 3, 10),
(4, 1, 1, 4, 8),
(5, 1, 2, 1, 12),
(6, 1, 2, 2, 10),
(7, 1, 2, 3, 8),
(8, 1, 2, 4, 8),
(9, 1, 3, 1, 10),
(10, 1, 3, 2, 10),
(11, 1, 3, 3, 10),
(12, 1, 3, 4, 10),
(13, 1, 4, 1, 15),
(14, 1, 4, 2, 15),
(15, 1, 4, 3, 15),
(16, 1, 4, 4, 15),
(17, 1, 5, 1, 12),
(18, 1, 5, 2, 12),
(19, 1, 5, 3, 12),
(20, 1, 5, 4, 12),
(21, 1, 6, 1, 10),
(22, 1, 6, 2, 10),
(23, 1, 6, 3, 10),
(24, 2, 7, 1, 20),
(25, 2, 7, 2, 15),
(26, 2, 7, 3, 12),
(27, 2, 7, 4, 10),
(28, 2, 8, 1, 12),
(29, 2, 8, 2, 12),
(30, 2, 8, 3, 12),
(31, 2, 8, 4, 12),
(32, 2, 9, 1, 10),
(33, 2, 9, 2, 10),
(34, 2, 9, 3, 10),
(35, 2, 9, 4, 10),
(36, 2, 10, 1, 12),
(37, 2, 10, 2, 10),
(38, 2, 10, 3, 8),
(39, 2, 10, 4, 8),
(40, 2, 11, 1, 10),
(41, 2, 11, 2, 10),
(42, 2, 11, 3, 10),
(43, 2, 12, 1, 10),
(44, 2, 12, 2, 10),
(45, 2, 12, 3, 10),
(46, 3, 13, 1, 15),
(47, 3, 13, 2, 12),
(48, 3, 13, 3, 10),
(49, 3, 13, 4, 8),
(50, 3, 14, 1, 10),
(51, 3, 14, 2, 10),
(52, 3, 14, 3, 10),
(53, 3, 15, 1, 12),
(54, 3, 15, 2, 10),
(55, 3, 15, 3, 8),
(56, 3, 15, 4, 8),
(57, 3, 16, 1, 12),
(58, 3, 16, 2, 12),
(59, 3, 16, 3, 12),
(60, 3, 16, 4, 12),
(61, 3, 17, 1, 15),
(62, 3, 17, 2, 15),
(63, 3, 17, 3, 15),
(64, 3, 17, 4, 15),
(65, 3, 17, 5, 15),
(66, 4, 18, 1, 15),
(67, 4, 18, 2, 12),
(68, 4, 18, 3, 10),
(69, 4, 18, 4, 8),
(70, 4, 19, 1, 12),
(71, 4, 19, 2, 10),
(72, 4, 19, 3, 8),
(73, 4, 19, 4, 8),
(74, 4, 20, 1, 10),
(75, 4, 20, 2, 10),
(76, 4, 20, 3, 10),
(77, 4, 20, 4, 10),
(78, 4, 21, 1, 12),
(79, 4, 21, 2, 12),
(80, 4, 21, 3, 12),
(81, 4, 21, 4, 12),
(82, 4, 22, 1, 12),
(83, 4, 22, 2, 12),
(84, 4, 22, 3, 12),
(85, 4, 22, 4, 12),
(86, 4, 22, 5, 12),
(87, 5, 23, 1, 20),
(88, 5, 23, 2, 20),
(89, 5, 23, 3, 20),
(90, 5, 23, 4, 20),
(91, 5, 24, 1, 15),
(92, 5, 24, 2, 12),
(93, 5, 24, 3, 10),
(94, 5, 24, 4, 8),
(95, 5, 25, 1, 12),
(96, 5, 25, 2, 10),
(97, 5, 25, 3, 8),
(98, 5, 25, 4, 8),
(99, 5, 26, 1, 12),
(100, 5, 26, 2, 10),
(101, 5, 26, 3, 8),
(102, 5, 26, 4, 8),
(103, 5, 27, 1, 10),
(104, 5, 27, 2, 10),
(105, 5, 27, 3, 10),
(106, 5, 27, 4, 10),
(107, 5, 28, 1, 10),
(108, 5, 28, 2, 10),
(109, 5, 28, 3, 10),
(110, 5, 28, 4, 10),
(111, 5, 29, 1, 12),
(112, 5, 29, 2, 10),
(113, 5, 29, 3, 8),
(114, 5, 29, 4, 8),
(115, 5, 30, 1, 12),
(116, 5, 30, 2, 10),
(117, 5, 30, 3, 8),
(118, 5, 30, 4, 8),
(119, 6, 31, 1, 20),
(120, 6, 31, 2, 12),
(121, 6, 31, 3, 10),
(122, 6, 31, 4, 8),
(123, 6, 31, 5, 4),
(124, 6, 32, 1, 12),
(125, 6, 32, 2, 10),
(126, 6, 32, 3, 8),
(127, 6, 32, 4, 8),
(128, 6, 33, 1, 10),
(129, 6, 33, 2, 10),
(130, 6, 33, 3, 10),
(131, 6, 33, 4, 10),
(132, 6, 34, 1, 12),
(133, 6, 34, 2, 10),
(134, 6, 34, 3, 8),
(135, 6, 34, 4, 8),
(136, 6, 35, 1, 12),
(137, 6, 35, 2, 12),
(138, 6, 35, 3, 12),
(139, 6, 36, 1, 12),
(140, 6, 36, 2, 12),
(141, 6, 36, 3, 12),
(142, 6, 37, 1, 20),
(143, 6, 37, 2, 15),
(144, 6, 37, 3, 12),
(145, 6, 37, 4, 10),
(146, 6, 37, 5, 8),
(147, 7, 38, 1, 15),
(148, 7, 38, 2, 12),
(149, 7, 38, 3, 10),
(150, 7, 38, 4, 8),
(151, 7, 38, 5, 6),
(152, 7, 39, 1, 12),
(153, 7, 39, 2, 10),
(154, 7, 39, 3, 8),
(155, 7, 39, 4, 8),
(156, 7, 40, 1, 12),
(157, 7, 40, 2, 10),
(158, 7, 40, 3, 8),
(159, 7, 40, 4, 8),
(160, 7, 41, 1, 10),
(161, 7, 41, 2, 10),
(162, 7, 41, 3, 10),
(163, 7, 41, 4, 10),
(164, 7, 42, 1, 10),
(165, 7, 42, 2, 10),
(166, 7, 42, 3, 10),
(167, 7, 42, 4, 10),
(168, 7, 43, 1, 10),
(169, 7, 43, 2, 10),
(170, 7, 43, 3, 10),
(171, 7, 43, 4, 10),
(172, 7, 44, 1, 15),
(173, 7, 44, 2, 12),
(174, 7, 44, 3, 10),
(175, 7, 44, 4, 8),
(176, 7, 44, 5, 8),
(177, 8, 45, 1, 12),
(178, 8, 45, 2, 10),
(179, 8, 45, 3, 8),
(180, 8, 45, 4, 6),
(181, 8, 45, 5, 2),
(182, 8, 46, 1, 12),
(183, 8, 46, 2, 10),
(184, 8, 46, 3, 8),
(185, 8, 46, 4, 8),
(186, 8, 47, 1, 10),
(187, 8, 47, 2, 10),
(188, 8, 47, 3, 10),
(189, 8, 47, 4, 10),
(190, 8, 48, 1, 10),
(191, 8, 48, 2, 10),
(192, 8, 48, 3, 10),
(193, 8, 48, 4, 10),
(194, 8, 49, 1, 12),
(195, 8, 49, 2, 10),
(196, 8, 49, 3, 8),
(197, 8, 49, 4, 6),
(198, 8, 50, 1, 10),
(199, 8, 50, 2, 10),
(200, 8, 50, 3, 10),
(201, 8, 51, 1, 10),
(202, 8, 51, 2, 10),
(203, 8, 51, 3, 10),
(204, 9, 52, 1, 10),
(205, 9, 52, 2, 10),
(206, 9, 52, 3, 10),
(207, 9, 52, 4, 10),
(208, 9, 53, 1, 12),
(209, 9, 53, 2, 10),
(210, 9, 53, 3, 8),
(211, 9, 53, 4, 8),
(212, 9, 54, 1, 12),
(213, 9, 54, 2, 12),
(214, 9, 54, 3, 12),
(215, 9, 54, 4, 12),
(216, 9, 55, 1, 12),
(217, 9, 55, 2, 10),
(218, 9, 55, 3, 8),
(219, 9, 55, 4, 8),
(220, 9, 56, 1, 12),
(221, 9, 56, 2, 10),
(222, 9, 56, 3, 8),
(223, 9, 56, 4, 6),
(224, 9, 57, 1, 10),
(225, 9, 57, 2, 10),
(226, 9, 57, 3, 10),
(227, 9, 58, 1, 10),
(228, 9, 58, 2, 10),
(229, 9, 58, 3, 10),
(230, 10, 59, 1, 20),
(231, 10, 59, 2, 12),
(232, 10, 59, 3, 10),
(233, 10, 59, 4, 8),
(234, 10, 59, 5, 6),
(235, 10, 60, 1, 10),
(236, 10, 60, 2, 10),
(237, 10, 60, 3, 10),
(238, 10, 60, 4, 10),
(239, 10, 61, 1, 10),
(240, 10, 61, 2, 10),
(241, 10, 61, 3, 10),
(242, 10, 61, 4, 10),
(243, 10, 62, 1, 12),
(244, 10, 62, 2, 12),
(245, 10, 62, 3, 12),
(246, 10, 63, 1, 12),
(247, 10, 63, 2, 12),
(248, 10, 63, 3, 12),
(249, 10, 64, 1, 15),
(250, 10, 64, 2, 12),
(251, 10, 64, 3, 10),
(252, 10, 64, 4, 8),
(253, 10, 64, 5, 8),
(254, 11, 65, 1, 20),
(255, 11, 65, 2, 20),
(256, 11, 65, 3, 20),
(257, 11, 65, 4, 20),
(258, 11, 66, 1, 15),
(259, 11, 66, 2, 12),
(260, 11, 66, 3, 10),
(261, 11, 66, 4, 8),
(262, 11, 67, 1, 12),
(263, 11, 67, 2, 10),
(264, 11, 67, 3, 8),
(265, 11, 67, 4, 8),
(266, 11, 68, 1, 12),
(267, 11, 68, 2, 10),
(268, 11, 68, 3, 8),
(269, 11, 68, 4, 8),
(270, 11, 69, 1, 10),
(271, 11, 69, 2, 10),
(272, 11, 69, 3, 10),
(273, 11, 69, 4, 10),
(274, 11, 70, 1, 10),
(275, 11, 70, 2, 10),
(276, 11, 70, 3, 10),
(277, 11, 70, 4, 10),
(278, 11, 71, 1, 12),
(279, 11, 71, 2, 10),
(280, 11, 71, 3, 8),
(281, 11, 71, 4, 8),
(282, 11, 72, 1, 12),
(283, 11, 72, 2, 10),
(284, 11, 72, 3, 8),
(285, 11, 72, 4, 8),
(286, 12, 73, 1, 20),
(287, 12, 73, 2, 12),
(288, 12, 73, 3, 10),
(289, 12, 73, 4, 8),
(290, 12, 73, 5, 4),
(291, 12, 74, 1, 12),
(292, 12, 74, 2, 10),
(293, 12, 74, 3, 8),
(294, 12, 74, 4, 8),
(295, 12, 75, 1, 10),
(296, 12, 75, 2, 10),
(297, 12, 75, 3, 10),
(298, 12, 75, 4, 10),
(299, 12, 76, 1, 12),
(300, 12, 76, 2, 10),
(301, 12, 76, 3, 8),
(302, 12, 76, 4, 8),
(303, 12, 77, 1, 12),
(304, 12, 77, 2, 12),
(305, 12, 77, 3, 12),
(306, 12, 78, 1, 12),
(307, 12, 78, 2, 12),
(308, 12, 78, 3, 12),
(309, 12, 79, 1, 20),
(310, 12, 79, 2, 15),
(311, 12, 79, 3, 12),
(312, 12, 79, 4, 10),
(313, 12, 79, 5, 8),
(314, 13, 80, 1, 15),
(315, 13, 80, 2, 12),
(316, 13, 80, 3, 10),
(317, 13, 80, 4, 8),
(318, 13, 80, 5, 6),
(319, 13, 81, 1, 12),
(320, 13, 81, 2, 10),
(321, 13, 81, 3, 8),
(322, 13, 81, 4, 8),
(323, 13, 82, 1, 12),
(324, 13, 82, 2, 10),
(325, 13, 82, 3, 8),
(326, 13, 82, 4, 8),
(327, 13, 83, 1, 10),
(328, 13, 83, 2, 10),
(329, 13, 83, 3, 10),
(330, 13, 83, 4, 10),
(331, 13, 84, 1, 10),
(332, 13, 84, 2, 10),
(333, 13, 84, 3, 10),
(334, 13, 84, 4, 10),
(335, 13, 85, 1, 10),
(336, 13, 85, 2, 10),
(337, 13, 85, 3, 10),
(338, 13, 85, 4, 10),
(339, 13, 86, 1, 15),
(340, 13, 86, 2, 12),
(341, 13, 86, 3, 10),
(342, 13, 86, 4, 8),
(343, 13, 86, 5, 8),
(344, 14, 87, 1, 12),
(345, 14, 87, 2, 10),
(346, 14, 87, 3, 8),
(347, 14, 87, 4, 6),
(348, 14, 87, 5, 2),
(349, 14, 88, 1, 12),
(350, 14, 88, 2, 10),
(351, 14, 88, 3, 8),
(352, 14, 88, 4, 8),
(353, 14, 89, 1, 10),
(354, 14, 89, 2, 10),
(355, 14, 89, 3, 10),
(356, 14, 89, 4, 10),
(357, 14, 90, 1, 10),
(358, 14, 90, 2, 10),
(359, 14, 90, 3, 10),
(360, 14, 90, 4, 10),
(361, 14, 91, 1, 12),
(362, 14, 91, 2, 10),
(363, 14, 91, 3, 8),
(364, 14, 91, 4, 6),
(365, 14, 92, 1, 10),
(366, 14, 92, 2, 10),
(367, 14, 92, 3, 10),
(368, 14, 93, 1, 10),
(369, 14, 93, 2, 10),
(370, 14, 93, 3, 10),
(371, 15, 94, 1, 10),
(372, 15, 94, 2, 10),
(373, 15, 94, 3, 10),
(374, 15, 94, 4, 10),
(375, 15, 95, 1, 12),
(376, 15, 95, 2, 10),
(377, 15, 95, 3, 8),
(378, 15, 95, 4, 8),
(379, 15, 96, 1, 12),
(380, 15, 96, 2, 12),
(381, 15, 96, 3, 12),
(382, 15, 96, 4, 12),
(383, 15, 97, 1, 12),
(384, 15, 97, 2, 10),
(385, 15, 97, 3, 8),
(386, 15, 97, 4, 8),
(387, 15, 98, 1, 12),
(388, 15, 98, 2, 10),
(389, 15, 98, 3, 8),
(390, 15, 98, 4, 6),
(391, 15, 99, 1, 10),
(392, 15, 99, 2, 10),
(393, 15, 99, 3, 10),
(394, 15, 100, 1, 10),
(395, 15, 100, 2, 10),
(396, 15, 100, 3, 10),
(397, 16, 101, 1, 20),
(398, 16, 101, 2, 12),
(399, 16, 101, 3, 10),
(400, 16, 101, 4, 8),
(401, 16, 101, 5, 6),
(402, 16, 102, 1, 10),
(403, 16, 102, 2, 10),
(404, 16, 102, 3, 10),
(405, 16, 102, 4, 10),
(406, 16, 103, 1, 10),
(407, 16, 103, 2, 10),
(408, 16, 103, 3, 10),
(409, 16, 103, 4, 10),
(410, 16, 104, 1, 12),
(411, 16, 104, 2, 12),
(412, 16, 104, 3, 12),
(413, 16, 105, 1, 12),
(414, 16, 105, 2, 12),
(415, 16, 105, 3, 12),
(416, 16, 106, 1, 15),
(417, 16, 106, 2, 12),
(418, 16, 106, 3, 10),
(419, 16, 106, 4, 8),
(420, 16, 106, 5, 8),
(421, 17, 107, 1, 20),
(422, 17, 107, 2, 12),
(423, 17, 107, 3, 10),
(424, 17, 107, 4, 8),
(425, 17, 107, 5, 4),
(426, 17, 108, 1, 10),
(427, 17, 108, 2, 10),
(428, 17, 108, 3, 10),
(429, 17, 108, 4, 10),
(430, 17, 109, 1, 10),
(431, 17, 109, 2, 10),
(432, 17, 109, 3, 10),
(433, 17, 109, 4, 10),
(434, 17, 110, 1, 10),
(435, 17, 110, 2, 10),
(436, 17, 110, 3, 10),
(437, 17, 110, 4, 10),
(438, 17, 111, 1, 12),
(439, 17, 111, 2, 12),
(440, 17, 111, 3, 12),
(441, 17, 111, 4, 12),
(442, 17, 112, 1, 12),
(443, 17, 112, 2, 12),
(444, 17, 112, 3, 12),
(445, 17, 112, 4, 12),
(446, 17, 113, 1, 10),
(447, 17, 113, 2, 10),
(448, 17, 113, 3, 10),
(449, 17, 113, 4, 10),
(450, 17, 113, 5, 10),
(451, 18, 114, 1, 12),
(452, 18, 114, 2, 12),
(453, 18, 114, 3, 12),
(454, 18, 114, 4, 12),
(455, 18, 115, 1, 12),
(456, 18, 115, 2, 12),
(457, 18, 115, 3, 12),
(458, 18, 115, 4, 12),
(459, 18, 116, 1, 10),
(460, 18, 116, 2, 10),
(461, 18, 116, 3, 10),
(462, 18, 116, 4, 10),
(463, 18, 117, 1, 10),
(464, 18, 117, 2, 10),
(465, 18, 117, 3, 10),
(466, 18, 117, 4, 10),
(467, 18, 118, 1, 10),
(468, 18, 118, 2, 10),
(469, 18, 118, 3, 10),
(470, 18, 118, 4, 10),
(471, 18, 119, 1, 10),
(472, 18, 119, 2, 10),
(473, 18, 119, 3, 10),
(474, 18, 119, 4, 10),
(475, 18, 120, 1, 10),
(476, 18, 120, 2, 10),
(477, 18, 120, 3, 10),
(478, 18, 120, 4, 10),
(479, 18, 121, 1, 10),
(480, 18, 121, 2, 10),
(481, 18, 121, 3, 10),
(482, 18, 121, 4, 10),
(483, 19, 122, 1, 12),
(484, 19, 122, 2, 12),
(485, 19, 122, 3, 12),
(486, 19, 122, 4, 12),
(487, 19, 123, 1, 12),
(488, 19, 123, 2, 10),
(489, 19, 123, 3, 8),
(490, 19, 123, 4, 8),
(491, 19, 124, 1, 12),
(492, 19, 124, 2, 12),
(493, 19, 124, 3, 12),
(494, 19, 124, 4, 12),
(495, 19, 125, 1, 12),
(496, 19, 125, 2, 12),
(497, 19, 125, 3, 12),
(498, 19, 125, 4, 12),
(499, 19, 126, 1, 12),
(500, 19, 126, 2, 12),
(501, 19, 126, 3, 12),
(502, 19, 126, 4, 12),
(503, 19, 127, 1, 12),
(504, 19, 127, 2, 12),
(505, 19, 127, 3, 12),
(506, 19, 127, 4, 12),
(507, 19, 128, 1, 10),
(508, 19, 128, 2, 10),
(509, 19, 128, 3, 10),
(510, 19, 128, 4, 10),
(511, 19, 129, 1, 10),
(512, 19, 129, 2, 10),
(513, 19, 129, 3, 10),
(514, 19, 129, 4, 10),
(515, 20, 130, 1, 10),
(516, 20, 130, 2, 10),
(517, 20, 130, 3, 10),
(518, 20, 130, 4, 10),
(519, 20, 131, 1, 10),
(520, 20, 131, 2, 10),
(521, 20, 131, 3, 10),
(522, 20, 131, 4, 10),
(523, 20, 132, 1, 15),
(524, 20, 132, 2, 15),
(525, 20, 132, 3, 15),
(526, 20, 132, 4, 15),
(527, 20, 133, 1, 10),
(528, 20, 133, 2, 10),
(529, 20, 133, 3, 10),
(530, 20, 133, 4, 10),
(531, 20, 134, 1, 10),
(532, 20, 134, 2, 10),
(533, 20, 134, 3, 10),
(534, 20, 134, 4, 10),
(535, 20, 135, 1, 12),
(536, 20, 135, 2, 12),
(537, 20, 135, 3, 12),
(538, 21, 136, 1, 15),
(539, 21, 136, 2, 12),
(540, 21, 136, 3, 10),
(541, 21, 136, 4, 8),
(542, 21, 136, 5, 6),
(543, 21, 136, 6, 0),
(544, 21, 136, 7, 0),
(545, 21, 136, 8, 0),
(546, 21, 136, 9, 0),
(547, 21, 136, 10, 0),
(548, 21, 137, 1, 12),
(549, 21, 137, 2, 10),
(550, 21, 137, 3, 8),
(551, 21, 137, 4, 8),
(552, 21, 137, 5, 6),
(553, 21, 138, 1, 20),
(554, 21, 138, 2, 20),
(555, 21, 138, 3, 20),
(556, 21, 139, 1, 20),
(557, 21, 139, 2, 20),
(558, 21, 139, 3, 20),
(559, 21, 140, 1, 10),
(560, 21, 140, 2, 10),
(561, 21, 140, 3, 10),
(562, 22, 141, 1, 12),
(563, 22, 141, 2, 10),
(564, 22, 141, 3, 8),
(565, 22, 141, 4, 8),
(566, 22, 142, 1, 12),
(567, 22, 142, 2, 10),
(568, 22, 142, 3, 8),
(569, 22, 142, 4, 8),
(570, 22, 143, 1, 10),
(571, 22, 143, 2, 10),
(572, 22, 143, 3, 10),
(573, 22, 143, 4, 10),
(574, 22, 144, 1, 10),
(575, 22, 144, 2, 10),
(576, 22, 144, 3, 10),
(577, 22, 144, 4, 10),
(578, 22, 145, 1, 12),
(579, 22, 145, 2, 10),
(580, 22, 145, 3, 8),
(581, 22, 145, 4, 8),
(582, 22, 146, 1, 12),
(583, 22, 146, 2, 12),
(584, 22, 146, 3, 12),
(585, 22, 146, 4, 12);

-- --------------------------------------------------------

--
-- Structure for view `dataCollectionHistory`
--
DROP TABLE IF EXISTS `dataCollectionHistory`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dbName`@`localhost` SQL SECURITY DEFINER VIEW `dataCollectionHistory` AS select `d`.`userId` AS `userId`,`wl`.`name` AS `workoutListName`,`w`.`name` AS `workoutName`,`wwl`.`setNum` AS `setNum`,`wwl`.`reps` AS `repsRequired`,`d`.`reps` AS `reps`,`d`.`amount` AS `amount`,`d`.`dateTime` AS `dateTime`,`wwl`.`workoutId` AS `workoutId`,`wwl`.`workoutListId` AS `workoutListId`,`wl`.`groupingId` AS `groupingId`,`wl`.`order` AS `workoutListOrder`,`w`.`order` AS `workoutOrder` from (((`DataCollection` `d` left join `Workout_WorkoutList` `wwl` on((`d`.`workout_workoutListId` = `wwl`.`id`))) join `WorkoutList` `wl` on((`wwl`.`workoutListId` = `wl`.`id`))) join `Workout` `w` on((`wwl`.`workoutId` = `w`.`id`)));

-- --------------------------------------------------------

--
-- Structure for view `recentDataCollection`
--
DROP TABLE IF EXISTS `recentDataCollection`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dbName`@`localhost` SQL SECURITY DEFINER VIEW `recentDataCollection` AS select `d1`.`id` AS `dataId`,`d1`.`userId` AS `userId`,`d1`.`workout_workoutListId` AS `workout_workoutListId`,`d1`.`reps` AS `reps`,`d1`.`amount` AS `amount`,`d1`.`dateTime` AS `dateTime` from `DataCollection` `d1` where (`d1`.`dateTime` = (select max(`d2`.`dateTime`) from `DataCollection` `d2` where (`d2`.`workout_workoutListId` = `d1`.`workout_workoutListId`)));

-- --------------------------------------------------------

--
-- Structure for view `workoutForm`
--
DROP TABLE IF EXISTS `workoutForm`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dbName`@`localhost` SQL SECURITY DEFINER VIEW `workoutForm` AS select `m`.`id` AS `id`,`m`.`workoutListId` AS `workoutListId`,`m`.`workoutId` AS `workoutId`,`wl`.`name` AS `listName`,`w`.`name` AS `workoutName`,`m`.`setNum` AS `setNum`,`m`.`reps` AS `reps`,`w`.`help` AS `help`,`wl`.`order` AS `listOrder`,`w`.`order` AS `workoutOrder` from ((`Workout_WorkoutList` `m` join `Workout` `w` on((`m`.`workoutId` = `w`.`id`))) join `WorkoutList` `wl` on((`m`.`workoutListId` = `wl`.`id`))) where ((`w`.`hide` = 0) and (`wl`.`hide` = 0));

-- --------------------------------------------------------

--
-- Structure for view `workoutFormAndData`
--
DROP TABLE IF EXISTS `workoutFormAndData`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dbName`@`localhost` SQL SECURITY DEFINER VIEW `workoutFormAndData` AS select `w`.`id` AS `id`,`w`.`workoutListId` AS `workoutListId`,`w`.`workoutId` AS `workoutId`,`w`.`listName` AS `listName`,`w`.`workoutName` AS `workoutName`,`w`.`setNum` AS `setNum`,`w`.`reps` AS `reps`,`w`.`help` AS `help`,`w`.`listOrder` AS `listOrder`,`w`.`workoutOrder` AS `workoutOrder`,`d`.`userId` AS `userId`,`d`.`workout_workoutListId` AS `workout_workoutListId`,`d`.`reps` AS `prevReps`,`d`.`amount` AS `prevAmount`,`d`.`dateTime` AS `dateTime` from (`workoutForm` `w` left join `recentDataCollection` `d` on((`w`.`id` = `d`.`workout_workoutListId`)));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
