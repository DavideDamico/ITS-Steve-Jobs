-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Ott 15, 2025 alle 14:40
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prof_privato`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryStudent` varchar(50) NOT NULL,
  `Price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `category`
--

INSERT INTO `category` (`CategoryID`, `CategoryStudent`, `Price`) VALUES
(1, 'Scuola Media', 15.00),
(2, 'Liceo Scientifico', 20.00),
(3, 'Liceo Classico', 20.00),
(4, 'Liceo Linguistico', 18.00),
(5, 'Istituto Tecnico', 18.00),
(6, 'Università - Materie Base', 25.00),
(7, 'Università - Materie Avanzate', 30.00),
(8, 'Preparazione Esami', 35.00);

-- --------------------------------------------------------

--
-- Struttura della tabella `lesson`
--

CREATE TABLE `lesson` (
  `LessonID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `SubjectID` int(11) NOT NULL,
  `PaymentID` int(11) DEFAULT NULL,
  `CategoryID` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `StartTime` time NOT NULL,
  `LessonType` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `lesson`
--

INSERT INTO `lesson` (`LessonID`, `StudentID`, `SubjectID`, `PaymentID`, `CategoryID`, `StartDate`, `StartTime`, `LessonType`) VALUES
(1, 47, 8, 25, 1, '2025-06-01', '16:00:00', 'A Domicilio'),
(2, 67, 8, 27, 7, '2025-10-01', '20:00:00', 'Individuale'),
(3, 57, 10, 40, 8, '2025-05-06', '14:30:00', 'A Domicilio'),
(4, 53, 9, NULL, 8, '2025-07-07', '16:30:00', 'A Domicilio'),
(5, 63, 8, 64, 2, '2025-05-05', '16:30:00', 'Online'),
(6, 45, 9, NULL, 5, '2025-11-07', '19:30:00', 'Gruppo'),
(7, 56, 8, 118, 8, '2025-07-10', '19:00:00', 'A Domicilio'),
(8, 46, 8, 63, 6, '2025-06-11', '17:30:00', 'Individuale'),
(9, 57, 14, 91, 1, '2025-11-02', '20:00:00', 'Individuale'),
(10, 25, 13, 1, 1, '2025-05-21', '16:30:00', 'Gruppo'),
(11, 41, 14, 85, 6, '2025-06-05', '17:00:00', 'Gruppo'),
(12, 1, 4, NULL, 4, '2025-08-12', '18:00:00', 'A Domicilio'),
(13, 60, 3, 11, 3, '2025-10-20', '17:30:00', 'Gruppo'),
(14, 18, 14, 41, 2, '2025-07-06', '20:00:00', 'Online'),
(15, 66, 6, 86, 4, '2025-09-14', '17:00:00', 'A Domicilio'),
(16, 21, 11, 30, 3, '2025-06-04', '18:30:00', 'Individuale'),
(17, 36, 3, NULL, 6, '2025-11-06', '20:00:00', 'A Domicilio'),
(18, 63, 6, 72, 1, '2025-10-24', '16:00:00', 'Online'),
(19, 32, 1, NULL, 2, '2025-09-17', '19:00:00', 'Gruppo'),
(20, 58, 8, NULL, 1, '2025-07-16', '14:00:00', 'Individuale'),
(21, 42, 9, 109, 1, '2025-11-01', '18:00:00', 'Gruppo'),
(22, 18, 7, 36, 4, '2025-09-20', '20:30:00', 'Online'),
(23, 17, 6, 95, 4, '2025-05-27', '17:30:00', 'A Domicilio'),
(24, 39, 15, NULL, 4, '2025-10-18', '17:00:00', 'Gruppo'),
(25, 24, 9, NULL, 1, '2025-07-29', '18:30:00', 'Online'),
(26, 55, 5, 81, 8, '2025-08-17', '14:30:00', 'Online'),
(27, 2, 11, 2, 6, '2025-10-24', '15:00:00', 'Gruppo'),
(28, 12, 8, 131, 2, '2025-09-30', '16:30:00', 'Individuale'),
(29, 10, 11, 108, 2, '2025-09-06', '20:00:00', 'Individuale'),
(30, 26, 4, 15, 4, '2025-10-04', '19:00:00', 'A Domicilio'),
(31, 37, 11, 98, 2, '2025-05-23', '14:30:00', 'Online'),
(32, 26, 5, 1, 6, '2025-08-09', '19:00:00', 'Online'),
(33, 1, 8, NULL, 7, '2025-07-16', '19:30:00', 'Individuale'),
(34, 68, 10, 19, 2, '2025-08-24', '17:30:00', 'Individuale'),
(35, 12, 10, 112, 6, '2025-09-26', '17:00:00', 'Online'),
(36, 79, 9, 1, 6, '2025-08-30', '14:00:00', 'A Domicilio'),
(37, 71, 5, 81, 6, '2025-08-29', '20:30:00', 'Individuale'),
(38, 7, 7, NULL, 5, '2025-08-17', '19:00:00', 'Individuale'),
(39, 12, 12, NULL, 4, '2025-11-07', '18:30:00', 'A Domicilio'),
(40, 50, 14, 129, 5, '2025-04-17', '14:00:00', 'Individuale'),
(41, 30, 13, 22, 3, '2025-05-14', '14:00:00', 'Gruppo'),
(42, 41, 2, 91, 4, '2025-09-27', '14:30:00', 'Online'),
(43, 70, 8, 68, 4, '2025-05-05', '17:00:00', 'Gruppo'),
(44, 75, 5, 114, 8, '2025-11-11', '15:30:00', 'Online'),
(45, 54, 9, 101, 2, '2025-11-06', '14:30:00', 'Individuale'),
(46, 66, 5, NULL, 3, '2025-06-18', '18:30:00', 'A Domicilio'),
(47, 12, 7, NULL, 5, '2025-09-26', '16:30:00', 'Individuale'),
(48, 50, 5, 83, 3, '2025-08-23', '16:00:00', 'Gruppo'),
(49, 47, 13, NULL, 2, '2025-05-25', '16:00:00', 'Gruppo'),
(50, 8, 8, 91, 6, '2025-07-29', '20:00:00', 'Individuale'),
(51, 11, 3, 125, 5, '2025-08-20', '18:00:00', 'Online'),
(52, 69, 8, 33, 3, '2025-06-10', '20:00:00', 'Online'),
(53, 3, 15, NULL, 3, '2025-05-04', '20:00:00', 'Individuale'),
(54, 66, 3, NULL, 6, '2025-05-07', '19:30:00', 'Individuale'),
(55, 49, 3, 76, 8, '2025-04-19', '16:30:00', 'A Domicilio'),
(56, 12, 11, 33, 7, '2025-06-19', '18:30:00', 'Online'),
(57, 8, 1, NULL, 5, '2025-07-27', '18:30:00', 'Online'),
(58, 54, 3, 112, 1, '2025-04-17', '20:00:00', 'Online'),
(59, 27, 4, 121, 5, '2025-08-30', '18:30:00', 'Online'),
(60, 53, 11, NULL, 2, '2025-05-09', '16:00:00', 'Gruppo'),
(61, 33, 11, 17, 3, '2025-10-22', '16:00:00', 'Individuale'),
(62, 34, 4, 80, 7, '2025-09-05', '19:00:00', 'Online'),
(63, 39, 9, 55, 8, '2025-07-12', '15:30:00', 'Online'),
(64, 65, 1, NULL, 7, '2025-06-02', '14:00:00', 'Individuale'),
(65, 33, 5, 103, 5, '2025-05-29', '14:30:00', 'A Domicilio'),
(66, 6, 9, 65, 3, '2025-06-07', '16:30:00', 'A Domicilio'),
(67, 25, 2, 13, 5, '2025-08-29', '17:00:00', 'Gruppo'),
(68, 77, 2, 147, 4, '2025-08-16', '20:00:00', 'A Domicilio'),
(69, 44, 2, 68, 6, '2025-05-14', '19:00:00', 'Gruppo'),
(70, 50, 13, 132, 7, '2025-11-04', '20:00:00', 'Individuale'),
(71, 76, 9, 15, 8, '2025-10-31', '19:00:00', 'A Domicilio'),
(72, 80, 6, NULL, 3, '2025-07-04', '20:00:00', 'A Domicilio'),
(73, 57, 12, 13, 2, '2025-10-23', '20:30:00', 'Gruppo'),
(74, 51, 14, 38, 3, '2025-10-01', '14:30:00', 'Online'),
(75, 38, 6, 122, 3, '2025-07-12', '14:00:00', 'Gruppo'),
(76, 45, 1, NULL, 3, '2025-10-19', '20:00:00', 'Online'),
(77, 63, 6, 36, 2, '2025-09-05', '20:00:00', 'Individuale'),
(78, 34, 11, NULL, 1, '2025-05-12', '17:30:00', 'Individuale'),
(79, 76, 10, 34, 2, '2025-11-09', '19:30:00', 'Online'),
(80, 39, 1, NULL, 4, '2025-05-04', '20:00:00', 'Online'),
(81, 1, 9, 116, 7, '2025-10-07', '15:00:00', 'Online'),
(82, 31, 10, 1, 7, '2025-10-09', '19:00:00', 'Gruppo'),
(83, 72, 10, 58, 1, '2025-10-02', '17:00:00', 'A Domicilio'),
(84, 9, 2, NULL, 7, '2025-05-21', '18:30:00', 'Online'),
(85, 57, 8, 56, 5, '2025-05-31', '17:30:00', 'A Domicilio'),
(86, 41, 9, NULL, 5, '2025-04-24', '15:30:00', 'Gruppo'),
(87, 25, 8, 126, 2, '2025-11-01', '15:30:00', 'Gruppo'),
(88, 54, 1, 51, 5, '2025-11-13', '14:00:00', 'Online'),
(89, 13, 5, 128, 7, '2025-05-28', '20:30:00', 'Gruppo'),
(90, 63, 14, 65, 1, '2025-08-09', '18:00:00', 'Individuale'),
(91, 23, 15, NULL, 2, '2025-05-06', '20:30:00', 'Individuale'),
(92, 16, 3, 1, 3, '2025-07-22', '20:30:00', 'Gruppo'),
(93, 1, 1, 36, 6, '2025-05-22', '18:00:00', 'A Domicilio'),
(94, 28, 10, 132, 1, '2025-06-26', '17:30:00', 'Gruppo'),
(95, 19, 7, 40, 6, '2025-08-08', '17:30:00', 'Individuale'),
(96, 7, 1, 87, 2, '2025-06-20', '17:30:00', 'Gruppo'),
(97, 71, 10, 128, 7, '2025-04-30', '19:30:00', 'Individuale'),
(98, 9, 15, NULL, 4, '2025-07-17', '16:00:00', 'A Domicilio'),
(99, 36, 9, 93, 7, '2025-10-28', '14:30:00', 'Individuale'),
(100, 13, 8, NULL, 8, '2025-10-12', '15:00:00', 'Online'),
(101, 12, 13, NULL, 5, '2025-05-03', '15:30:00', 'Individuale'),
(102, 40, 5, 23, 8, '2025-07-03', '16:00:00', 'A Domicilio'),
(103, 60, 1, 71, 1, '2025-08-23', '14:30:00', 'A Domicilio'),
(104, 51, 4, NULL, 7, '2025-07-09', '20:30:00', 'Gruppo'),
(105, 36, 2, 129, 8, '2025-10-11', '14:00:00', 'Online'),
(106, 77, 2, 32, 5, '2025-08-01', '19:00:00', 'Individuale'),
(107, 9, 9, NULL, 8, '2025-06-27', '17:30:00', 'A Domicilio'),
(108, 51, 3, 10, 2, '2025-09-06', '20:30:00', 'Gruppo'),
(109, 47, 15, 60, 7, '2025-08-26', '17:00:00', 'A Domicilio'),
(110, 16, 12, 112, 7, '2025-08-20', '15:00:00', 'A Domicilio'),
(111, 74, 13, 145, 4, '2025-06-11', '20:30:00', 'Individuale'),
(112, 11, 1, NULL, 1, '2025-07-09', '17:30:00', 'Online'),
(113, 17, 6, 77, 5, '2025-09-03', '18:30:00', 'Gruppo'),
(114, 56, 12, 70, 8, '2025-05-24', '14:30:00', 'Gruppo'),
(115, 58, 4, NULL, 5, '2025-07-04', '15:00:00', 'Online'),
(116, 64, 1, 139, 6, '2025-10-31', '15:00:00', 'Online'),
(117, 15, 12, NULL, 3, '2025-04-20', '18:00:00', 'A Domicilio'),
(118, 25, 8, NULL, 8, '2025-04-28', '19:30:00', 'Online'),
(119, 10, 9, NULL, 5, '2025-04-25', '20:00:00', 'Individuale'),
(120, 43, 12, NULL, 4, '2025-06-28', '17:30:00', 'Gruppo'),
(121, 74, 4, 89, 6, '2025-06-21', '14:00:00', 'Online'),
(122, 47, 15, NULL, 5, '2025-09-01', '18:30:00', 'A Domicilio'),
(123, 50, 12, NULL, 6, '2025-06-23', '18:00:00', 'Individuale'),
(124, 59, 14, NULL, 6, '2025-09-17', '17:30:00', 'Gruppo'),
(125, 62, 2, 74, 3, '2025-06-14', '17:30:00', 'Gruppo'),
(126, 22, 12, 113, 7, '2025-05-29', '16:00:00', 'Gruppo'),
(127, 41, 12, 116, 6, '2025-10-27', '19:30:00', 'Individuale'),
(128, 51, 7, NULL, 3, '2025-07-11', '16:00:00', 'Gruppo'),
(129, 20, 14, 95, 4, '2025-09-25', '20:00:00', 'A Domicilio'),
(130, 2, 5, NULL, 2, '2025-06-19', '17:00:00', 'A Domicilio'),
(131, 14, 13, NULL, 1, '2025-05-16', '20:30:00', 'Individuale'),
(132, 79, 1, 21, 6, '2025-07-21', '18:30:00', 'A Domicilio'),
(133, 17, 11, 150, 3, '2025-09-23', '19:30:00', 'A Domicilio'),
(134, 73, 1, 49, 2, '2025-10-07', '19:00:00', 'A Domicilio'),
(135, 1, 3, NULL, 6, '2025-04-24', '18:30:00', 'Individuale'),
(136, 73, 2, 78, 6, '2025-04-17', '19:00:00', 'Online'),
(137, 3, 13, 14, 2, '2025-05-10', '16:30:00', 'A Domicilio'),
(138, 4, 12, NULL, 1, '2025-04-22', '19:30:00', 'Online'),
(139, 30, 14, 47, 5, '2025-06-30', '18:30:00', 'Online'),
(140, 43, 14, NULL, 5, '2025-06-02', '15:00:00', 'A Domicilio'),
(141, 66, 9, NULL, 6, '2025-05-07', '17:00:00', 'A Domicilio'),
(142, 41, 6, NULL, 3, '2025-10-12', '18:30:00', 'Online'),
(143, 20, 8, 2, 3, '2025-07-06', '18:00:00', 'A Domicilio'),
(144, 13, 7, 112, 2, '2025-05-29', '19:00:00', 'A Domicilio'),
(145, 37, 8, 17, 4, '2025-06-24', '14:30:00', 'Individuale'),
(146, 37, 8, 120, 2, '2025-05-03', '15:30:00', 'A Domicilio'),
(147, 58, 8, 117, 1, '2025-07-14', '15:30:00', 'Gruppo'),
(148, 32, 13, 7, 2, '2025-04-23', '16:00:00', 'Individuale'),
(149, 9, 4, NULL, 4, '2025-06-06', '19:00:00', 'A Domicilio'),
(150, 74, 13, 25, 2, '2025-10-31', '20:30:00', 'A Domicilio'),
(151, 53, 12, 74, 1, '2025-09-27', '18:00:00', 'Gruppo'),
(152, 58, 14, NULL, 3, '2025-09-20', '17:30:00', 'Gruppo'),
(153, 38, 5, NULL, 2, '2025-05-27', '16:00:00', 'Individuale'),
(154, 57, 11, NULL, 5, '2025-10-11', '14:30:00', 'Online'),
(155, 10, 13, NULL, 5, '2025-11-02', '19:30:00', 'Gruppo'),
(156, 27, 12, 136, 7, '2025-04-24', '18:00:00', 'A Domicilio'),
(157, 34, 6, 143, 4, '2025-08-16', '14:30:00', 'Individuale'),
(158, 39, 7, 130, 2, '2025-09-15', '18:00:00', 'Online'),
(159, 73, 3, 101, 3, '2025-10-21', '15:00:00', 'Individuale'),
(160, 60, 2, NULL, 2, '2025-05-05', '16:00:00', 'Individuale'),
(161, 61, 13, 49, 2, '2025-11-02', '15:00:00', 'A Domicilio'),
(162, 33, 13, 136, 6, '2025-05-29', '19:30:00', 'Online'),
(163, 11, 2, 45, 8, '2025-06-01', '17:00:00', 'A Domicilio'),
(164, 65, 14, 84, 7, '2025-08-25', '18:00:00', 'Individuale'),
(165, 65, 11, NULL, 1, '2025-08-21', '15:30:00', 'A Domicilio'),
(166, 7, 13, NULL, 7, '2025-09-22', '14:00:00', 'Gruppo'),
(167, 73, 2, 34, 4, '2025-09-04', '17:30:00', 'Gruppo'),
(168, 55, 6, 149, 3, '2025-04-25', '19:30:00', 'A Domicilio'),
(169, 28, 9, 137, 4, '2025-10-28', '17:30:00', 'Gruppo'),
(170, 28, 13, 32, 2, '2025-10-18', '14:00:00', 'Online'),
(171, 66, 12, 126, 6, '2025-10-14', '15:00:00', 'Gruppo'),
(172, 64, 3, NULL, 1, '2025-10-05', '18:00:00', 'Gruppo'),
(173, 55, 2, 143, 4, '2025-07-03', '18:00:00', 'Individuale'),
(174, 31, 3, 5, 7, '2025-11-08', '19:30:00', 'Individuale'),
(175, 75, 7, 96, 8, '2025-11-11', '18:30:00', 'Online'),
(176, 63, 12, 61, 6, '2025-05-10', '14:00:00', 'Individuale'),
(177, 7, 1, NULL, 8, '2025-09-25', '14:00:00', 'A Domicilio'),
(178, 71, 10, 15, 3, '2025-08-01', '18:30:00', 'Gruppo'),
(179, 2, 8, 62, 6, '2025-05-02', '14:30:00', 'A Domicilio'),
(180, 74, 13, 64, 5, '2025-08-20', '19:30:00', 'A Domicilio'),
(181, 66, 10, NULL, 7, '2025-07-05', '14:00:00', 'A Domicilio'),
(182, 25, 5, 75, 2, '2025-07-07', '17:30:00', 'Online'),
(183, 18, 2, 6, 6, '2025-09-14', '15:30:00', 'Online'),
(184, 75, 14, 14, 5, '2025-09-10', '14:30:00', 'Individuale'),
(185, 57, 1, 133, 6, '2025-07-10', '18:00:00', 'Gruppo'),
(186, 22, 15, 78, 6, '2025-06-17', '14:00:00', 'A Domicilio'),
(187, 4, 15, 40, 5, '2025-07-28', '16:30:00', 'Individuale'),
(188, 51, 5, 58, 8, '2025-07-18', '16:00:00', 'Individuale'),
(189, 68, 8, 82, 4, '2025-10-24', '16:00:00', 'Online'),
(190, 55, 9, 106, 4, '2025-08-03', '14:30:00', 'A Domicilio'),
(191, 23, 6, 19, 5, '2025-10-24', '19:00:00', 'A Domicilio'),
(192, 18, 1, NULL, 5, '2025-06-29', '16:30:00', 'A Domicilio'),
(193, 1, 8, 71, 5, '2025-11-04', '18:30:00', 'A Domicilio'),
(194, 13, 12, NULL, 5, '2025-10-22', '15:00:00', 'Individuale'),
(195, 78, 2, 85, 7, '2025-10-29', '15:00:00', 'Gruppo'),
(196, 23, 8, NULL, 7, '2025-05-03', '19:00:00', 'Online'),
(197, 21, 5, 26, 4, '2025-09-06', '14:30:00', 'Gruppo'),
(198, 16, 5, 138, 2, '2025-10-20', '17:30:00', 'Individuale'),
(199, 16, 13, 2, 8, '2025-08-13', '17:00:00', 'Individuale'),
(200, 21, 2, 105, 6, '2025-06-28', '19:00:00', 'A Domicilio');

-- --------------------------------------------------------

--
-- Struttura della tabella `payer`
--

CREATE TABLE `payer` (
  `PayerID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` varchar(50) DEFAULT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `Email` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `payer`
--

INSERT INTO `payer` (`PayerID`, `FirstName`, `LastName`, `Address`, `City`, `PhoneNumber`, `Email`) VALUES
(1, 'Gianluigi', 'Magrassi', 'Borgo Binaghi, 4 Piano 1', 'Vicenza', '35006067525', 'ilaria02@example.com'),
(2, 'Enzo', 'Turati', 'Via Marenzio, 26', 'Venezia', '+39 0942745143', 'ebusoni@example.org'),
(3, 'Aurora', 'Scarpetta', 'Strada Fanucci, 986 Piano 0', 'Rovigo', '+39 057320910', 'gianfranco03@example.org'),
(4, 'Giacomo', 'Gori', 'Vicolo Cafarchia, 878', 'Belluno', '+39 0942283977', 'fabiofinetti@example.com'),
(5, 'Giovanni', 'Carfagna', 'Piazza Imelda, 157 Appartamento 34', 'Belluno', '+39 0795836837', 'zaccagninirosalia@example.com'),
(6, 'Mirko', 'Frescobaldi', 'Vicolo Travaglia, 979', 'Treviso', '+39 371493536', 'fiorenzobrunello@example.org'),
(7, 'Sandra', 'Bellò', 'Strada Hugo, 40 Piano 1', 'Rovigo', '+39 08812727754', 'giulianopetrassi@example.org'),
(8, 'Bernardo', 'Capuana', 'Canale Garobbio, 798 Piano 8', 'Venezia', '+39 3701187807', 'rismondoadriano@example.net'),
(9, 'Gioacchino', 'Chechi', 'Borgo Orlando, 72', 'Verona', '058426738', 'gpalumbo@example.org'),
(10, 'Lilla', 'Boccioni', 'Strada Ansaldo, 935', 'Treviso', '+39 377427208', 'leonardo18@example.com'),
(11, 'Baldassare', 'Zanzi', 'Piazza Paola, 0', 'Vicenza', '33171959694', 'sobrerosole@example.net'),
(12, 'Loretta', 'Gianvecchio', 'Piazza Bianchini, 10 Appartamento 57', 'Treviso', '+39 0932928633', 'tacchinibarbara@example.com'),
(13, 'Cipriano', 'Sgalambro', 'Vicolo Chigi, 769 Appartamento 18', 'Venezia', '+39 07956434194', 'elisa02@example.org'),
(14, 'Nanni', 'Cociarelli', 'Vicolo Bernetti, 140 Appartamento 18', 'Padova', '09759123921', 'robertopisano@example.net'),
(15, 'Virgilio', 'Cortese', 'Contrada Monicelli, 5', 'Venezia', '05217410583', 'gianluigi56@example.net'),
(16, 'Mariano', 'Polizzi', 'Strada Maria, 27 Appartamento 35', 'Verona', '0545204461', 'rosaria07@example.com'),
(17, 'Antonina', 'Scarpetta', 'Strada Laura, 2 Piano 4', 'Belluno', '351091631', 'robertoprocacci@example.net'),
(18, 'Fiorino', 'Lucciano', 'Strada Cuzzocrea, 33 Appartamento 8', 'Belluno', '0342740740', 'bquasimodo@example.net'),
(19, 'Maria', 'Cainero', 'Incrocio Cutuli, 65 Appartamento 40', 'Padova', '+39 3509752501', 'armellinigiovanna@example.org'),
(20, 'Liliana', 'Verri', 'Via Donà, 972', 'Venezia', '08740618941', 'vboito@example.net'),
(21, 'Ivo', 'Mantegazza', 'Vicolo Aloisio, 3', 'Venezia', '373569137', 'pdetti@example.org'),
(22, 'Lidia', 'Tarchetti', 'Rotonda Renault, 43', 'Verona', '+39 36601609598', 'arsenio49@example.com'),
(23, 'Durante', 'Interminei', 'Canale Maderno, 94', 'Treviso', '370393172', 'manuelchinnici@example.com'),
(24, 'Franco', 'Campanella', 'Borgo Lucia, 78', 'Verona', '+39 3713808316', 'vittoriaperini@example.net'),
(25, 'Jacopo', 'Mondaini', 'Canale Interiano, 59 Piano 7', 'Venezia', '35050560369', 'annibaleflorio@example.com'),
(26, 'Marco', 'Gualtieri', 'Vicolo Nicolini, 7', 'Vicenza', '+39 375525055', 'chechirosalia@example.com'),
(27, 'Eliana', 'Ostinelli', 'Via Marzorati, 17 Piano 3', 'Verona', '094212856', 'gravinavirgilio@example.org'),
(28, 'Mirco', 'Montesano', 'Stretto Donatella, 37 Piano 6', 'Padova', '3856045261', 'bottaroflavio@example.com'),
(29, 'Beppe', 'Mortati', 'Piazza Cirillo, 9', 'Padova', '+39 0941838416', 'adele64@example.com'),
(30, 'Luca', 'Giacometti', 'Incrocio Lamborghini, 40', 'Padova', '+39 042997026', 'faustobaglioni@example.org'),
(31, 'Sante', 'Murri', 'Via Zola, 17 Piano 0', 'Rovigo', '382951491', 'gellinina@example.net'),
(32, 'Giampaolo', 'Accardo', 'Piazza Lucio, 42 Piano 7', 'Vicenza', '+39 073575412', 'roberto50@example.com'),
(33, 'Annalisa', 'Bodoni', 'Stretto Moneta, 31', 'Padova', '05653070054', 'lillalupo@example.com'),
(34, 'Benedetto', 'Telesio', 'Rotonda Venancio, 72', 'Vicenza', '+39 058339643', 'orazio46@example.com'),
(35, 'Panfilo', 'Gradenigo', 'Vicolo Vergassola, 42 Piano 8', 'Belluno', '+39 0471725409', 'zlamborghini@example.org'),
(36, 'Alessio', 'Giorgetti', 'Incrocio Morgagni, 1', 'Venezia', '+39 3334274527', 'interminellibenedetto@example.net'),
(37, 'Baccio', 'Farinelli', 'Incrocio Valeria, 17', 'Belluno', '+39 35155448553', 'filipparossellini@example.org'),
(38, 'Loretta', 'Barbarigo', 'Stretto Papetti, 87', 'Padova', '+39 096259488', 'omazzanti@example.com'),
(39, 'Fredo', 'Roth', 'Canale Filippa, 32 Appartamento 18', 'Belluno', '+39 35134114942', 'rosario29@example.org'),
(40, 'Salvatore', 'Rinaldi', 'Stretto Nedda, 88 Piano 5', 'Rovigo', '3624961240', 'serenaiadanza@example.org'),
(41, 'Sebastiano', 'Morricone', 'Borgo Brambilla, 46', 'Verona', '+39 0363781280', 'benitoverdi@example.net'),
(42, 'Lucrezia', 'Zamorani', 'Vicolo Sabatini, 5 Piano 0', 'Venezia', '+39 088127535', 'serafina69@example.net'),
(43, 'Eugenia', 'Ricciardi', 'Stretto Trillini, 65', 'Rovigo', '+39 0932733945', 'gberre@example.net'),
(44, 'Gioachino', 'Bonomo', 'Strada Giacomo, 3', 'Treviso', '+39 01632648645', 'chedaadele@example.org'),
(45, 'Ramona', 'Giannone', 'Contrada Zaira, 52 Appartamento 11', 'Belluno', '0932023914', 'giovannagarobbio@example.com'),
(46, 'Biagio', 'Foscari', 'Contrada Garobbio, 830 Piano 6', 'Padova', '+39 3858488254', 'jferrucci@example.net'),
(47, 'Berenice', 'Mascheroni', 'Contrada Antonio, 2 Piano 8', 'Vicenza', '+39 03436176617', 'ramonavalentino@example.com'),
(48, 'Ramona', 'Aloisio', 'Borgo Palombi, 2', 'Treviso', '0422759749', 'gianpaoloserao@example.com'),
(49, 'Mirko', 'Pepe', 'Incrocio Fiorenzo, 5 Appartamento 38', 'Padova', '+39 02456799446', 'alfiogadda@example.org'),
(50, 'Geronimo', 'Sollima', 'Strada Hugo, 912', 'Padova', '0773397780', 'corcosmilena@example.com'),
(51, 'Ronaldo', 'Petrucci', 'Strada Nanni, 180 Appartamento 87', 'Rovigo', '37363602346', 'osonnino@example.net'),
(52, 'Liliana', 'Barsanti', 'Strada Coluccio, 7 Appartamento 8', 'Vicenza', '+39 0549571343', 'giosue55@example.com'),
(53, 'Alderano', 'Nosiglia', 'Incrocio Volta, 885', 'Verona', '379128442', 'flavio96@example.com'),
(54, 'Ivan', 'Missoni', 'Rotonda Parmitano, 868', 'Belluno', '+39 0923239990', 'guglielmo42@example.org'),
(55, 'Iolanda', 'Gemito', 'Contrada Augusto, 728', 'Treviso', '+39 06598836388', 'margheritamontessori@example.com'),
(56, 'Umberto', 'Cuomo', 'Rotonda Fanucci, 3 Piano 6', 'Vicenza', '+39 35005246694', 'cmatteotti@example.net'),
(57, 'Renzo', 'Tagliafierro', 'Piazza Piergiuseppe, 86', 'Treviso', '07173662614', 'donaarmando@example.com'),
(58, 'Morena', 'Missoni', 'Borgo Stucchi, 44 Appartamento 5', 'Venezia', '0853789856', 'trottagiada@example.org'),
(59, 'Aria', 'Badoer', 'Via Raffaele, 8 Piano 3', 'Verona', '+39 3292890554', 'raffaellinojilani@example.net'),
(60, 'Armando', 'Viola', 'Viale Palazzo, 68 Appartamento 0', 'Belluno', '+39 37738721006', 'collinafulvio@example.org'),
(61, 'Patrizio', 'Bazzi', 'Via Ippazio, 674 Piano 2', 'Rovigo', '054330699', 'mgalvani@example.net'),
(62, 'Paloma', 'Bartoli', 'Canale Travaglia, 487 Piano 4', 'Rovigo', '+39 0732742207', 'marcello24@example.com'),
(63, 'Roberta', 'Micheletti', 'Piazza Raffaellino, 424 Appartamento 4', 'Padova', '0171669158', 'berenice14@example.net'),
(64, 'Lisa', 'Giammusso', 'Canale Giacomo, 82 Piano 4', 'Treviso', '32293942906', 'eugeniaserlupi@example.net'),
(65, 'Ermenegildo', 'Bixio', 'Incrocio Maria, 982 Piano 8', 'Venezia', '073315942', 'elladio24@example.com'),
(66, 'Gian', 'Sansoni', 'Viale Tornatore, 90 Appartamento 39', 'Padova', '+39 0774998551', 'luca62@example.org'),
(67, 'Tullio', 'Caironi', 'Vicolo Alessandro, 7', 'Vicenza', '+39 05648389644', 'annibalestucchi@example.org'),
(68, 'Fiorino', 'Monicelli', 'Stretto Griselda, 21', 'Venezia', '0566964933', 'baccio66@example.net'),
(69, 'Gabriella', 'Binaghi', 'Strada Sandro, 17', 'Verona', '097422641', 'francescocalarco@example.org'),
(70, 'Lauretta', 'Ligorio', 'Rotonda Santino, 82 Piano 7', 'Venezia', '+39 092321905', 'qtacchini@example.com'),
(71, 'Lara', 'Renault', 'Borgo Mattia, 667 Appartamento 7', 'Venezia', '+39 07159295457', 'xtrombetta@example.org'),
(72, 'Camilla', 'Bajardi', 'Via Fabrizio, 42', 'Venezia', '09315782293', 'ttutino@example.org'),
(73, 'Olga', 'Bignardi', 'Strada Mirko, 23 Appartamento 47', 'Venezia', '+39 0555260361', 'torquatofarnese@example.org'),
(74, 'Pietro', 'Maffei', 'Strada Agostinelli, 98 Appartamento 56', 'Verona', '+39 088108743', 'sergius70@example.org'),
(75, 'Giacomo', 'Mogherini', 'Incrocio Gasperi, 76', 'Venezia', '+39 0341540705', 'imelda94@example.com'),
(76, 'Gioacchino', 'Chinnici', 'Canale Saverio, 19 Piano 4', 'Treviso', '07215205636', 'xoscuro@example.org'),
(77, 'Salvi', 'Iannuzzi', 'Via Schiavone, 425', 'Padova', '04310356480', 'venanciorenzi@example.com'),
(78, 'Lauretta', 'Palombi', 'Rotonda Toso, 1', 'Treviso', '+39 0123197865', 'modiglianiserafina@example.com'),
(79, 'Bruno', 'Nordio', 'Viale Fernanda, 429 Piano 5', 'Rovigo', '37109080190', 'giorgia00@example.com'),
(80, 'Bianca', 'Morricone', 'Via Donna, 383', 'Padova', '+39 3776558145', 'palazzomartina@example.com'),
(81, 'Tiziana', 'Staglieno', 'Rotonda Conti, 735 Appartamento 6', 'Venezia', '+39 057448040', 'gastone62@example.org'),
(82, 'Mariano', 'Baggio', 'Viale Dovara, 6 Piano 2', 'Padova', '+39 0421613280', 'ennio75@example.net'),
(83, 'Antonello', 'Lerner', 'Canale Paoletta, 4 Piano 9', 'Rovigo', '+39 016356619', 'pomettaveronica@example.org'),
(84, 'Angelica', 'Errigo', 'Stretto Brunelleschi, 36 Piano 1', 'Vicenza', '+39 3518393574', 'tandreotti@example.net'),
(85, 'Monica', 'Zecchini', 'Stretto Gemito, 21 Appartamento 7', 'Venezia', '3518724839', 'fabrizia86@example.net'),
(86, 'Allegra', 'Odescalchi', 'Canale Caironi, 2', 'Belluno', '032457956', 'sdisdero@example.org'),
(87, 'Toni', 'Carducci', 'Vicolo Rosmini, 23 Appartamento 66', 'Treviso', '+39 018758969', 'jolanda37@example.org'),
(88, 'Dario', 'Raurica', 'Contrada Lucia, 29 Piano 3', 'Belluno', '+39 351856145', 'civaschimarcantonio@example.com'),
(89, 'Baldassare', 'Ludovisi', 'Rotonda Giampaolo, 38 Piano 6', 'Belluno', '+39 082520847', 'jcomboni@example.com'),
(90, 'Sandro', 'Savorgnan', 'Rotonda Pisacane, 3 Appartamento 7', 'Padova', '0501922008', 'ballasantino@example.net'),
(91, 'Coriolano', 'Molesini', 'Stretto Roccabonella, 36', 'Verona', '33413365396', 'gelsominaruggeri@example.net'),
(92, 'Mario', 'Onio', 'Stretto Bandello, 27 Piano 0', 'Treviso', '05497311547', 'poffredi@example.org'),
(93, 'Fabio', 'Malaparte', 'Canale Luria, 520', 'Belluno', '034542912', 'spinellimatilda@example.org'),
(94, 'Marcella', 'Roncalli', 'Canale Galuppi, 7 Piano 7', 'Vicenza', '048103235', 'broschimercedes@example.net'),
(95, 'Fabio', 'Accardo', 'Contrada Antonia, 243', 'Padova', '3793913172', 'qaporti@example.net'),
(96, 'Micheletto', 'Trobbiani', 'Piazza Giradello, 72 Piano 7', 'Belluno', '3779218259', 'ozichichi@example.com'),
(97, 'Fedele', 'Tresoldi', 'Piazza Raurica, 713 Appartamento 61', 'Belluno', '+39 35206669440', 'calogeromaspero@example.com'),
(98, 'Nico', 'Goldstein', 'Rotonda Martina, 781 Appartamento 20', 'Vicenza', '+39 3299374946', 'coardiramona@example.net'),
(99, 'Enzio', 'Natta', 'Viale Lina, 48', 'Vicenza', '3517295331', 'vlovato@example.org'),
(100, 'Ivo', 'Durante', 'Canale Colletti, 12', 'Venezia', '0165529207', 'mnicoletti@example.net');

-- --------------------------------------------------------

--
-- Struttura della tabella `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `PayerID` int(11) NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `PaymentMethod` varchar(30) NOT NULL,
  `PaymentDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `payment`
--

INSERT INTO `payment` (`PaymentID`, `PayerID`, `Amount`, `PaymentMethod`, `PaymentDate`) VALUES
(1, 24, 139.06, 'Contanti', '2025-06-16'),
(2, 51, 59.61, 'Bonifico', '2025-07-19'),
(3, 67, 92.17, 'Bonifico', '2025-05-30'),
(4, 54, 84.28, 'PayPal', '2025-07-29'),
(5, 59, 24.14, 'Bonifico', '2025-05-15'),
(6, 26, 98.88, 'Bonifico', '2025-09-22'),
(7, 43, 135.68, 'Satispay', '2025-08-28'),
(8, 66, 31.92, 'Contanti', '2025-06-28'),
(9, 6, 119.92, 'PayPal', '2025-06-20'),
(10, 14, 87.35, 'Contanti', '2025-08-25'),
(11, 91, 65.11, 'Contanti', '2025-05-24'),
(12, 88, 115.74, 'PayPal', '2025-06-24'),
(13, 79, 56.48, 'PayPal', '2025-07-26'),
(14, 62, 114.52, 'Contanti', '2025-07-03'),
(15, 29, 75.15, 'PayPal', '2025-06-21'),
(16, 87, 139.33, 'Contanti', '2025-05-19'),
(17, 25, 29.99, 'Carta di Credito', '2025-04-22'),
(18, 45, 39.55, 'Bonifico', '2025-08-18'),
(19, 50, 112.93, 'Contanti', '2025-06-30'),
(20, 6, 55.61, 'Carta di Credito', '2025-09-19'),
(21, 19, 36.67, 'PayPal', '2025-06-02'),
(22, 26, 59.93, 'Contanti', '2025-06-13'),
(23, 66, 30.34, 'Contanti', '2025-05-23'),
(24, 6, 67.94, 'Bonifico', '2025-07-11'),
(25, 75, 80.43, 'Bonifico', '2025-05-10'),
(26, 46, 91.93, 'Bonifico', '2025-06-20'),
(27, 12, 20.13, 'Contanti', '2025-06-26'),
(28, 65, 42.99, 'Carta di Credito', '2025-08-28'),
(29, 67, 17.05, 'Bonifico', '2025-08-27'),
(30, 76, 86.77, 'Bonifico', '2025-09-12'),
(31, 4, 70.97, 'PayPal', '2025-08-10'),
(32, 50, 18.69, 'PayPal', '2025-10-01'),
(33, 85, 125.20, 'Satispay', '2025-10-04'),
(34, 57, 58.10, 'Contanti', '2025-04-19'),
(35, 39, 57.28, 'Bonifico', '2025-07-05'),
(36, 8, 91.32, 'Satispay', '2025-07-21'),
(37, 16, 80.63, 'Contanti', '2025-05-13'),
(38, 7, 38.51, 'PayPal', '2025-09-19'),
(39, 59, 85.89, 'Carta di Credito', '2025-06-09'),
(40, 29, 22.95, 'Bonifico', '2025-08-13'),
(41, 21, 115.59, 'Carta di Credito', '2025-07-08'),
(42, 88, 88.34, 'Carta di Credito', '2025-09-12'),
(43, 71, 136.51, 'Satispay', '2025-05-31'),
(44, 21, 101.38, 'Carta di Credito', '2025-09-03'),
(45, 10, 102.83, 'Contanti', '2025-04-18'),
(46, 13, 124.06, 'PayPal', '2025-09-05'),
(47, 36, 46.82, 'Bonifico', '2025-09-07'),
(48, 89, 64.97, 'Carta di Credito', '2025-08-20'),
(49, 32, 69.48, 'Carta di Credito', '2025-10-01'),
(50, 4, 29.64, 'Satispay', '2025-08-22'),
(51, 48, 137.89, 'Bonifico', '2025-08-31'),
(52, 11, 81.58, 'Carta di Credito', '2025-07-26'),
(53, 32, 29.99, 'Carta di Credito', '2025-08-12'),
(54, 16, 72.33, 'Bonifico', '2025-07-01'),
(55, 50, 113.37, 'PayPal', '2025-06-09'),
(56, 100, 133.91, 'Bonifico', '2025-09-08'),
(57, 94, 15.76, 'PayPal', '2025-09-23'),
(58, 62, 123.86, 'PayPal', '2025-04-21'),
(59, 81, 100.21, 'PayPal', '2025-10-09'),
(60, 47, 113.16, 'Bonifico', '2025-04-22'),
(61, 30, 148.11, 'Contanti', '2025-09-05'),
(62, 72, 48.92, 'Contanti', '2025-06-06'),
(63, 75, 35.43, 'Bonifico', '2025-04-19'),
(64, 79, 43.78, 'Satispay', '2025-07-08'),
(65, 4, 83.88, 'Bonifico', '2025-07-02'),
(66, 88, 68.10, 'Satispay', '2025-08-02'),
(67, 82, 121.78, 'Carta di Credito', '2025-07-26'),
(68, 36, 90.93, 'Satispay', '2025-09-08'),
(69, 85, 87.52, 'Carta di Credito', '2025-06-26'),
(70, 84, 80.14, 'Bonifico', '2025-10-11'),
(71, 13, 21.41, 'Contanti', '2025-08-01'),
(72, 53, 104.57, 'Carta di Credito', '2025-06-22'),
(73, 50, 27.51, 'Contanti', '2025-08-15'),
(74, 80, 46.03, 'Contanti', '2025-08-03'),
(75, 2, 36.00, 'PayPal', '2025-08-10'),
(76, 35, 128.61, 'Bonifico', '2025-05-25'),
(77, 42, 36.65, 'Satispay', '2025-07-23'),
(78, 46, 73.04, 'Bonifico', '2025-07-04'),
(79, 59, 96.07, 'Contanti', '2025-10-08'),
(80, 64, 105.63, 'Bonifico', '2025-07-12'),
(81, 48, 118.60, 'Satispay', '2025-09-17'),
(82, 17, 122.52, 'Carta di Credito', '2025-06-30'),
(83, 60, 108.41, 'PayPal', '2025-08-08'),
(84, 61, 70.28, 'Bonifico', '2025-06-13'),
(85, 63, 83.61, 'PayPal', '2025-09-19'),
(86, 54, 45.86, 'PayPal', '2025-09-14'),
(87, 69, 35.24, 'Contanti', '2025-05-09'),
(88, 97, 148.02, 'Contanti', '2025-10-13'),
(89, 9, 31.90, 'Bonifico', '2025-07-23'),
(90, 13, 44.03, 'PayPal', '2025-09-30'),
(91, 84, 94.33, 'Satispay', '2025-06-20'),
(92, 79, 52.38, 'Satispay', '2025-09-19'),
(93, 51, 61.81, 'Contanti', '2025-07-03'),
(94, 57, 31.34, 'Carta di Credito', '2025-09-10'),
(95, 33, 57.60, 'Contanti', '2025-09-26'),
(96, 87, 107.47, 'Contanti', '2025-05-28'),
(97, 68, 32.37, 'Bonifico', '2025-08-21'),
(98, 33, 51.19, 'PayPal', '2025-10-11'),
(99, 90, 25.75, 'Bonifico', '2025-04-27'),
(100, 6, 111.08, 'Bonifico', '2025-06-13'),
(101, 49, 19.83, 'Carta di Credito', '2025-04-20'),
(102, 23, 71.81, 'Bonifico', '2025-09-10'),
(103, 19, 83.85, 'Carta di Credito', '2025-10-04'),
(104, 10, 63.12, 'Bonifico', '2025-05-11'),
(105, 46, 24.70, 'Bonifico', '2025-04-20'),
(106, 28, 61.18, 'PayPal', '2025-07-16'),
(107, 52, 88.10, 'Contanti', '2025-06-04'),
(108, 61, 36.94, 'Satispay', '2025-07-08'),
(109, 17, 90.27, 'Carta di Credito', '2025-05-28'),
(110, 33, 74.99, 'Bonifico', '2025-04-21'),
(111, 95, 35.86, 'Satispay', '2025-10-07'),
(112, 33, 141.48, 'PayPal', '2025-06-18'),
(113, 73, 15.31, 'PayPal', '2025-10-11'),
(114, 26, 69.15, 'Carta di Credito', '2025-10-14'),
(115, 14, 136.52, 'Satispay', '2025-05-10'),
(116, 65, 77.63, 'Bonifico', '2025-05-28'),
(117, 76, 104.41, 'Contanti', '2025-05-04'),
(118, 98, 70.65, 'Contanti', '2025-05-12'),
(119, 52, 100.92, 'PayPal', '2025-08-07'),
(120, 67, 32.87, 'Bonifico', '2025-06-27'),
(121, 55, 101.01, 'Bonifico', '2025-05-30'),
(122, 16, 47.93, 'PayPal', '2025-06-25'),
(123, 95, 68.47, 'Satispay', '2025-10-01'),
(124, 50, 43.82, 'PayPal', '2025-06-21'),
(125, 92, 54.38, 'Satispay', '2025-04-16'),
(126, 63, 75.87, 'Contanti', '2025-08-03'),
(127, 76, 79.06, 'Contanti', '2025-08-14'),
(128, 25, 38.58, 'Bonifico', '2025-07-13'),
(129, 75, 136.94, 'Satispay', '2025-05-04'),
(130, 23, 38.95, 'Contanti', '2025-06-07'),
(131, 97, 32.41, 'Contanti', '2025-05-11'),
(132, 69, 31.47, 'PayPal', '2025-06-20'),
(133, 75, 80.01, 'Bonifico', '2025-04-18'),
(134, 4, 100.84, 'Contanti', '2025-07-10'),
(135, 40, 70.61, 'Carta di Credito', '2025-09-27'),
(136, 20, 24.92, 'Carta di Credito', '2025-05-02'),
(137, 95, 146.57, 'Bonifico', '2025-07-07'),
(138, 49, 126.99, 'Bonifico', '2025-09-24'),
(139, 56, 130.48, 'PayPal', '2025-07-29'),
(140, 50, 141.19, 'Contanti', '2025-10-12'),
(141, 90, 61.42, 'Carta di Credito', '2025-08-11'),
(142, 35, 31.17, 'Contanti', '2025-07-18'),
(143, 14, 42.33, 'Carta di Credito', '2025-08-27'),
(144, 72, 58.66, 'Carta di Credito', '2025-09-29'),
(145, 96, 39.61, 'PayPal', '2025-09-28'),
(146, 16, 18.32, 'Bonifico', '2025-08-02'),
(147, 14, 46.53, 'Bonifico', '2025-07-21'),
(148, 25, 103.71, 'Satispay', '2025-07-28'),
(149, 43, 71.81, 'Satispay', '2025-08-07'),
(150, 53, 71.72, 'Contanti', '2025-07-23');

-- --------------------------------------------------------

--
-- Struttura della tabella `student`
--

CREATE TABLE `student` (
  `StudentID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` varchar(50) DEFAULT NULL,
  `PhoneNumber` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `student`
--

INSERT INTO `student` (`StudentID`, `FirstName`, `LastName`, `Address`, `City`, `PhoneNumber`) VALUES
(1, 'Piermaria', 'Alonzi', 'Borgo Jovinelli, 252 Appartamento 9', 'Vicenza', '345186982'),
(2, 'Liana', 'Bosio', 'Rotonda Ariosto, 15', 'Rovigo', '+39 3713292411'),
(3, 'Loredana', 'Panicucci', 'Piazza Giannetti, 7', 'Padova', '0961682020'),
(4, 'Gianmarco', 'Nibali', 'Incrocio Luigi, 20 Piano 2', 'Belluno', '+39 324538179'),
(5, 'Elena', 'Stucchi', 'Stretto Finetti, 1 Piano 2', 'Belluno', '045322428'),
(6, 'Enrico', 'Adinolfi', 'Vicolo Nedda, 274 Appartamento 3', 'Belluno', '+39 0595262298'),
(7, 'Greca', 'Procacci', 'Strada Evangelista, 3 Appartamento 35', 'Verona', '+39 052160588'),
(8, 'Ermanno', 'Pagnotto', 'Viale Pacillo, 584', 'Belluno', '016647035'),
(9, 'Giorgia', 'Brambilla', 'Vicolo Sylvia, 366', 'Verona', '+39 3510456195'),
(10, 'Piero', 'Faugno', 'Via Paulina, 73', 'Venezia', '+39 0372180560'),
(11, 'Ciro', 'Spadafora', 'Contrada Antonia, 12', 'Verona', '+39 0893886809'),
(12, 'Mariana', 'Dallapé', 'Viale Armellini, 60 Piano 7', 'Treviso', '0165556429'),
(13, 'Antonia', 'Capecchi', 'Strada Diana, 40 Appartamento 87', 'Vicenza', '+39 0761335262'),
(14, 'Vittoria', 'Folliero', 'Canale Lisa, 0', 'Venezia', '+39 0923114933'),
(15, 'Stefano', 'Paganini', 'Stretto Gravina, 8 Piano 3', 'Verona', '08516715349'),
(16, 'Delfino', 'Donini', 'Contrada Durante, 168', 'Padova', '+39 3804065383'),
(17, 'Nadia', 'Fischetti', 'Piazza Enzo, 5 Piano 8', 'Belluno', '01413669698'),
(18, 'Ignazio', 'Valmarana', 'Viale Cugia, 0', 'Vicenza', '3345667163'),
(19, 'Donatella', 'Aldobrandi', 'Canale Alberto, 332 Piano 5', 'Verona', '0771053976'),
(20, 'Stefano', 'Ciani', 'Stretto Cherubini, 67 Appartamento 46', 'Treviso', '083249365'),
(21, 'Flavio', 'Udinese', 'Incrocio Dino, 1', 'Rovigo', '+39 03245493895'),
(22, 'Luchino', 'Pergolesi', 'Vicolo Raimondo, 25', 'Venezia', '+39 3604082283'),
(23, 'Serena', 'Gualtieri', 'Strada Iolanda, 3 Appartamento 0', 'Treviso', '0761960221'),
(24, 'Michele', 'Borromeo', 'Strada Ornella, 62', 'Treviso', '0425856157'),
(25, 'Amanda', 'Donarelli', 'Piazza Ruggieri, 4', 'Venezia', '3711440896'),
(26, 'Nicola', 'Callegaro', 'Viale Ninetta, 1', 'Verona', '0372071642'),
(27, 'Olga', 'Duse', 'Via Ligorio, 741', 'Rovigo', '07214049661'),
(28, 'Salvatore', 'Sgarbi', 'Rotonda Federico, 3', 'Rovigo', '+39 0362201201'),
(29, 'Renata', 'Tuzzolino', 'Viale Concetta, 5 Appartamento 6', 'Padova', '0775116277'),
(30, 'Emma', 'Trevisan', 'Incrocio Silvia, 416 Piano 5', 'Treviso', '+39 377475194'),
(31, 'Alfredo', 'Campanella', 'Stretto Tagliafierro, 73 Appartamento 1', 'Rovigo', '04513603969'),
(32, 'Ottavio', 'Pugliese', 'Piazza Falloppio, 115 Piano 8', 'Vicenza', '+39 392876201'),
(33, 'Raimondo', 'Zito', 'Rotonda Sole, 755 Piano 6', 'Treviso', '+39 04137798147'),
(34, 'Mattia', 'Villadicani', 'Via Morgagni, 781 Appartamento 6', 'Treviso', '+39 397575668'),
(35, 'Lara', 'Niscoromni', 'Canale Gioachino, 12 Appartamento 94', 'Venezia', '+39 0426555630'),
(36, 'Gianpaolo', 'Germano', 'Via Barzini, 92', 'Venezia', '098435012'),
(37, 'Matilda', 'Casellati', 'Vicolo Montanelli, 243 Piano 3', 'Venezia', '+39 03752851123'),
(38, 'Tonino', 'Zito', 'Contrada Gustavo, 95 Appartamento 5', 'Rovigo', '+39 0185923547'),
(39, 'Amleto', 'Trapani', 'Rotonda Gian, 5', 'Padova', '+39 3513422695'),
(40, 'Ezio', 'Pucci', 'Rotonda Gianluca, 56 Piano 1', 'Venezia', '+39 07362898040'),
(41, 'Giuliana', 'Mazzi', 'Viale Canova, 5 Appartamento 5', 'Belluno', '+39 0422468176'),
(42, 'Tiziana', 'Capecchi', 'Canale Corrado, 10 Appartamento 3', 'Verona', '+39 3316256415'),
(43, 'Rolando', 'Callegari', 'Borgo Guido, 60 Piano 6', 'Verona', '0123811894'),
(44, 'Rosa', 'Camicione', 'Strada Musatti, 91 Piano 0', 'Padova', '+39 0735815844'),
(45, 'Sebastiano', 'Fagiani', 'Contrada Faggiani, 71', 'Vicenza', '+39 071864101'),
(46, 'Gianpaolo', 'Coppola', 'Borgo Fabia, 25', 'Verona', '+39 32765173431'),
(47, 'Gaspare', 'Rapisardi', 'Viale Gottardi, 795 Appartamento 20', 'Padova', '3914842864'),
(48, 'Osvaldo', 'Guicciardini', 'Piazza Tonisto, 336 Appartamento 22', 'Treviso', '0423369259'),
(49, 'Micheletto', 'Borromini', 'Canale Spadafora, 442', 'Rovigo', '391287215'),
(50, 'Ferdinando', 'Zecchini', 'Strada Lucia, 25', 'Rovigo', '+39 36646274742'),
(51, 'Dionigi', 'Brichese', 'Rotonda Pirelli, 50 Piano 0', 'Vicenza', '+39 07366620087'),
(52, 'Rosa', 'Serao', 'Stretto Natalia, 929', 'Padova', '33415918212'),
(53, 'Matteo', 'Civaschi', 'Contrada Giustino, 66', 'Padova', '+39 3413487253'),
(54, 'Pomponio', 'Bazzi', 'Via Eliana, 526', 'Rovigo', '0732332407'),
(55, 'Emma', 'Redi', 'Borgo Baldassare, 7', 'Belluno', '0166199131'),
(56, 'Flavia', 'Iacobucci', 'Rotonda Gabriella, 3 Piano 6', 'Venezia', '+39 37130909805'),
(57, 'Tiziana', 'Mazzeo', 'Viale Susanna, 26', 'Belluno', '0438512625'),
(58, 'Rosalia', 'Naccari', 'Contrada Orlando, 1 Piano 5', 'Treviso', '+39 0371348625'),
(59, 'Milena', 'Vercelloni', 'Strada Isabella, 54', 'Venezia', '+39 39392991981'),
(60, 'Agostino', 'Marconi', 'Borgo Gabriella, 133', 'Verona', '+39 058890396'),
(61, 'Gelsomina', 'Giannelli', 'Incrocio Elvira, 6', 'Padova', '+39 018569452'),
(62, 'Nedda', 'Rossini', 'Viale Oscuro, 930 Piano 3', 'Rovigo', '3512737122'),
(63, 'Rossana', 'Fibonacci', 'Contrada Antonino, 55 Piano 1', 'Vicenza', '3826863787'),
(64, 'Annetta', 'Battaglia', 'Rotonda Federigo, 35', 'Padova', '+39 3811227825'),
(65, 'Elladio', 'Agazzi', 'Stretto Galtarossa, 34', 'Rovigo', '+39 0783599274'),
(66, 'Enrico', 'Pizziol', 'Contrada Bombieri, 18 Appartamento 61', 'Treviso', '+39 0184137897'),
(67, 'Mirko', 'Trobbiani', 'Contrada Gaspare, 57', 'Venezia', '0163491417'),
(68, 'Venancio', 'Fornaciari', 'Contrada Calogero, 193 Appartamento 84', 'Rovigo', '0123781040'),
(69, 'Ciro', 'Roth', 'Borgo Petralli, 496 Piano 1', 'Vicenza', '0205621918'),
(70, 'Lara', 'Carullo', 'Strada Verdone, 86 Piano 2', 'Venezia', '+39 32494381361'),
(71, 'Stefano', 'Tamburi', 'Strada Ravaglioli, 40', 'Treviso', '3701157109'),
(72, 'Luchino', 'Marinetti', 'Canale Cendron, 34', 'Treviso', '+39 0922467158'),
(73, 'Ricciotti', 'Giulietti', 'Strada Antonina, 140 Appartamento 4', 'Rovigo', '+39 3858289810'),
(74, 'Francesco', 'Tagliafierro', 'Contrada Bassi, 11 Piano 6', 'Belluno', '3663759897'),
(75, 'Francesco', 'Murialdo', 'Piazza Ginesio, 698', 'Verona', '375687465'),
(76, 'Clelia', 'Vianello', 'Viale Gucci, 83 Appartamento 46', 'Belluno', '+39 092172648'),
(77, 'Mariana', 'Camicione', 'Rotonda Mazzini, 730', 'Padova', '323134652'),
(78, 'Renzo', 'Guarana', 'Strada Spinelli, 228', 'Venezia', '+39 3897168199'),
(79, 'Patrizio', 'Scotti', 'Vicolo Dino, 55 Appartamento 1', 'Padova', '016102595'),
(80, 'Edoardo', 'Doria', 'Rotonda Lisa, 14 Appartamento 71', 'Belluno', '0141100744');

-- --------------------------------------------------------

--
-- Struttura della tabella `subject`
--

CREATE TABLE `subject` (
  `SubjectID` int(11) NOT NULL,
  `SubjectName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `subject`
--

INSERT INTO `subject` (`SubjectID`, `SubjectName`) VALUES
(4, 'Biologia'),
(3, 'Chimica'),
(15, 'Economia'),
(9, 'Filosofia'),
(2, 'Fisica'),
(11, 'Francese'),
(7, 'Greco'),
(14, 'Informatica'),
(10, 'Inglese'),
(5, 'Italiano'),
(6, 'Latino'),
(1, 'Matematica'),
(12, 'Spagnolo'),
(8, 'Storia'),
(13, 'Tedesco');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`),
  ADD UNIQUE KEY `ukCategoryStudent` (`CategoryStudent`),
  ADD KEY `idxCategory` (`CategoryID`);

--
-- Indici per le tabelle `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`LessonID`),
  ADD KEY `idxLesson` (`LessonID`),
  ADD KEY `idxLessonStudent` (`StudentID`),
  ADD KEY `idxLessonSubject` (`SubjectID`),
  ADD KEY `idxLessonPayment` (`PaymentID`),
  ADD KEY `idxLessonCategory` (`CategoryID`);

--
-- Indici per le tabelle `payer`
--
ALTER TABLE `payer`
  ADD PRIMARY KEY (`PayerID`),
  ADD KEY `idxPayer` (`PayerID`);

--
-- Indici per le tabelle `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `idxPayment` (`PaymentID`),
  ADD KEY `idxPaymentPayer` (`PayerID`);

--
-- Indici per le tabelle `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`StudentID`),
  ADD KEY `idxStudent` (`StudentID`);

--
-- Indici per le tabelle `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`SubjectID`),
  ADD UNIQUE KEY `ukSubjectName` (`SubjectName`),
  ADD KEY `idxSubject` (`SubjectID`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `lesson`
--
ALTER TABLE `lesson`
  MODIFY `LessonID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT per la tabella `payer`
--
ALTER TABLE `payer`
  MODIFY `PayerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT per la tabella `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT per la tabella `student`
--
ALTER TABLE `student`
  MODIFY `StudentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT per la tabella `subject`
--
ALTER TABLE `subject`
  MODIFY `SubjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `lesson`
--
ALTER TABLE `lesson`
  ADD CONSTRAINT `fkLessonCategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`),
  ADD CONSTRAINT `fkLessonPaymentID` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`),
  ADD CONSTRAINT `fkLessonStudentID` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  ADD CONSTRAINT `fkLessonSubjectID` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`SubjectID`);

--
-- Limiti per la tabella `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fkPaymentPayerID` FOREIGN KEY (`PayerID`) REFERENCES `payer` (`PayerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
