-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2020 at 05:34 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendence`
--

-- --------------------------------------------------------

--
-- Table structure for table `at_admin`
--

CREATE TABLE `at_admin` (
  `id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_username` varchar(100) NOT NULL,
  `admin_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `at_admin`
--

INSERT INTO `at_admin` (`id`, `admin_name`, `admin_username`, `admin_password`) VALUES
(1, 'Admin', 'admin', '1'),
(2, 'Dr. dinesh verma', 'dc verma', '123');

-- --------------------------------------------------------

--
-- Table structure for table `at_attendence`
--

CREATE TABLE `at_attendence` (
  `id` int(10) NOT NULL,
  `tbl_name` varchar(200) DEFAULT NULL,
  `attendence_date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `at_attendence`
--

INSERT INTO `at_attendence` (`id`, `tbl_name`, `attendence_date`) VALUES
(27, 'MCA455_MCA_IV_A_javalab', '19_Mar_20_18_33_26'),
(28, 'MCA455_MCA_IV_A_javalab', '19_Mar_20_20_10_47'),
(29, 'MCA455_MCA_IV_A_javalab', '20_Mar_20_20_37_22'),
(30, 'MCA455_MCA_IV_A_javalab', '20_Mar_20_20_52_49'),
(31, 'MCA455_MCA_IV_A_javalab', '20_Mar_20_21_20_40'),
(32, 'MCA455_MCA_IV_A_javalab', '20_Mar_20_21_21_41'),
(33, 'MCA455_MCA_IV_A_javalab', '20_Mar_20_21_22_16'),
(34, 'MCA455_MCA_IV_A_javalab', '23_Mar_20_14_25_20');

-- --------------------------------------------------------

--
-- Table structure for table `at_course`
--

CREATE TABLE `at_course` (
  `course_id` int(10) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `dept_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `at_course`
--

INSERT INTO `at_course` (`course_id`, `course_name`, `dept_id`) VALUES
(1, 'MCA', 1),
(2, 'BCA', 1);

-- --------------------------------------------------------

--
-- Table structure for table `at_department`
--

CREATE TABLE `at_department` (
  `dept_id` int(10) NOT NULL,
  `dept_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `at_department`
--

INSERT INTO `at_department` (`dept_id`, `dept_name`) VALUES
(1, 'Computer Applications');

-- --------------------------------------------------------

--
-- Table structure for table `at_section`
--

CREATE TABLE `at_section` (
  `sec_id` int(10) NOT NULL,
  `section_name` varchar(100) NOT NULL,
  `sem_id` int(10) DEFAULT NULL,
  `course_id` int(10) DEFAULT NULL,
  `dept_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `at_section`
--

INSERT INTO `at_section` (`sec_id`, `section_name`, `sem_id`, `course_id`, `dept_id`) VALUES
(1, 'A', 1, 1, 1),
(2, 'A', 2, 1, 1),
(3, 'A', 3, 2, 1),
(4, 'B', 3, 2, 1),
(5, 'A', 4, 2, 1),
(6, 'A', 5, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `at_semester`
--

CREATE TABLE `at_semester` (
  `sem_id` int(10) NOT NULL,
  `semester_name` varchar(100) NOT NULL,
  `course_id` int(10) DEFAULT NULL,
  `dept_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `at_semester`
--

INSERT INTO `at_semester` (`sem_id`, `semester_name`, `course_id`, `dept_id`) VALUES
(1, 'IV', 1, 1),
(2, 'II', 1, 1),
(3, 'II', 2, 1),
(4, 'IV', 2, 1),
(5, 'VI', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `at_subject`
--

CREATE TABLE `at_subject` (
  `sub_id` int(10) NOT NULL,
  `sub_name` varchar(200) DEFAULT NULL,
  `t_id` int(10) DEFAULT NULL,
  `dept_id` int(10) DEFAULT NULL,
  `course_id` int(10) DEFAULT NULL,
  `sem_id` int(10) DEFAULT NULL,
  `sec_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `at_subject`
--

INSERT INTO `at_subject` (`sub_id`, `sub_name`, `t_id`, `dept_id`, `course_id`, `sem_id`, `sec_id`) VALUES
(1, 'Java', 1, 1, 1, 1, 1),
(2, 'Computer_Graphics', 2, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `at_teacher`
--

CREATE TABLE `at_teacher` (
  `id` int(10) NOT NULL,
  `t_id` varchar(20) NOT NULL,
  `t_name` varchar(100) NOT NULL,
  `t_design` varchar(100) NOT NULL,
  `t_username` varchar(100) NOT NULL,
  `t_password` varchar(100) NOT NULL,
  `t_dept` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `at_teacher`
--

INSERT INTO `at_teacher` (`id`, `t_id`, `t_name`, `t_design`, `t_username`, `t_password`, `t_dept`) VALUES
(1, 'MCA-454', 'Ms. Nisha', 'Assistant Professor', 'nisha.mca', '1', '1'),
(2, 'MCA-455', 'Mr. Satyawan', 'Assistant Professor', 'satyawan.mca', '1', '1'),
(3, 'MCA-459', 'Mr. Rohit', 'Assistant Professor', 'rohit.mca', '1', '1'),
(4, 'MCA-461', 'Ms. Renu', 'Assistant Professor', 'renu.mca', '1', '1'),
(5, 'MCA-462', 'Mr. Sandeep', 'Assistant Professor', 'sandeep.mca', '1', '1'),
(6, 'MCA-466', 'Mr. Rajan Saluja', 'Assistant Professor', 'rajan.mca', '1', '1'),
(7, 'MCA-467', 'Ms. Reema Lalit', 'Assistant Professor', 'reema.mca', '1', '1'),
(8, 'MCA-469', 'Ms. Mandeep', 'Assistant Professor', 'mandeep.mca', '1', '1'),
(9, 'MCA-474', 'Ms. Sanchi', 'Assistant Professor', 'sanchi.mca', '1', '1'),
(10, 'MCA-480', 'Ms. Rashmi', 'Assistant Professor', 'rashmi.mca', '1', '1'),
(11, 'MCA-400', 'Mr. Dinesh Verma', 'Associate Professor', 'dinesh.mca', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `at_timetable`
--

CREATE TABLE `at_timetable` (
  `id` int(10) NOT NULL,
  `start_at` time DEFAULT NULL,
  `end_at` time DEFAULT NULL,
  `t_id` varchar(20) DEFAULT NULL,
  `t_name` varchar(100) DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `semester` varchar(100) DEFAULT NULL,
  `section` varchar(100) DEFAULT NULL,
  `groupid` varchar(10) DEFAULT NULL,
  `subject_as` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `at_timetable`
--

INSERT INTO `at_timetable` (`id`, `start_at`, `end_at`, `t_id`, `t_name`, `day`, `subject`, `course`, `semester`, `section`, `groupid`, `subject_as`) VALUES
(1, '09:05:00', '10:00:00', 'MCA-400', 'Mr. Dinesh Verma', 'Monday', 'Object Oriented Programming with C++', 'MCA', 'II', 'A', 'null', 'OOPS'),
(2, '10:55:00', '11:50:00', 'MCA-400', 'Mr. Dinesh Verma', 'Monday', 'C Lab', 'BCA', 'II', 'A', 'G1', 'clab'),
(3, '10:00:00', '10:55:00', 'MCA-466', 'Mr. Rajan Saluja', 'Monday', 'Advanced Programming in C', 'BCA', 'II', 'B', 'null', 'advC'),
(4, '12:45:00', '14:35:00', 'MCA-466', 'Mr. Rajan Saluja', 'Monday', 'C Lab', 'BCA', 'II', 'B', 'G1', 'clab'),
(5, '09:05:00', '10:00:00', 'MCA-467', 'Ms. Reema Lalit', 'Monday', 'Data Warehouse and Data Mining', 'MCA', 'IV', 'A', 'null', 'DWDM'),
(6, '10:55:00', '11:50:00', 'MCA-467', 'Ms. Reema Lalit', 'Monday', 'Visual Basic', 'BCA', 'VI', 'A', 'null', 'VB'),
(7, '12:45:00', '14:35:00', 'MCA-467', 'Ms. Reema Lalit', 'Monday', 'VB Lab', 'BCA', 'VI', 'A', 'G1', 'VBlab'),
(8, '09:05:00', '10:00:00', 'MCA-461', 'Ms. Renu', 'Monday', 'ADS Lab', 'BCA', 'IV', 'A', 'G2', 'ADSlab'),
(9, '10:55:00', '11:50:00', 'MCA-461', 'Ms. Renu', 'Monday', 'Advanced Data Structure', 'BCA', 'IV', 'A', 'null', 'ADS'),
(10, '13:40:00', '14:35:00', 'MCA-461', 'Ms. Renu', 'Monday', 'Data Structure', 'MCA', 'II', 'A', 'null', 'DS'),
(11, '14:35:00', '16:25:00', 'MCA-461', 'Ms. Renu', 'Monday', 'DS Lab', 'MCA', 'II', 'A', 'null', 'DSlab'),
(12, '09:05:00', '10:00:00', 'MCA-455', 'Mr. Satyawan', 'Monday', 'Adv. C++ Lab', 'BCA', 'IV', 'A', 'G1', 'advcpplab'),
(13, '10:55:00', '12:45:00', 'MCA-455', 'Mr. Satyawan', 'Monday', 'Java Lab', 'MCA', 'IV', 'A', 'null', 'javalab'),
(14, '15:30:00', '16:25:00', 'MCA-455', 'Mr. Satyawan', 'Monday', 'Java Programming', 'MCA', 'IV', 'A', 'null', 'java'),
(15, '10:00:00', '10:55:00', 'MCA-469', 'Ms. Mandeep', 'Monday', 'System Programming', 'MCA', 'II', 'A', 'null', 'SP'),
(16, '10:55:00', '11:50:00', 'MCA-469', 'Ms. Mandeep', 'Monday', 'Office Automation Tools Lab', 'BCA', 'II', 'A', 'null', 'OATlab'),
(17, '13:40:00', '14:35:00', 'MCA-469', 'Ms. Mandeep', 'Monday', 'Office  Automation Tools', 'BCA', 'II', 'A', 'null', 'OATlab'),
(18, '10:00:00', '10:55:00', 'MCA-454', 'Ms. Nisha', 'Monday', 'Computer Graphics', 'BCA', 'VI', 'A', 'null', 'CG'),
(19, '13:40:00', '14:35:00', 'MCA-454', 'Ms. Nisha', 'Monday', 'Computer Graphics', 'MCA', 'IV', 'A', 'null', 'CG'),
(20, '09:05:00', '10:00:00', 'MCA-480', 'Ms. Rashmi', 'Monday', 'Adv. C++ Lab', 'BCA', 'IV', 'A', 'G3', 'advcpplab'),
(21, '10:00:00', '10:55:00', 'MCA-480', 'Ms. Rashmi', 'Monday', 'Artificial Intelligence', 'MCA', 'IV', 'A', 'null', 'AI'),
(22, '12:45:00', '14:35:00', 'MCA-480', 'Ms. Rashmi', 'Monday', 'Advanced Programming in C++', 'BCA', 'IV', 'A', 'null', 'advcpp'),
(23, '09:05:00', '10:00:00', 'MCA-459', 'Mr. Rohit', 'Monday', 'Web Designing', 'BCA', 'VI', 'A', 'null', 'web'),
(24, '10:00:00', '10:55:00', 'MCA-459', 'Mr. Rohit', 'Monday', 'Structured System Analysis and Design', 'BCA', 'II', 'A', 'null', 'ssad'),
(25, '11:50:00', '12:45:00', 'MCA-459', 'Mr. Rohit', 'Monday', 'Principles of Programming Language', 'MCA', 'II', 'A', 'null', 'pl'),
(26, '12:45:00', '14:35:00', 'MCA-459', 'Mr. Rohit', 'Monday', 'Web Lab', 'BCA', 'VI', 'A', 'G2', 'weblab'),
(27, '10:55:00', '11:50:00', 'MCA-462', 'Mr. Sandeep', 'Monday', 'E-Commerce', 'BCA', 'IV', 'A', 'null', 'ecom'),
(28, '11:50:00', '12:45:00', 'MCA-462', 'Mr. Sandeep', 'Monday', 'Web Designing', 'MCA', 'II', 'A', 'null', 'web'),
(29, '12:45:00', '14:35:00', 'MCA-474', 'Ms. Sanchi', 'Monday', 'Office Automation Tools Lab', 'BCA', 'II', 'B', 'G2', 'OATlab'),
(30, '14:35:00', '15:30:00', 'MCA-474', 'Ms. Sanchi', 'Monday', 'Advanced Computer Architecture', 'MCA', 'IV', 'A', 'null', 'ACA'),
(31, '09:05:00', '10:00:00', 'null', 'Ms. Tamanna', 'Monday', 'Mathematical Foundation-II', 'BCA', 'II', 'A', 'null', 'MF'),
(32, '09:05:00', '10:00:00', 'null', 'Dr. V.K. Kaushik', 'Monday', 'Mathematical Foundation-II', 'BCA', 'II', 'B', 'null', 'MF'),
(33, '09:05:00', '10:00:00', 'null', 'Ms. Rekha', 'Monday', 'Personality Development', 'BCA', 'II', 'B', 'null', 'PD'),
(34, '11:50:00', '12:45:00', 'null', 'Ms. Rekha', 'Monday', 'Personality Development', 'BCA', 'II', 'A', 'null', 'PD'),
(35, '09:05:00', '10:00:00', 'MCA-400', 'Mr. Dinesh Verma', 'Tuesday', 'Object Oriented Programming with C++', 'MCA', 'II', 'A', 'null', 'OOPS'),
(36, '09:05:00', '10:00:00', 'MCA-466', 'Mr. Rajan Saluja', 'Tuesday', 'Advanced Programming in C', 'BCA', 'II', 'A', 'null', 'advC'),
(37, '10:55:00', '11:50:00', 'MCA-466', 'Mr. Rajan Saluja', 'Tuesday', 'C Lab', 'BCA', 'II', 'B', 'G2', 'clab'),
(38, '12:45:00', '13:40:00', 'MCA-466', 'Mr. Rajan Saluja', 'Tuesday', 'Operating System-II', 'BCA', 'VI', 'A', 'null', 'OS'),
(39, '13:40:00', '14:35:00', 'MCA-466', 'Mr. Rajan Saluja', 'Tuesday', 'Advanced Programming in C', 'BCA', 'II', 'B', 'null', 'advC'),
(40, '09:05:00', '10:00:00', 'MCA-467', 'Ms. Reema Lalit', 'Tuesday', 'Visual Basic', 'BCA', 'VI', 'A', 'null', 'VB'),
(41, '09:05:00', '10:00:00', 'MCA-467', 'Ms. Reema Lalit', 'Tuesday', 'Data Warehouse and Data Mining', 'MCA', 'IV', 'A', 'null', 'DWDM'),
(42, '13:40:00', '14:35:00', 'MCA-467', 'Ms. Reema Lalit', 'Tuesday', 'VB Lab', 'BCA', 'VI', 'A', 'G2', 'VBlab'),
(43, '09:05:00', '10:55:00', 'MCA-461', 'Ms. Renu', 'Tuesday', 'ADS Lab', 'BCA', 'IV', 'A', 'G3', 'ADSlab'),
(44, '13:40:00', '14:35:00', 'MCA-461', 'Ms. Renu', 'Tuesday', 'Data Structure', 'MCA', 'II', 'A', 'null', 'DS'),
(45, '09:05:00', '10:55:00', 'MCA-455', 'Mr. Satyawan', 'Tuesday', 'ADS Lab', 'BCA', 'IV', 'A', 'G1', 'ADSlab'),
(46, '10:55:00', '11:50:00', 'MCA-455', 'Mr. Satyawan', 'Tuesday', 'Java Programming', 'BCA', 'VI', 'A', 'null', 'java'),
(47, '14:35:00', '15:30:00', 'MCA-455', 'Mr. Satyawan', 'Tuesday', 'Java Programming', 'MCA', 'IV', 'A', 'null', 'java'),
(48, '10:00:00', '10:55:00', 'MCA-469', 'Ms. Mandeep', 'Tuesday', 'Information Technology', 'BCA', 'VI', 'A', 'null', 'IT'),
(49, '11:50:00', '12:45:00', 'MCA-469', 'Ms. Mandeep', 'Tuesday', 'System Programming', 'MCA', 'II', 'A', 'null', 'SP'),
(50, '09:05:00', '10:55:00', 'MCA-454', 'Ms. Nisha', 'Tuesday', 'CG Lab', 'MCA', 'IV', 'A', 'null', 'cglab'),
(51, '11:50:00', '12:45:00', 'MCA-454', 'Ms. Nisha', 'Tuesday', 'Computer Graphics', 'MCA', 'IV', 'A', 'null', 'CG'),
(52, '13:40:00', '14:35:00', 'MCA-454', 'Ms. Nisha', 'Tuesday', 'Management Information System', 'BCA', 'IV', 'A', 'null', 'MIS'),
(53, '09:05:00', '10:55:00', 'MCA-480', 'Ms. Rashmi', 'Tuesday', 'Advanced C++ Lab', 'BCA', 'IV', 'A', 'G2', 'advcpplab'),
(54, '10:55:00', '11:50:00', 'MCA-480', 'Ms. Rashmi', 'Tuesday', 'Computer Oriented Statistical Method', 'BCA', 'IV', 'A', 'null', 'cosm'),
(55, '13:40:00', '14:35:00', 'MCA-480', 'Ms. Rashmi', 'Tuesday', 'Artificial Intelligence', 'MCA', 'IV', 'A', 'null', 'AI'),
(56, '10:00:00', '10:55:00', 'MCA-459', 'Mr. Rohit', 'Tuesday', 'Principles of Programming Language', 'MCA', 'II', 'A', 'null', 'pl'),
(57, '10:55:00', '11:50:00', 'MCA-459', 'Mr. Rohit', 'Tuesday', 'Structured System Analysis and Design', 'BCA', 'II', 'A', 'null', 'ssad'),
(58, '13:40:00', '14:35:00', 'MCA-459', 'Mr. Rohit', 'Tuesday', 'Web Lab', 'BCA', 'VI', 'A', 'G1', 'weblab'),
(59, '10:55:00', '11:50:00', 'MCA-462', 'Mr. Sandeep', 'Tuesday', 'Web Designing', 'MCA', 'II', 'A', 'null', 'web'),
(60, '12:45:00', '13:40:00', 'MCA-462', 'Mr. Sandeep', 'Tuesday', 'E-Commerce', 'BCA', 'IV', 'A', 'null', 'ecom'),
(61, '14:35:00', '16:25:00', 'MCA-462', 'Mr. Sandeep', 'Tuesday', 'Web Lab', 'MCA', 'II', 'A', 'null', 'weblab'),
(62, '09:05:00', '10:00:00', 'MCA-474', 'Ms. Sanchi', 'Tuesday', 'Logical Organisation of Computer-II', 'BCA', 'II', 'B', 'null', 'loc'),
(63, '10:55:00', '11:50:00', 'MCA-474', 'Ms. Sanchi', 'Tuesday', 'Office Automation Tools Lab', 'BCA', 'II', 'B', 'G1', 'OATlab'),
(64, '15:30:00', '16:25:00', 'MCA-474', 'Ms. Sanchi', 'Tuesday', 'Advanced Computer Architecture', 'MCA', 'IV', 'A', 'null', 'ACA'),
(65, '10:00:00', '10:55:00', 'null', 'Ms. Tamanna', 'Tuesday', 'Mathematical Foundation-II', 'BCA', 'II', 'A', 'null', 'MF'),
(66, '12:45:00', '13:40:00', 'null', 'Ms. Tamanna', 'Tuesday', 'Mathematical Foundation-II', 'BCA', 'II', 'A', 'null', 'MF'),
(67, '10:00:00', '10:55:00', 'null', 'Dr. V.K. Kaushik', 'Tuesday', 'Mathematical Foundation-II', 'BCA', 'II', 'B', 'null', 'MF'),
(68, '12:45:00', '13:40:00', 'null', 'Dr. V.K. Kaushik', 'Tuesday', 'Mathematical Foundation-II', 'BCA', 'II', 'B', 'null', 'MF'),
(69, '13:40:00', '14:35:00', 'null', 'Ms. Rekha', 'Tuesday', 'Personality Development', 'BCA', 'II', 'A', 'null', 'PD'),
(70, '09:05:00', '10:55:00', 'MCA-400', 'Mr. Dinesh Verma', 'Wednesday', 'OOPS Lab', 'MCA', 'II', 'A', 'null', 'oopslab'),
(71, '09:05:00', '10:00:00', 'MCA-466', 'Mr. Rajan Saluja', 'Wednesday', 'Advanced Programming in C', 'BCA', 'II', 'A', 'null', 'advC'),
(72, '10:00:00', '10:55:00', 'MCA-466', 'Mr. Rajan Saluja', 'Wednesday', 'Advanced Programming in C', 'BCA', 'II', 'B', 'null', 'advC'),
(73, '12:45:00', '14:35:00', 'MCA-466', 'Mr. Rajan Saluja', 'Wednesday', 'C Lab', 'BCA', 'II', 'A', 'G2', 'clab'),
(74, '09:05:00', '10:55:00', 'MCA-467', 'Ms. Reema Lalit', 'Wednesday', 'VB Lab', 'BCA', 'VI', 'A', 'G2', 'VBlab'),
(75, '12:45:00', '13:40:00', 'MCA-467', 'Ms. Reema Lalit', 'Wednesday', 'Relational Database Management System', 'BCA', 'IV', 'A', 'null', 'rdbms'),
(76, '14:35:00', '15:30:00', 'MCA-467', 'Ms. Reema Lalit', 'Wednesday', 'Data Warehouse and Data Mining', 'MCA', 'IV', 'A', 'null', 'DWDM'),
(77, '10:55:00', '11:50:00', 'MCA-461', 'Ms. Renu', 'Wednesday', 'ADS Lab', 'BCA', 'IV', 'A', 'G3', 'ADSlab'),
(78, '11:50:00', '12:45:00', 'MCA-461', 'Ms. Renu', 'Wednesday', 'Data Structure', 'MCA', 'II', 'A', 'null', 'DS'),
(79, '13:40:00', '14:35:00', 'MCA-461', 'Ms. Renu', 'Wednesday', 'Advanced Data Structure', 'BCA', 'IV', 'A', 'null', 'ADS'),
(80, '10:00:00', '10:55:00', 'MCA-455', 'Mr. Satyawan', 'Wednesday', 'Java Programming', 'MCA', 'IV', 'A', 'null', 'java'),
(81, '10:55:00', '11:50:00', 'MCA-455', 'Mr. Satyawan', 'Wednesday', 'ADS Lab', 'BCA', 'IV', 'A', 'G1', 'ADSlab'),
(82, '10:55:00', '11:50:00', 'MCA-469', 'Ms. Mandeep', 'Wednesday', 'System Programming', 'MCA', 'II', 'A', 'null', 'SP'),
(83, '13:40:00', '14:35:00', 'MCA-469', 'Ms. Mandeep', 'Wednesday', 'Information Technology', 'BCA', 'VI', 'A', 'null', 'IT'),
(84, '15:30:00', '16:25:00', 'MCA-469', 'Ms. Mandeep', 'Wednesday', 'Seminar', 'MCA', 'II', 'A', 'null', 'seminar'),
(85, '10:55:00', '12:45:00', 'MCA-454', 'Ms. Nisha', 'Wednesday', 'CG Lab', 'MCA', 'IV', 'A', 'null', 'cglab'),
(86, '13:40:00', '14:35:00', 'MCA-454', 'Ms. Nisha', 'Wednesday', 'Computer Graphics', 'BCA', 'VI', 'A', 'null', 'CG'),
(87, '15:30:00', '16:25:00', 'MCA-454', 'Ms. Nisha', 'Wednesday', 'Computer Graphics', 'MCA', 'IV', 'A', 'null', 'CG'),
(88, '09:05:00', '10:00:00', 'MCA-480', 'Ms. Rashmi', 'Wednesday', 'Computer Oriented Statistical Method', 'BCA', 'IV', 'A', 'null', 'cosm'),
(89, '10:55:00', '11:50:00', 'MCA-480', 'Ms. Rashmi', 'Wednesday', 'Adv. C++ Lab', 'BCA', 'IV', 'A', 'G2', 'advcpplab'),
(90, '13:40:00', '14:35:00', 'MCA-480', 'Ms. Rashmi', 'Wednesday', 'Artificial Intelligence', 'MCA', 'IV', 'A', 'null', 'AI'),
(91, '09:05:00', '10:55:00', 'MCA-459', 'Mr. Rohit', 'Wednesday', 'Web Lab', 'BCA', 'VI', 'A', 'G1', 'weblab'),
(92, '13:40:00', '14:35:00', 'MCA-459', 'Mr. Rohit', 'Wednesday', 'Principles of Programming Language', 'MCA', 'II', 'A', 'null', 'pl'),
(93, '09:05:00', '10:00:00', 'MCA-462', 'Mr. Sandeep', 'Wednesday', 'Structured System Analysis and Design', 'BCA', 'II', 'B', 'null', 'ssad'),
(94, '10:00:00', '10:55:00', 'MCA-462', 'Mr. Sandeep', 'Wednesday', 'E-Commerce', 'BCA', 'IV', 'A', 'null', 'ecom'),
(95, '12:45:00', '14:35:00', 'MCA-462', 'Mr. Sandeep', 'Wednesday', 'Office Automation Tools Lab', 'BCA', 'II', 'A', 'G1', 'OATlab'),
(96, '14:35:00', '15:30:00', 'MCA-462', 'Mr. Sandeep', 'Wednesday', 'Web Designing', 'MCA', 'II', 'A', 'null', 'web'),
(97, '09:05:00', '10:00:00', 'MCA-474', 'Ms. Sanchi', 'Wednesday', 'Advanced Computer Architecture', 'MCA', 'IV', 'A', 'null', 'ACA'),
(98, '10:00:00', '10:55:00', 'MCA-474', 'Ms. Sanchi', 'Wednesday', 'Logical Organisation of Computer-II', 'BCA', 'II', 'A', 'null', 'loc'),
(99, '13:40:00', '14:35:00', 'MCA-474', 'Ms. Sanchi', 'Wednesday', 'Logical Organisation of Computer-II', 'BCA', 'II', 'B', 'null', 'loc'),
(100, '10:55:00', '11:50:00', 'null', 'Ms. Tamanna', 'Wednesday', 'Mathematical Foundation-II', 'BCA', 'II', 'A', 'null', 'MF'),
(101, '10:55:00', '11:50:00', 'null', 'Dr. V.K. Kaushik', 'Wednesday', 'Mathematical Foundation-II', 'BCA', 'II', 'B', 'null', 'MF'),
(102, '12:45:00', '13:40:00', 'null', 'Ms. Rekha', 'Wednesday', 'Personality Development', 'BCA', 'II', 'B', 'null', 'PD'),
(103, '10:55:00', '11:50:00', 'MCA-400', 'Mr. Dinesh Verma', 'Thursday', 'Object Oriented Programming with C++', 'MCA', 'II', 'A', 'null', 'OOPS'),
(104, '14:35:00', '16:25:00', 'MCA-400', 'Mr. Dinesh Verma', 'Thursday', 'OOPS Lab', 'MCA', 'II', 'A', 'null', 'oopslab'),
(105, '10:55:00', '11:50:00', 'MCA-466', 'Mr. Rajan Saluja', 'Thursday', 'Advanced Programming in C', 'BCA', 'II', 'A', 'null', 'advC'),
(106, '12:45:00', '13:40:00', 'MCA-466', 'Mr. Rajan Saluja', 'Thursday', 'C Lab', 'BCA', 'II', 'A', 'G2', 'clab'),
(107, '13:40:00', '14:35:00', 'MCA-466', 'Mr. Rajan Saluja', 'Thursday', 'Operating System-II', 'BCA', 'VI', 'A', 'null', 'OS'),
(108, '09:05:00', '10:00:00', 'MCA-467', 'Ms. Reema Lalit', 'Thursday', 'VB Lab', 'BCA', 'VI', 'A', 'G1', 'VBlab'),
(109, '10:00:00', '10:55:00', 'MCA-467', 'Ms. Reema Lalit', 'Thursday', 'Data Warehouse and Data Mining', 'MCA', 'IV', 'A', 'null', 'DWDM'),
(110, '13:40:00', '14:35:00', 'MCA-467', 'Ms. Reema Lalit', 'Thursday', 'Relational Database Management System', 'BCA', 'IV', 'A', 'null', 'rdbms'),
(111, '10:00:00', '11:50:00', 'MCA-461', 'Ms. Renu', 'Thursday', 'ADS Lab', 'BCA', 'IV', 'A', 'G2', 'ADSlab'),
(112, '13:40:00', '14:35:00', 'MCA-461', 'Ms. Renu', 'Thursday', 'Data Structure', 'MCA', 'II', 'A', 'null', 'DS'),
(113, '09:05:00', '10:00:00', 'MCA-455', 'Mr. Satyawan', 'Thursday', 'Java Programming', 'MCA', 'IV', 'A', 'null', 'java'),
(114, '10:00:00', '11:50:00', 'MCA-455', 'Mr. Satyawan', 'Thursday', 'Adv. C++ Lab', 'BCA', 'IV', 'A', 'G1', 'advcpplab'),
(115, '12:45:00', '13:40:00', 'MCA-455', 'Mr. Satyawan', 'Thursday', 'Java Programming', 'BCA', 'VI', 'A', 'null', 'java'),
(116, '09:05:00', '10:00:00', 'MCA-469', 'Ms. Mandeep', 'Thursday', 'System Programming', 'MCA', 'II', 'A', 'null', 'SP'),
(117, '10:55:00', '11:50:00', 'MCA-469', 'Ms. Mandeep', 'Thursday', 'Information Technology', 'BCA', 'VI', 'A', 'null', 'IT'),
(118, '13:40:00', '14:35:00', 'MCA-469', 'Ms. Mandeep', 'Thursday', 'Office Automation Tools', 'BCA', 'II', 'B', 'null', 'OAT'),
(119, '15:30:00', '16:25:00', 'MCA-469', 'Ms. Mandeep', 'Thursday', 'Seminar', 'MCA', 'IV', 'A', 'G2', 'seminar'),
(120, '09:05:00', '10:00:00', 'MCA-454', 'Ms. Nisha', 'Thursday', 'Management Information System', 'BCA', 'IV', 'A', 'null', 'MIS'),
(121, '13:40:00', '14:35:00', 'MCA-454', 'Ms. Nisha', 'Thursday', 'Computer Graphics', 'MCA', 'IV', 'A', 'null', 'CG'),
(122, '15:30:00', '16:25:00', 'MCA-454', 'Ms. Nisha', 'Thursday', 'Seminar', 'MCA', 'IV', 'A', 'G1', 'seminar'),
(123, '10:00:00', '11:50:00', 'MCA-480', 'Ms. Rashmi', 'Thursday', 'Adv. C++ Lab', 'BCA', 'IV', 'A', 'G3', 'advcpplab'),
(124, '12:45:00', '13:40:00', 'MCA-480', 'Ms. Rashmi', 'Thursday', 'Advanced Programming in C++', 'BCA', 'IV', 'A', 'null', 'advcpp'),
(125, '14:35:00', '15:30:00', 'MCA-480', 'Ms. Rashmi', 'Thursday', 'Artificial Intelligence', 'MCA', 'IV', 'A', 'null', 'AI'),
(126, '09:05:00', '10:00:00', 'MCA-459', 'Mr. Rohit', 'Thursday', 'Web Lab', 'BCA', 'VI', 'A', 'G2', 'weblab'),
(127, '10:00:00', '10:55:00', 'MCA-459', 'Mr. Rohit', 'Thursday', 'Web Designing', 'BCA', 'VI', 'A', 'null', 'web'),
(128, '11:50:00', '12:45:00', 'MCA-459', 'Mr. Rohit', 'Thursday', 'Principles of Programming Language', 'MCA', 'II', 'A', 'null', 'pl'),
(129, '10:00:00', '10:55:00', 'MCA-462', 'Mr. Sandeep', 'Thursday', 'Web Designing', 'MCA', 'II', 'A', 'null', 'web'),
(130, '10:55:00', '11:50:00', 'MCA-462', 'Mr. Sandeep', 'Thursday', 'Structured System Analysis and Design', 'BCA', 'II', 'B', 'null', 'ssad'),
(131, '12:45:00', '13:40:00', 'MCA-462', 'Mr. Sandeep', 'Thursday', 'Office Automation Tools Lab', 'BCA', 'II', 'A', 'G1', 'OATlab'),
(132, '09:05:00', '10:00:00', 'MCA-474', 'Ms. Sanchi', 'Thursday', 'Logical Organisation of Computer-II', 'BCA', 'II', 'B', 'null', 'loc'),
(133, '10:55:00', '11:50:00', 'MCA-474', 'Ms. Sanchi', 'Thursday', 'Advanced Computer Architecture', 'MCA', 'IV', 'A', 'null', 'ACA'),
(134, '13:40:00', '14:35:00', 'MCA-474', 'Ms. Sanchi', 'Thursday', 'Logical Organisation of Computer-II', 'BCA', 'II', 'A', 'null', 'loc'),
(135, '15:30:00', '16:25:00', 'MCA-474', 'Ms. Sanchi', 'Thursday', 'Seminar', 'MCA', 'IV', 'A', 'G3', 'seminar'),
(136, '10:00:00', '10:55:00', 'null', 'Ms. Tamanna', 'Thursday', 'Mathematical Foundation-II', 'BCA', 'II', 'A', 'null', 'MF'),
(137, '10:00:00', '10:55:00', 'null', 'Dr. V.K. Kaushik', 'Thursday', 'Mathematical Foundation-II', 'BCA', 'II', 'B', 'null', 'MF'),
(138, '09:05:00', '10:00:00', 'null', 'Ms. Rekha', 'Thursday', 'Personality Development', 'BCA', 'II', 'A', 'null', 'PD'),
(139, '12:45:00', '13:40:00', 'null', 'Ms. Rekha', 'Thursday', 'Personality Development', 'BCA', 'II', 'B', 'null', 'PD'),
(140, '10:55:00', '11:50:00', 'MCA-400', 'Mr. Dinesh Verma', 'Friday', 'Object Oriented Programming with C++', 'MCA', 'II', 'A', 'null', 'OOPS'),
(141, '12:45:00', '14:35:00', 'MCA-400', 'Mr. Dinesh Verma', 'Friday', 'C Lab', 'BCA', 'II', 'A', 'G1', 'clab'),
(142, '09:05:00', '10:55:00', 'MCA-466', 'Mr. Rajan Saluja', 'Friday', 'C Lab', 'BCA', 'II', 'B', 'G2', 'clab'),
(143, '12:45:00', '14:35:00', 'MCA-466', 'Mr. Rajan Saluja', 'Friday', 'C Lab', 'BCA', 'II', 'B', 'G1', 'clab'),
(144, '13:40:00', '14:35:00', 'MCA-466', 'Mr. Rajan Saluja', 'Friday', 'Operating System-II', 'BCA', 'VI', 'A', 'null', 'OS'),
(145, '09:05:00', '10:00:00', 'MCA-467', 'Ms. Reema Lalit', 'Friday', 'Data Warehouse and Data Mining', 'MCA', 'IV', 'A', 'null', 'DWDM'),
(146, '10:55:00', '11:50:00', 'MCA-467', 'Ms. Reema Lalit', 'Friday', 'Visual Basic', 'BCA', 'VI', 'A', 'null', 'VB'),
(147, '12:45:00', '13:40:00', 'MCA-467', 'Ms. Reema Lalit', 'Friday', 'Relational Database Management System', 'BCA', 'IV', 'A', 'null', 'rdbms'),
(148, '10:55:00', '11:50:00', 'MCA-461', 'Ms. Renu', 'Friday', 'Advanced Data Structure', 'BCA', 'IV', 'A', 'null', 'ADS'),
(149, '13:40:00', '15:30:00', 'MCA-461', 'Ms. Renu', 'Friday', 'DS Lab', 'MCA', 'II', 'A', 'null', 'DSlab'),
(150, '09:05:00', '10:00:00', 'MCA-455', 'Mr. Satyawan', 'Friday', 'Java Programming', 'BCA', 'VI', 'A', 'null', 'java'),
(151, '10:55:00', '11:50:00', 'MCA-455', 'Mr. Satyawan', 'Friday', 'Java Programming', 'MCA', 'IV', 'A', 'null', 'java'),
(152, '14:35:00', '16:25:00', 'MCA-455', 'Mr. Satyawan', 'Friday', 'Java Lab', 'MCA', 'IV', 'A', 'null', 'javalab'),
(153, '10:00:00', '10:55:00', 'MCA-469', 'Ms. Mandeep', 'Friday', 'Office Automation Tools', 'BCA', 'II', 'A', 'null', 'OAT'),
(154, '10:55:00', '11:50:00', 'MCA-469', 'Ms. Mandeep', 'Friday', 'Office Automation Tools', 'BCA', 'II', 'B', 'null', 'OAT'),
(155, '12:45:00', '14:35:00', 'MCA-469', 'Ms. Mandeep', 'Friday', 'Office Automation Tools Lab', 'BCA', 'II', 'A', 'G2', 'OATlab'),
(156, '15:30:00', '16:25:00', 'MCA-469', 'Ms. Mandeep', 'Friday', 'System Programming', 'MCA', 'II', 'A', 'null', 'SP'),
(157, '09:05:00', '10:00:00', 'MCA-454', 'Ms. Nisha', 'Friday', 'Management Information System', 'BCA', 'IV', 'A', 'null', 'MIS'),
(158, '10:00:00', '10:55:00', 'MCA-454', 'Ms. Nisha', 'Friday', 'Computer Graphics', 'MCA', 'IV', 'A', 'null', 'CG'),
(159, '12:45:00', '13:40:00', 'MCA-454', 'Ms. Nisha', 'Friday', 'Computer Graphics', 'BCA', 'VI', 'A', 'null', 'CG'),
(160, '10:00:00', '10:55:00', 'MCA-480', 'Ms. Rashmi', 'Friday', 'Computer Oriented Statistical Method', 'BCA', 'IV', 'A', 'null', 'cosm'),
(161, '11:50:00', '12:45:00', 'MCA-480', 'Ms. Rashmi', 'Friday', 'Artificial Intelligence', 'MCA', 'IV', 'A', 'null', 'AI'),
(162, '13:40:00', '14:35:00', 'MCA-480', 'Ms. Rashmi', 'Friday', 'Advanced Programming in C++', 'BCA', 'IV', 'A', 'null', 'advcpp'),
(163, '09:05:00', '10:00:00', 'MCA-459', 'Mr. Rohit', 'Friday', 'Structured System Analysis and Design', 'BCA', 'II', 'A', 'null', 'ssad'),
(164, '10:00:00', '10:55:00', 'MCA-459', 'Mr. Rohit', 'Friday', 'Web Designing', 'BCA', 'VI', 'A', 'null', 'web'),
(165, '11:50:00', '12:45:00', 'MCA-459', 'Mr. Rohit', 'Friday', 'Principles of Programming Language', 'MCA', 'II', 'A', 'null', 'pl'),
(166, '09:05:00', '10:55:00', 'MCA-462', 'Mr. Sandeep', 'Friday', 'Web Lab', 'MCA', 'II', 'A', 'null', 'weblab'),
(167, '13:40:00', '14:35:00', 'MCA-462', 'Mr. Sandeep', 'Friday', 'Structured System Analysis and Design', 'BCA', 'II', 'B', 'null', 'ssad'),
(168, '09:05:00', '10:55:00', 'MCA-474', 'Ms. Sanchi', 'Friday', 'Office Automation Tools Lab', 'BCA', 'II', 'B', 'G1', 'OATlab'),
(169, '10:55:00', '11:50:00', 'MCA-474', 'Ms. Sanchi', 'Friday', 'Logical Organisation of Computer-II', 'BCA', 'II', 'A', 'null', 'loc'),
(170, '12:45:00', '13:40:00', 'MCA-474', 'Ms. Sanchi', 'Friday', 'Office Automation Tools Lab', 'BCA', 'II', 'B', 'G2', 'OATlab'),
(171, '13:40:00', '14:35:00', 'MCA-474', 'Ms. Sanchi', 'Friday', 'Advanced Computer Architecture', 'MCA', 'IV', 'A', 'null', 'ACA');

-- --------------------------------------------------------

--
-- Table structure for table `cap_bca_ii_a`
--

CREATE TABLE `cap_bca_ii_a` (
  `roll_no` int(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sub1` int(20) DEFAULT NULL,
  `sub2` int(20) DEFAULT NULL,
  `sub3` int(20) DEFAULT NULL,
  `sub4` int(20) DEFAULT NULL,
  `sub5` int(20) DEFAULT NULL,
  `sub6` int(20) DEFAULT NULL,
  `total` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cap_bca_ii_a`
--

INSERT INTO `cap_bca_ii_a` (`roll_no`, `name`, `sub1`, `sub2`, `sub3`, `sub4`, `sub5`, `sub6`, `total`) VALUES
(19001, 'Rajan', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19002, 'Ranjana', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19003, 'Rajni', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19004, 'Rani', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `computerapplications_mca_iv`
--

CREATE TABLE `computerapplications_mca_iv` (
  `id` int(10) NOT NULL,
  `roll_no` int(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `section` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `computerapplications_mca_iv`
--

INSERT INTO `computerapplications_mca_iv` (`id`, `roll_no`, `name`, `section`) VALUES
(1, 18701, 'Dhairya', 'A'),
(2, 18702, 'Govind', 'A'),
(3, 18703, 'Deepak', 'A'),
(4, 18705, 'Amit', 'A'),
(5, 18706, 'Parveen', 'A'),
(6, 18707, 'Gurpreet', 'A'),
(7, 18708, 'Kanwaljeet', 'A'),
(8, 18710, 'Paras', 'A'),
(9, 18711, 'Ajeet', 'A'),
(10, 19772, 'Tanya', 'A'),
(11, 19773, 'Mohit', 'A'),
(12, 19774, 'Rohit Bhardwaj', 'A'),
(13, 19775, 'Mahesh', 'A'),
(14, 19776, 'Nitu', 'A'),
(15, 19777, 'Vaibhav', 'A'),
(16, 19778, 'Kiran', 'A'),
(17, 19779, 'Shristy', 'A'),
(18, 19780, 'Pooja', 'A'),
(19, 19781, 'Richa', 'A'),
(20, 19782, 'Nancy', 'A'),
(21, 19784, 'Nitish', 'A'),
(22, 19785, 'Umang', 'A'),
(23, 19786, 'Sakshi', 'A'),
(24, 19789, 'Rakhi', 'A'),
(25, 19790, 'Karan', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `c_id` int(11) NOT NULL,
  `course` varchar(100) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`c_id`, `course`, `dept_id`) VALUES
(1, 'MCA', 1),
(2, 'BCA', 1),
(3, 'MBA', 2),
(4, 'BBA', 2),
(5, 'BVoc', 3),
(6, 'Btech-CSE', 4),
(7, 'Btech-IT', 4),
(8, 'Btech-Mechanical', 4),
(9, 'Btech-ECE', 4),
(10, 'Btech-Textile', 4),
(11, 'Btech-Civil', 4),
(12, 'Mtech-CSE', 5);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `dept` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `dept`) VALUES
(1, 'Computer Application'),
(2, 'Business Administration'),
(3, 'Vocational Education'),
(4, 'Btech'),
(5, 'Mtech');

-- --------------------------------------------------------

--
-- Table structure for table `mca455_bca_iv_a_g1_advcpplab`
--

CREATE TABLE `mca455_bca_iv_a_g1_advcpplab` (
  `id` int(10) NOT NULL,
  `roll_no` int(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mca455_mca_iv_a_javalab`
--

CREATE TABLE `mca455_mca_iv_a_javalab` (
  `id` int(10) NOT NULL,
  `roll_no` int(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `19_Mar_20_18_33_26` varchar(10) DEFAULT 'null',
  `19_Mar_20_20_10_47` varchar(10) DEFAULT 'null',
  `20_Mar_20_20_37_22` varchar(10) DEFAULT 'null',
  `20_Mar_20_20_52_49` varchar(10) DEFAULT 'null',
  `20_Mar_20_21_20_40` varchar(10) DEFAULT 'null',
  `20_Mar_20_21_21_41` varchar(10) DEFAULT 'null',
  `20_Mar_20_21_22_16` varchar(10) DEFAULT 'null',
  `23_Mar_20_14_25_20` varchar(10) DEFAULT 'null'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mca455_mca_iv_a_javalab`
--

INSERT INTO `mca455_mca_iv_a_javalab` (`id`, `roll_no`, `name`, `19_Mar_20_18_33_26`, `19_Mar_20_20_10_47`, `20_Mar_20_20_37_22`, `20_Mar_20_20_52_49`, `20_Mar_20_21_20_40`, `20_Mar_20_21_21_41`, `20_Mar_20_21_22_16`, `23_Mar_20_14_25_20`) VALUES
(1, 18701, 'Dhairya', 'on', 'on', 'on', 'null', 'on', 'on', 'on', 'null'),
(2, 18702, 'Govind', 'null', 'on', 'null', 'null', 'on', 'on', 'on', 'null'),
(3, 18703, 'Deepak', 'null', 'on', 'null', 'null', 'on', 'on', 'on', 'null'),
(4, 18705, 'Amit', 'on', 'on', 'null', 'null', 'on', 'on', 'on', 'null'),
(5, 18706, 'Parveen', 'null', 'on', 'on', 'null', 'on', 'on', 'on', 'null'),
(6, 18707, 'Gurpreet', 'null', 'on', 'null', 'null', 'on', 'on', 'on', 'null'),
(7, 18708, 'Kanwaljeet', 'null', 'on', 'null', 'null', 'on', 'on', 'on', 'null'),
(8, 18710, 'Paras', 'null', 'null', 'null', 'on', 'on', 'on', 'on', 'null'),
(9, 18711, 'Ajeet', 'on', 'on', 'null', 'null', 'on', 'on', 'on', 'null'),
(10, 19772, 'Tanya', 'on', 'on', 'null', 'null', 'on', 'on', 'on', 'null'),
(11, 19773, 'Mohit', 'null', 'on', 'null', 'null', 'null', 'on', 'on', 'null'),
(12, 19774, 'Rohit Bhardwaj', 'null', 'null', 'null', 'on', 'null', 'on', 'on', 'null'),
(13, 19775, 'Mahesh', 'null', 'on', 'on', 'null', 'null', 'on', 'on', 'null'),
(14, 19776, 'Nitu', 'null', 'null', 'null', 'null', 'on', 'on', 'on', 'on'),
(15, 19777, 'Vaibhav', 'on', 'on', 'on', 'null', 'on', 'on', 'on', 'null'),
(16, 19778, 'Kiran', 'null', 'on', 'null', 'null', 'on', 'on', 'on', 'null'),
(17, 19779, 'Shristy', 'null', 'on', 'null', 'null', 'on', 'on', 'on', 'null'),
(18, 19780, 'Pooja', 'null', 'on', 'null', 'null', 'on', 'on', 'on', 'on'),
(19, 19781, 'Richa', 'null', 'on', 'null', 'null', 'on', 'on', 'on', 'null'),
(20, 19782, 'Nancy', 'null', 'on', 'null', 'null', 'on', 'on', 'on', 'null'),
(21, 19784, 'Nitish', 'null', 'on', 'null', 'null', 'on', 'on', 'on', 'null'),
(22, 19785, 'Umang', 'null', 'on', 'on', 'null', 'on', 'on', 'on', 'null'),
(23, 19786, 'Sakshi', 'null', 'on', 'null', 'null', 'on', 'on', 'on', 'null'),
(24, 19789, 'Rakhi', 'null', 'on', 'null', 'null', 'on', 'on', 'on', 'null'),
(25, 19790, 'Karan', 'null', 'null', 'null', 'on', 'on', 'on', 'on', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `nisha_computerapplications_mca_iv_a_computer_graphics`
--

CREATE TABLE `nisha_computerapplications_mca_iv_a_computer_graphics` (
  `id` int(10) NOT NULL,
  `roll_no` int(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `11_Mar_20_12_06_20` varchar(10) DEFAULT 'null'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nisha_computerapplications_mca_iv_a_computer_graphics`
--

INSERT INTO `nisha_computerapplications_mca_iv_a_computer_graphics` (`id`, `roll_no`, `name`, `11_Mar_20_12_06_20`) VALUES
(1, 18701, 'Dhairya', 'on'),
(2, 18702, 'Govind', 'on'),
(3, 18703, 'Deepak', 'null'),
(4, 18705, 'Amit', 'null'),
(5, 18706, 'Parveen', 'null'),
(6, 18707, 'Gurpreet', 'null'),
(7, 18708, 'Kanwaljeet', 'on'),
(8, 18710, 'Paras', 'null'),
(9, 18711, 'Ajeet', 'null'),
(10, 19772, 'Tanya', 'null'),
(11, 19773, 'Mohit', 'on'),
(12, 19774, 'Rohit Bhardwaj', 'on'),
(13, 19775, 'Mahesh', 'null'),
(14, 19776, 'Nitu', 'on'),
(15, 19777, 'Vaibhav', 'on'),
(16, 19778, 'Kiran', 'on'),
(17, 19779, 'Shristy', 'on'),
(18, 19780, 'Pooja', 'on'),
(19, 19781, 'Richa', 'on'),
(20, 19782, 'Nancy', 'on'),
(21, 19784, 'Nitish', 'on'),
(22, 19785, 'Umang', 'on'),
(23, 19786, 'Sakshi', 'null'),
(24, 19789, 'Rakhi', 'null'),
(25, 19790, 'Karan', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `satyawan_computerapplications_mca_iv_a_java`
--

CREATE TABLE `satyawan_computerapplications_mca_iv_a_java` (
  `id` int(10) NOT NULL,
  `roll_no` int(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `11_Mar_20_11_06_52` varchar(10) DEFAULT 'null',
  `11_Mar_20_13_45_52` varchar(10) DEFAULT 'null',
  `11_Mar_20_21_55_00` varchar(10) DEFAULT 'null',
  `13_Mar_20_13_48_52` varchar(10) DEFAULT 'null'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `satyawan_computerapplications_mca_iv_a_java`
--

INSERT INTO `satyawan_computerapplications_mca_iv_a_java` (`id`, `roll_no`, `name`, `11_Mar_20_11_06_52`, `11_Mar_20_13_45_52`, `11_Mar_20_21_55_00`, `13_Mar_20_13_48_52`) VALUES
(1, 18701, 'Dhairya', 'on', 'on', 'null', 'on'),
(2, 18702, 'Govind', 'on', 'on', 'on', 'null'),
(3, 18703, 'Deepak', 'null', 'on', 'on', 'on'),
(4, 18705, 'Amit', 'null', 'on', 'null', 'on'),
(5, 18706, 'Parveen', 'null', 'on', 'on', 'on'),
(6, 18707, 'Gurpreet', 'null', 'on', 'null', 'null'),
(7, 18708, 'Kanwaljeet', 'on', 'on', 'null', 'on'),
(8, 18710, 'Paras', 'null', 'on', 'null', 'on'),
(9, 18711, 'Ajeet', 'null', 'on', 'null', 'on'),
(10, 19772, 'Tanya', 'null', 'on', 'null', 'on'),
(11, 19773, 'Mohit', 'on', 'on', 'on', 'on'),
(12, 19774, 'Rohit Bhardwaj', 'on', 'on', 'null', 'on'),
(13, 19775, 'Mahesh', 'null', 'on', 'null', 'on'),
(14, 19776, 'Nitu', 'on', 'on', 'null', 'on'),
(15, 19777, 'Vaibhav', 'on', 'null', 'null', 'on'),
(16, 19778, 'Kiran', 'on', 'null', 'on', 'on'),
(17, 19779, 'Shristy', 'on', 'null', 'null', 'on'),
(18, 19780, 'Pooja', 'on', 'on', 'null', 'on'),
(19, 19781, 'Richa', 'on', 'on', 'null', 'on'),
(20, 19782, 'Nancy', 'on', 'on', 'on', 'on'),
(21, 19784, 'Nitish', 'on', 'on', 'null', 'on'),
(22, 19785, 'Umang', 'on', 'on', 'on', 'on'),
(23, 19786, 'Sakshi', 'null', 'on', 'null', 'on'),
(24, 19789, 'Rakhi', 'null', 'on', 'on', 'on'),
(25, 19790, 'Karan', 'null', 'on', 'null', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `sec_id` int(11) NOT NULL,
  `sec_name` varchar(20) DEFAULT '0',
  `s_id` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`sec_id`, `sec_name`, `s_id`, `c_id`) VALUES
(1, 'A', 7, 2),
(2, 'B', 7, 2),
(3, 'A', 8, 2),
(4, 'B', 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `s_id` int(11) NOT NULL,
  `sem` varchar(10) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  `c_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`s_id`, `sem`, `c_id`, `c_name`) VALUES
(1, 'I', 1, 'MCA'),
(2, 'II', 1, 'MCA'),
(3, 'III', 1, 'MCA'),
(4, 'IV', 1, 'MCA'),
(5, 'V', 1, 'MCA'),
(6, 'VI', 1, 'MCA'),
(7, 'I', 2, 'BCA'),
(8, 'II', 2, 'BCA'),
(9, 'III', 2, 'BCA'),
(10, 'IV', 2, 'BCA'),
(11, 'V', 2, 'BCA'),
(12, 'VI', 2, 'BCA'),
(13, 'I', 3, 'MBA'),
(14, 'II', 3, 'MBA'),
(15, 'III', 3, 'MBA'),
(16, 'IV', 3, 'MBA'),
(17, 'I', 4, 'BBA'),
(18, 'II', 4, 'BBA'),
(19, 'III', 4, 'BBA'),
(20, 'IV', 4, 'BBA'),
(21, 'V', 4, 'BBA'),
(22, 'VI', 4, 'BBA'),
(23, 'I', 5, 'BVoc'),
(24, 'II', 5, 'BVoc'),
(25, 'III', 5, 'BVoc'),
(26, 'IV', 5, 'BVoc'),
(27, 'V', 5, 'BVoc'),
(28, 'VI', 5, 'BVoc'),
(29, 'I', 6, 'Btech-CSE'),
(30, 'II', 6, 'Btech-CSE'),
(31, 'III', 6, 'Btech-CSE'),
(32, 'IV', 6, 'Btech-CSE'),
(33, 'V', 6, 'Btech-CSE'),
(34, 'VI', 6, 'Btech-CSE'),
(35, 'VII', 6, 'Btech-CSE'),
(36, 'VIII', 6, 'Btech-CSE'),
(37, 'I', 7, 'Btech-IT'),
(38, 'II', 7, 'Btech-IT'),
(39, 'III', 7, 'Btech-IT'),
(40, 'IV', 7, 'Btech-IT'),
(41, 'V', 7, 'Btech-IT'),
(42, 'VI', 7, 'Btech-IT'),
(43, 'VII', 7, 'Btech-IT'),
(44, 'VIII', 7, 'Btech-IT'),
(45, 'I', 8, 'Btech-Mechanical'),
(46, 'II', 8, 'Btech-Mechanical'),
(47, 'III', 8, 'Btech-Mechanical'),
(48, 'IV', 8, 'Btech-Mechanical'),
(49, 'V', 8, 'Btech-Mechanical'),
(50, 'VI', 8, 'Btech-Mechanical'),
(51, 'VII', 8, 'Btech-Mechanical'),
(52, 'VIII', 8, 'Btech-Mechanical'),
(53, 'I', 9, 'Btech-ECE'),
(54, 'II', 9, 'Btech-ECE'),
(55, 'III', 9, 'Btech-ECE'),
(56, 'IV', 9, 'Btech-ECE'),
(57, 'V', 9, 'Btech-ECE'),
(58, 'VI', 9, 'Btech-ECE'),
(59, 'VII', 9, 'Btech-ECE'),
(60, 'VIII', 9, 'Btech-ECE'),
(61, 'I', 10, 'Btech-Textile'),
(62, 'II', 10, 'Btech-Textile'),
(63, 'III', 10, 'Btech-Textile'),
(64, 'IV', 10, 'Btech-Textile'),
(65, 'V', 10, 'Btech-Textile'),
(66, 'VI', 10, 'Btech-Textile'),
(67, 'VII', 10, 'Btech-Textile'),
(68, 'VIII', 10, 'Btech-Textile'),
(69, 'I', 11, 'Btech-Civil'),
(70, 'II', 11, 'Btech-Civil'),
(71, 'III', 11, 'Btech-Civil'),
(72, 'IV', 11, 'Btech-Civil'),
(73, 'V', 11, 'Btech-Civil'),
(74, 'VI', 11, 'Btech-Civil'),
(75, 'VII', 11, 'Btech-Civil'),
(76, 'VIII', 11, 'Btech-Civil'),
(77, 'I', 12, 'Mtech-CSE'),
(78, 'II', 12, 'Mtech-CSE'),
(79, 'III', 12, 'Mtech-CSE'),
(80, 'IV', 12, 'Mtech-CSE');

-- --------------------------------------------------------

--
-- Table structure for table `upload_timetable`
--

CREATE TABLE `upload_timetable` (
  `id` int(10) NOT NULL,
  `table_name` varchar(100) DEFAULT NULL,
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ut_timetable`
--

CREATE TABLE `ut_timetable` (
  `id` int(10) NOT NULL,
  `start_at` time DEFAULT NULL,
  `end_at` time DEFAULT NULL,
  `t_id` varchar(20) DEFAULT NULL,
  `t_name` varchar(100) DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `semester` varchar(100) DEFAULT NULL,
  `section` varchar(100) DEFAULT NULL,
  `groupid` varchar(10) DEFAULT NULL,
  `subject_as` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `at_admin`
--
ALTER TABLE `at_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `at_attendence`
--
ALTER TABLE `at_attendence`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `at_course`
--
ALTER TABLE `at_course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `at_department`
--
ALTER TABLE `at_department`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `at_section`
--
ALTER TABLE `at_section`
  ADD PRIMARY KEY (`sec_id`);

--
-- Indexes for table `at_semester`
--
ALTER TABLE `at_semester`
  ADD PRIMARY KEY (`sem_id`);

--
-- Indexes for table `at_subject`
--
ALTER TABLE `at_subject`
  ADD PRIMARY KEY (`sub_id`);

--
-- Indexes for table `at_teacher`
--
ALTER TABLE `at_teacher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `t_username` (`t_username`);

--
-- Indexes for table `at_timetable`
--
ALTER TABLE `at_timetable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cap_bca_ii_a`
--
ALTER TABLE `cap_bca_ii_a`
  ADD PRIMARY KEY (`roll_no`);

--
-- Indexes for table `computerapplications_mca_iv`
--
ALTER TABLE `computerapplications_mca_iv`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roll_no` (`roll_no`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mca455_bca_iv_a_g1_advcpplab`
--
ALTER TABLE `mca455_bca_iv_a_g1_advcpplab`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mca455_mca_iv_a_javalab`
--
ALTER TABLE `mca455_mca_iv_a_javalab`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nisha_computerapplications_mca_iv_a_computer_graphics`
--
ALTER TABLE `nisha_computerapplications_mca_iv_a_computer_graphics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `satyawan_computerapplications_mca_iv_a_java`
--
ALTER TABLE `satyawan_computerapplications_mca_iv_a_java`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`sec_id`),
  ADD KEY `s_id` (`s_id`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`s_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `upload_timetable`
--
ALTER TABLE `upload_timetable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ut_timetable`
--
ALTER TABLE `ut_timetable`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `at_admin`
--
ALTER TABLE `at_admin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `at_attendence`
--
ALTER TABLE `at_attendence`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `at_course`
--
ALTER TABLE `at_course`
  MODIFY `course_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `at_department`
--
ALTER TABLE `at_department`
  MODIFY `dept_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `at_section`
--
ALTER TABLE `at_section`
  MODIFY `sec_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `at_semester`
--
ALTER TABLE `at_semester`
  MODIFY `sem_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `at_subject`
--
ALTER TABLE `at_subject`
  MODIFY `sub_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `at_teacher`
--
ALTER TABLE `at_teacher`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `at_timetable`
--
ALTER TABLE `at_timetable`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT for table `computerapplications_mca_iv`
--
ALTER TABLE `computerapplications_mca_iv`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mca455_bca_iv_a_g1_advcpplab`
--
ALTER TABLE `mca455_bca_iv_a_g1_advcpplab`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mca455_mca_iv_a_javalab`
--
ALTER TABLE `mca455_mca_iv_a_javalab`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `nisha_computerapplications_mca_iv_a_computer_graphics`
--
ALTER TABLE `nisha_computerapplications_mca_iv_a_computer_graphics`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `satyawan_computerapplications_mca_iv_a_java`
--
ALTER TABLE `satyawan_computerapplications_mca_iv_a_java`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `sec_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `upload_timetable`
--
ALTER TABLE `upload_timetable`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ut_timetable`
--
ALTER TABLE `ut_timetable`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`id`);

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `semester` (`s_id`);

--
-- Constraints for table `semester`
--
ALTER TABLE `semester`
  ADD CONSTRAINT `semester_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `course` (`c_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
