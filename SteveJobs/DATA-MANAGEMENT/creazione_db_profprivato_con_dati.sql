-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Ott 17, 2025 alle 13:07
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
(2, 'Liceo', 25.00),
(3, 'Università', 35.00),
(4, 'Preparazione Esami', 50.00);

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
) ;

--
-- Dump dei dati per la tabella `lesson`
--

INSERT INTO `lesson` (`LessonID`, `StudentID`, `SubjectID`, `PaymentID`, `CategoryID`, `StartDate`, `StartTime`, `LessonType`) VALUES
(1, 1, 2, 48, 1, '2025-06-18', '16:30:00', 'In Presenza'),
(2, 2, 4, 8, 2, '2025-06-01', '15:00:00', 'Online'),
(3, 3, 5, NULL, 4, '2025-07-31', '16:30:00', 'Online'),
(4, 4, 6, 22, 4, '2025-05-04', '18:00:00', 'Online'),
(5, 5, 5, 16, 2, '2025-09-24', '18:00:00', 'Online'),
(6, 6, 2, 73, 3, '2025-08-30', '18:00:00', 'In Presenza'),
(7, 7, 5, 36, 1, '2025-05-19', '16:30:00', 'In Presenza'),
(8, 8, 3, 17, 1, '2025-04-28', '18:00:00', 'Online'),
(9, 9, 3, 41, 1, '2025-05-26', '16:30:00', 'In Presenza'),
(10, 10, 3, NULL, 4, '2025-10-09', '16:30:00', 'In Presenza'),
(11, 11, 3, NULL, 3, '2025-09-20', '18:00:00', 'In Presenza'),
(12, 12, 1, 71, 3, '2025-08-17', '16:30:00', 'Online'),
(13, 13, 3, 21, 2, '2025-06-12', '15:00:00', 'Online'),
(14, 14, 1, 11, 2, '2025-04-24', '16:30:00', 'In Presenza'),
(15, 15, 3, NULL, 3, '2025-06-02', '15:00:00', 'In Presenza'),
(16, 16, 3, 65, 4, '2025-10-19', '15:00:00', 'In Presenza'),
(17, 17, 7, 59, 1, '2025-07-20', '16:30:00', 'Online'),
(18, 18, 1, 39, 2, '2025-05-28', '16:30:00', 'Online'),
(19, 19, 4, NULL, 2, '2025-07-11', '15:00:00', 'Online'),
(20, 20, 5, NULL, 1, '2025-05-16', '16:30:00', 'In Presenza'),
(21, 21, 7, NULL, 1, '2025-07-07', '15:00:00', 'Online'),
(22, 22, 2, NULL, 2, '2025-08-19', '16:30:00', 'In Presenza'),
(23, 23, 6, 45, 3, '2025-05-27', '15:00:00', 'Online'),
(24, 24, 5, 30, 2, '2025-05-11', '18:00:00', 'In Presenza'),
(25, 25, 1, 72, 2, '2025-08-29', '18:00:00', 'In Presenza'),
(26, 26, 7, NULL, 2, '2025-09-14', '16:30:00', 'In Presenza'),
(27, 27, 1, NULL, 3, '2025-08-07', '18:00:00', 'Online'),
(28, 28, 3, 64, 1, '2025-07-25', '16:30:00', 'In Presenza'),
(29, 29, 1, 66, 3, '2025-08-07', '16:30:00', 'In Presenza'),
(30, 30, 3, NULL, 2, '2025-11-07', '16:30:00', 'Online'),
(31, 31, 1, NULL, 4, '2025-09-09', '15:00:00', 'Online'),
(32, 32, 2, NULL, 1, '2025-09-21', '15:00:00', 'In Presenza'),
(33, 33, 2, NULL, 1, '2025-11-16', '16:30:00', 'In Presenza'),
(34, 34, 1, NULL, 4, '2025-08-15', '15:00:00', 'Online'),
(35, 35, 6, 55, 2, '2025-07-10', '16:30:00', 'Online'),
(36, 36, 4, 80, 2, '2025-10-09', '15:00:00', 'Online'),
(37, 37, 6, 46, 4, '2025-05-27', '15:00:00', 'Online'),
(38, 38, 7, NULL, 1, '2025-05-05', '18:00:00', 'Online'),
(39, 39, 3, NULL, 2, '2025-05-11', '15:00:00', 'In Presenza'),
(40, 40, 4, 50, 3, '2025-06-13', '18:00:00', 'In Presenza'),
(41, 41, 4, NULL, 2, '2025-10-03', '18:00:00', 'In Presenza'),
(42, 42, 1, 10, 1, '2025-08-24', '18:00:00', 'In Presenza'),
(43, 43, 4, NULL, 4, '2025-06-17', '18:00:00', 'Online'),
(44, 44, 4, NULL, 1, '2025-08-02', '16:30:00', 'Online'),
(45, 45, 3, NULL, 4, '2025-08-08', '18:00:00', 'Online'),
(46, 46, 2, 47, 4, '2025-05-30', '16:30:00', 'Online'),
(47, 47, 1, NULL, 3, '2025-09-25', '15:00:00', 'In Presenza'),
(48, 48, 6, NULL, 2, '2025-07-11', '18:00:00', 'In Presenza'),
(49, 49, 6, 12, 4, '2025-04-24', '16:30:00', 'Online'),
(50, 50, 3, 77, 2, '2025-09-07', '15:00:00', 'Online'),
(51, 51, 5, NULL, 1, '2025-06-20', '15:00:00', 'Online'),
(52, 52, 5, 78, 2, '2025-09-08', '16:30:00', 'Online'),
(53, 53, 7, 37, 3, '2025-05-19', '18:00:00', 'In Presenza'),
(54, 54, 2, 13, 4, '2025-04-24', '16:30:00', 'In Presenza'),
(55, 55, 6, NULL, 4, '2025-11-05', '18:00:00', 'In Presenza'),
(56, 56, 3, NULL, 1, '2025-08-23', '18:00:00', 'In Presenza'),
(57, 57, 4, 74, 2, '2025-10-13', '16:30:00', 'Online'),
(58, 58, 1, NULL, 1, '2025-10-14', '16:30:00', 'In Presenza'),
(59, 59, 6, 32, 4, '2025-07-31', '16:30:00', 'Online'),
(60, 60, 6, NULL, 1, '2025-07-25', '18:00:00', 'In Presenza'),
(61, 61, 5, 51, 1, '2025-06-14', '16:30:00', 'Online'),
(62, 62, 1, NULL, 3, '2025-09-24', '15:00:00', 'In Presenza'),
(63, 63, 4, 40, 2, '2025-05-23', '16:30:00', 'In Presenza'),
(64, 64, 5, NULL, 3, '2025-09-24', '16:30:00', 'Online'),
(65, 65, 2, 61, 4, '2025-07-16', '15:00:00', 'In Presenza'),
(66, 66, 4, 43, 4, '2025-10-05', '15:00:00', 'In Presenza'),
(67, 67, 7, NULL, 3, '2025-10-10', '18:00:00', 'Online'),
(68, 68, 4, NULL, 1, '2025-08-22', '16:30:00', 'In Presenza'),
(69, 69, 4, 52, 4, '2025-06-15', '15:00:00', 'In Presenza'),
(70, 70, 3, NULL, 2, '2025-08-20', '16:30:00', 'In Presenza'),
(71, 71, 2, NULL, 2, '2025-05-11', '18:00:00', 'Online'),
(72, 72, 6, NULL, 1, '2025-10-28', '16:30:00', 'Online'),
(73, 73, 1, 62, 2, '2025-07-20', '18:00:00', 'Online'),
(74, 74, 1, 1, 3, '2025-04-17', '16:30:00', 'Online'),
(75, 75, 5, NULL, 3, '2025-10-01', '18:00:00', 'In Presenza'),
(76, 76, 3, 28, 4, '2025-07-14', '15:00:00', 'Online'),
(77, 77, 4, 68, 4, '2025-09-14', '18:00:00', 'In Presenza'),
(78, 78, 3, NULL, 1, '2025-06-16', '15:00:00', 'In Presenza'),
(79, 79, 1, NULL, 2, '2025-10-06', '15:00:00', 'Online'),
(80, 80, 3, NULL, 2, '2025-10-13', '16:30:00', 'In Presenza'),
(81, 11, 6, 19, 2, '2025-04-29', '18:00:00', 'Online'),
(82, 6, 7, 73, 2, '2025-10-16', '15:00:00', 'Online'),
(83, 49, 4, 12, 4, '2025-05-23', '15:00:00', 'Online'),
(84, 66, 5, 42, 2, '2025-05-26', '16:30:00', 'Online'),
(85, 10, 6, 49, 2, '2025-07-17', '15:00:00', 'Online'),
(86, 46, 2, 47, 3, '2025-11-09', '16:30:00', 'Online'),
(87, 26, 5, 3, 3, '2025-07-01', '16:30:00', 'Online'),
(88, 21, 3, NULL, 4, '2025-07-10', '18:00:00', 'Online'),
(89, 17, 4, NULL, 1, '2025-09-06', '16:30:00', 'Online'),
(90, 18, 7, NULL, 2, '2025-06-21', '18:00:00', 'In Presenza'),
(91, 33, 3, NULL, 1, '2025-10-11', '18:00:00', 'In Presenza'),
(92, 52, 5, NULL, 2, '2025-10-16', '16:30:00', 'Online'),
(93, 70, 2, 34, 4, '2025-05-14', '18:00:00', 'Online'),
(94, 76, 1, 26, 1, '2025-05-06', '16:30:00', 'Online'),
(95, 6, 4, NULL, 1, '2025-10-28', '16:30:00', 'In Presenza'),
(96, 17, 5, 59, 2, '2025-06-29', '18:00:00', 'Online'),
(97, 13, 4, NULL, 2, '2025-09-27', '16:30:00', 'Online'),
(98, 16, 6, NULL, 3, '2025-11-08', '18:00:00', 'In Presenza'),
(99, 76, 7, NULL, 3, '2025-09-06', '15:00:00', 'In Presenza'),
(100, 40, 1, NULL, 3, '2025-07-25', '18:00:00', 'In Presenza'),
(101, 54, 4, NULL, 1, '2025-08-10', '16:30:00', 'In Presenza'),
(102, 76, 1, 27, 3, '2025-06-12', '15:00:00', 'Online'),
(103, 10, 7, 49, 2, '2025-06-12', '15:00:00', 'Online'),
(104, 1, 7, 48, 1, '2025-05-31', '15:00:00', 'Online'),
(105, 8, 3, NULL, 1, '2025-10-27', '18:00:00', 'In Presenza'),
(106, 2, 4, NULL, 2, '2025-11-11', '16:30:00', 'Online'),
(107, 2, 6, 8, 4, '2025-04-23', '15:00:00', 'In Presenza'),
(108, 9, 1, NULL, 4, '2025-08-08', '15:00:00', 'In Presenza'),
(109, 61, 6, NULL, 2, '2025-07-09', '18:00:00', 'In Presenza'),
(110, 53, 7, NULL, 2, '2025-06-19', '16:30:00', 'In Presenza'),
(111, 29, 4, 66, 1, '2025-10-14', '16:30:00', 'In Presenza'),
(112, 62, 7, 35, 3, '2025-05-17', '15:00:00', 'In Presenza'),
(113, 68, 2, 24, 1, '2025-05-06', '15:00:00', 'In Presenza'),
(114, 42, 5, NULL, 4, '2025-10-01', '18:00:00', 'Online'),
(115, 35, 4, 54, 1, '2025-06-17', '15:00:00', 'Online'),
(116, 49, 2, NULL, 1, '2025-05-30', '15:00:00', 'In Presenza'),
(117, 2, 2, NULL, 4, '2025-10-02', '16:30:00', 'In Presenza'),
(118, 50, 4, NULL, 3, '2025-09-08', '16:30:00', 'Online'),
(119, 13, 3, 21, 4, '2025-06-03', '15:00:00', 'In Presenza'),
(120, 7, 4, NULL, 1, '2025-10-30', '18:00:00', 'In Presenza'),
(121, 17, 1, NULL, 1, '2025-08-06', '15:00:00', 'Online'),
(122, 73, 4, 63, 1, '2025-08-07', '16:30:00', 'In Presenza'),
(123, 44, 4, 60, 4, '2025-07-09', '16:30:00', 'In Presenza'),
(124, 11, 2, 20, 2, '2025-08-03', '16:30:00', 'In Presenza'),
(125, 74, 5, 2, 1, '2025-10-21', '16:30:00', 'In Presenza'),
(126, 41, 7, 76, 4, '2025-09-03', '16:30:00', 'In Presenza'),
(127, 69, 3, NULL, 2, '2025-10-10', '16:30:00', 'Online'),
(128, 59, 7, 31, 4, '2025-05-13', '16:30:00', 'In Presenza'),
(129, 74, 2, NULL, 4, '2025-10-21', '15:00:00', 'Online'),
(130, 46, 4, NULL, 3, '2025-11-12', '16:30:00', 'In Presenza'),
(131, 13, 7, NULL, 1, '2025-08-29', '18:00:00', 'In Presenza'),
(132, 57, 7, NULL, 1, '2025-10-20', '18:00:00', 'Online'),
(133, 5, 2, NULL, 3, '2025-10-04', '18:00:00', 'Online'),
(134, 4, 3, 23, 4, '2025-06-05', '18:00:00', 'Online'),
(135, 43, 3, 7, 3, '2025-06-07', '16:30:00', 'Online'),
(136, 25, 4, NULL, 1, '2025-11-06', '15:00:00', 'Online'),
(137, 30, 7, 79, 4, '2025-09-13', '18:00:00', 'Online'),
(138, 6, 6, NULL, 4, '2025-10-27', '15:00:00', 'Online'),
(139, 67, 6, 70, 3, '2025-08-14', '18:00:00', 'Online'),
(140, 4, 1, NULL, 2, '2025-07-08', '15:00:00', 'Online'),
(141, 16, 3, NULL, 4, '2025-11-01', '18:00:00', 'In Presenza'),
(142, 66, 3, NULL, 2, '2025-11-01', '16:30:00', 'Online'),
(143, 26, 4, 3, 2, '2025-08-04', '15:00:00', 'Online'),
(144, 23, 5, NULL, 3, '2025-09-28', '15:00:00', 'Online'),
(145, 36, 2, 80, 3, '2025-09-28', '15:00:00', 'In Presenza'),
(146, 4, 3, NULL, 3, '2025-10-26', '16:30:00', 'In Presenza'),
(147, 1, 3, NULL, 1, '2025-11-10', '18:00:00', 'In Presenza'),
(148, 32, 1, NULL, 1, '2025-09-19', '18:00:00', 'Online'),
(149, 29, 3, NULL, 3, '2025-10-30', '16:30:00', 'In Presenza'),
(150, 5, 6, 15, 1, '2025-04-25', '18:00:00', 'Online'),
(151, 42, 2, NULL, 4, '2025-11-03', '16:30:00', 'Online'),
(152, 14, 5, NULL, 2, '2025-09-14', '18:00:00', 'In Presenza'),
(153, 18, 4, 39, 2, '2025-05-22', '16:30:00', 'In Presenza'),
(154, 54, 3, 14, 2, '2025-05-29', '16:30:00', 'Online'),
(155, 55, 6, 69, 4, '2025-08-09', '18:00:00', 'In Presenza'),
(156, 56, 1, 56, 2, '2025-06-19', '16:30:00', 'Online'),
(157, 75, 6, 75, 1, '2025-09-02', '18:00:00', 'In Presenza'),
(158, 36, 4, NULL, 1, '2025-10-20', '18:00:00', 'In Presenza'),
(159, 33, 4, 57, 1, '2025-08-04', '16:30:00', 'In Presenza'),
(160, 28, 5, NULL, 1, '2025-10-26', '15:00:00', 'In Presenza'),
(161, 21, 2, 38, 3, '2025-05-21', '16:30:00', 'Online'),
(162, 76, 1, NULL, 3, '2025-08-10', '16:30:00', 'Online'),
(163, 73, 7, NULL, 4, '2025-09-08', '15:00:00', 'Online'),
(164, 72, 2, 81, 1, '2025-10-14', '18:00:00', 'Online'),
(165, 8, 2, 18, 2, '2025-07-06', '18:00:00', 'Online'),
(166, 77, 1, NULL, 4, '2025-10-01', '15:00:00', 'In Presenza'),
(167, 49, 6, NULL, 3, '2025-10-12', '18:00:00', 'Online'),
(168, 42, 3, 9, 4, '2025-04-23', '15:00:00', 'In Presenza'),
(169, 26, 3, 3, 3, '2025-04-17', '18:00:00', 'Online'),
(170, 47, 6, 58, 1, '2025-06-24', '16:30:00', 'In Presenza'),
(171, 66, 7, 44, 4, '2025-10-18', '15:00:00', 'Online'),
(172, 68, 5, 24, 1, '2025-05-05', '16:30:00', 'In Presenza'),
(173, 48, 6, 33, 4, '2025-05-13', '15:00:00', 'In Presenza'),
(174, 9, 3, 41, 1, '2025-08-01', '18:00:00', 'In Presenza'),
(175, 26, 4, 3, 1, '2025-04-21', '16:30:00', 'In Presenza'),
(176, 43, 7, NULL, 3, '2025-11-05', '15:00:00', 'In Presenza'),
(177, 24, 1, NULL, 4, '2025-11-09', '16:30:00', 'Online'),
(178, 12, 7, NULL, 1, '2025-09-19', '18:00:00', 'Online'),
(179, 35, 7, NULL, 4, '2025-08-28', '15:00:00', 'In Presenza'),
(180, 65, 7, NULL, 4, '2025-11-10', '16:30:00', 'Online'),
(181, 13, 1, 21, 1, '2025-04-30', '15:00:00', 'Online'),
(182, 32, 2, 4, 2, '2025-04-17', '16:30:00', 'In Presenza'),
(183, 31, 1, 25, 4, '2025-05-05', '16:30:00', 'Online'),
(184, 26, 3, NULL, 4, '2025-08-13', '18:00:00', 'Online'),
(185, 16, 2, 65, 4, '2025-08-03', '16:30:00', 'In Presenza'),
(186, 32, 4, 5, 3, '2025-08-13', '18:00:00', 'In Presenza'),
(187, 77, 4, NULL, 4, '2025-10-28', '18:00:00', 'Online'),
(188, 43, 7, 6, 1, '2025-04-19', '16:30:00', 'In Presenza'),
(189, 35, 6, NULL, 2, '2025-08-26', '18:00:00', 'In Presenza'),
(190, 59, 6, NULL, 3, '2025-11-04', '15:00:00', 'In Presenza'),
(191, 33, 7, 57, 4, '2025-06-22', '15:00:00', 'In Presenza'),
(192, 37, 2, NULL, 3, '2025-07-24', '18:00:00', 'Online'),
(193, 21, 7, 38, 3, '2025-06-17', '15:00:00', 'In Presenza'),
(194, 32, 4, 5, 2, '2025-06-04', '16:30:00', 'Online'),
(195, 77, 3, 67, 1, '2025-08-08', '18:00:00', 'Online'),
(196, 63, 1, NULL, 2, '2025-08-22', '16:30:00', 'Online'),
(197, 69, 3, 53, 2, '2025-10-03', '16:30:00', 'Online'),
(198, 57, 7, 74, 2, '2025-09-01', '15:00:00', 'In Presenza'),
(199, 3, 2, 29, 2, '2025-05-06', '15:00:00', 'Online'),
(200, 66, 2, NULL, 3, '2025-10-23', '18:00:00', 'In Presenza');

-- --------------------------------------------------------

--
-- Struttura della tabella `payer`
--

CREATE TABLE `payer` (
  `PayerID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `Email` varchar(60) NOT NULL
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
(1, 11, 35.00, 'PayPal', '2025-04-17'),
(2, 57, 15.00, 'PayPal', '2025-10-17'),
(3, 33, 110.00, 'Carta di Credito', '2025-04-11'),
(4, 12, 25.00, 'Carta di Credito', '2025-04-15'),
(5, 52, 60.00, 'Carta di Credito', '2025-05-30'),
(6, 90, 15.00, 'PayPal', '2025-04-19'),
(7, 2, 35.00, 'Bonifico', '2025-06-03'),
(8, 54, 75.00, 'Bonifico', '2025-04-17'),
(9, 82, 50.00, 'PayPal', '2025-04-23'),
(10, 61, 15.00, 'Bonifico', '2025-08-17'),
(11, 79, 25.00, 'Carta di Credito', '2025-04-20'),
(12, 81, 100.00, 'Carta di Credito', '2025-04-23'),
(13, 99, 50.00, 'Satispay', '2025-04-19'),
(14, 96, 25.00, 'Carta di Credito', '2025-05-27'),
(15, 84, 15.00, 'Bonifico', '2025-04-21'),
(16, 7, 25.00, 'Satispay', '2025-09-22'),
(17, 34, 15.00, 'Bonifico', '2025-04-24'),
(18, 37, 25.00, 'PayPal', '2025-07-06'),
(19, 39, 25.00, 'Satispay', '2025-04-26'),
(20, 43, 25.00, 'Satispay', '2025-08-01'),
(21, 25, 90.00, 'Satispay', '2025-04-25'),
(22, 6, 50.00, 'Contanti', '2025-04-28'),
(23, 81, 50.00, 'PayPal', '2025-06-03'),
(24, 34, 30.00, 'PayPal', '2025-05-01'),
(25, 51, 50.00, 'Bonifico', '2025-04-28'),
(26, 33, 15.00, 'Contanti', '2025-05-04'),
(27, 57, 35.00, 'Carta di Credito', '2025-06-07'),
(28, 25, 50.00, 'Contanti', '2025-07-14'),
(29, 66, 25.00, 'Contanti', '2025-04-29'),
(30, 7, 25.00, 'Contanti', '2025-05-04'),
(31, 88, 50.00, 'Contanti', '2025-05-10'),
(32, 85, 50.00, 'PayPal', '2025-07-30'),
(33, 42, 50.00, 'Contanti', '2025-05-12'),
(34, 16, 50.00, 'Satispay', '2025-05-14'),
(35, 86, 35.00, 'Bonifico', '2025-05-11'),
(36, 76, 15.00, 'Satispay', '2025-05-19'),
(37, 57, 35.00, 'PayPal', '2025-05-19'),
(38, 92, 70.00, 'Contanti', '2025-05-19'),
(39, 52, 50.00, 'Contanti', '2025-05-18'),
(40, 65, 25.00, 'Satispay', '2025-05-22'),
(41, 85, 30.00, 'PayPal', '2025-05-23'),
(42, 93, 25.00, 'Carta di Credito', '2025-05-24'),
(43, 82, 50.00, 'Carta di Credito', '2025-10-04'),
(44, 60, 50.00, 'Satispay', '2025-10-13'),
(45, 47, 35.00, 'Bonifico', '2025-05-23'),
(46, 21, 50.00, 'PayPal', '2025-05-24'),
(47, 19, 85.00, 'Bonifico', '2025-05-30'),
(48, 89, 30.00, 'Bonifico', '2025-05-25'),
(49, 9, 50.00, 'Satispay', '2025-06-07'),
(50, 14, 35.00, 'Carta di Credito', '2025-06-13'),
(51, 53, 15.00, 'PayPal', '2025-06-14'),
(52, 95, 50.00, 'Satispay', '2025-06-13'),
(53, 67, 25.00, 'PayPal', '2025-09-27'),
(54, 39, 15.00, 'Contanti', '2025-06-17'),
(55, 86, 25.00, 'PayPal', '2025-07-07'),
(56, 1, 25.00, 'Satispay', '2025-06-12'),
(57, 71, 65.00, 'Bonifico', '2025-06-20'),
(58, 98, 15.00, 'Bonifico', '2025-06-24'),
(59, 26, 40.00, 'Bonifico', '2025-06-27'),
(60, 54, 50.00, 'Bonifico', '2025-07-09'),
(61, 28, 50.00, 'Contanti', '2025-07-14'),
(62, 75, 25.00, 'PayPal', '2025-07-14'),
(63, 25, 15.00, 'Satispay', '2025-08-05'),
(64, 59, 15.00, 'PayPal', '2025-07-18'),
(65, 64, 100.00, 'Contanti', '2025-07-29'),
(66, 21, 50.00, 'PayPal', '2025-08-03'),
(67, 63, 15.00, 'Bonifico', '2025-08-03'),
(68, 20, 50.00, 'PayPal', '2025-09-13'),
(69, 83, 50.00, 'Bonifico', '2025-08-06'),
(70, 37, 35.00, 'Contanti', '2025-08-14'),
(71, 22, 35.00, 'Carta di Credito', '2025-08-12'),
(72, 13, 25.00, 'PayPal', '2025-08-22'),
(73, 26, 60.00, 'Carta di Credito', '2025-08-24'),
(74, 89, 50.00, 'Contanti', '2025-08-25'),
(75, 11, 15.00, 'PayPal', '2025-09-02'),
(76, 98, 50.00, 'PayPal', '2025-09-02'),
(77, 77, 25.00, 'Bonifico', '2025-09-01'),
(78, 24, 25.00, 'Bonifico', '2025-09-07'),
(79, 19, 50.00, 'PayPal', '2025-09-11'),
(80, 98, 60.00, 'Contanti', '2025-09-26'),
(81, 70, 15.00, 'Bonifico', '2025-10-09');

-- --------------------------------------------------------

--
-- Struttura della tabella `student`
--

CREATE TABLE `student` (
  `StudentID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
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
(6, 'Filosofia'),
(2, 'Fisica'),
(7, 'Informatica'),
(5, 'Italiano'),
(1, 'Matematica');

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `vista_analisi_studente`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `vista_analisi_studente` (
`StudentID` int(11)
,`Studente` varchar(101)
,`Città` varchar(50)
,`Telefono` varchar(20)
,`NumeroLezioni` bigint(21)
,`DataUltimaLezione` date
);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `vista_fatturato_mensile`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `vista_fatturato_mensile` (
`Anno` int(4)
,`Mese` int(2)
,`AnnoMese` varchar(7)
,`NumeroPagamenti` bigint(21)
,`LezioniPagate` bigint(21)
,`FatturatoTotale` decimal(32,2)
,`MediaPagamento` decimal(14,6)
);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `vista_lezioni_categoria`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `vista_lezioni_categoria` (
`Categoria` varchar(50)
,`Tariffa` decimal(10,2)
,`LessonID` int(11)
,`Data` date
,`Orario` time
,`Studente` varchar(101)
,`Materia` varchar(50)
,`TipoLezione` varchar(30)
);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `vista_lezioni_giorno`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `vista_lezioni_giorno` (
`LessonID` int(11)
,`Data` date
,`Orario` time
,`Studente` varchar(101)
,`Materia` varchar(50)
,`Categoria` varchar(50)
,`TipoLezione` varchar(30)
,`Tariffa` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `vista_lezioni_materia`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `vista_lezioni_materia` (
`Materia` varchar(50)
,`LessonID` int(11)
,`Data` date
,`Orario` time
,`Studente` varchar(101)
,`Categoria` varchar(50)
,`Tariffa` decimal(10,2)
,`TipoLezione` varchar(30)
);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `vista_lezioni_non_pagate`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `vista_lezioni_non_pagate` (
`LessonID` int(11)
,`Data` date
,`Orario` time
,`Studente` varchar(101)
,`TelefonoStudente` varchar(20)
,`Materia` varchar(50)
,`Categoria` varchar(50)
,`ImportoAtteso` decimal(10,2)
,`TipoLezione` varchar(30)
);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `vista_lezioni_orario`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `vista_lezioni_orario` (
`LessonID` int(11)
,`Orario` time
,`Data` date
,`Studente` varchar(101)
,`Materia` varchar(50)
,`Categoria` varchar(50)
,`Tariffa` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `vista_lezioni_studente`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `vista_lezioni_studente` (
`Studente` varchar(101)
,`StudentID` int(11)
,`LessonID` int(11)
,`Data` date
,`Orario` time
,`Materia` varchar(50)
,`Categoria` varchar(50)
,`Tariffa` decimal(10,2)
,`TipoLezione` varchar(30)
);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `vista_registro_pagamenti`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `vista_registro_pagamenti` (
`LessonID` int(11)
,`DataLezione` date
,`OrarioLezione` time
,`Studente` varchar(101)
,`Materia` varchar(50)
,`TariffaLezione` decimal(10,2)
,`StatoPagamento` varchar(10)
,`DataPagamento` date
,`Pagante` varchar(101)
,`ImportoPagamento` decimal(10,2)
,`MetodoPagamento` varchar(30)
);

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `vista_situazione_pagante`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `vista_situazione_pagante` (
`PayerID` int(11)
,`Pagante` varchar(101)
,`Telefono` varchar(20)
,`Email` varchar(60)
,`NumeroLezioni` bigint(21)
,`TotaleAtteso` decimal(32,2)
,`TotalePagato` decimal(32,2)
,`Saldo` decimal(33,2)
);

-- --------------------------------------------------------

--
-- Struttura per vista `vista_analisi_studente`
--
DROP TABLE IF EXISTS `vista_analisi_studente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_analisi_studente`  AS SELECT `s`.`StudentID` AS `StudentID`, concat(`s`.`FirstName`,' ',`s`.`LastName`) AS `Studente`, `s`.`City` AS `Città`, `s`.`PhoneNumber` AS `Telefono`, count(`l`.`LessonID`) AS `NumeroLezioni`, max(`l`.`StartDate`) AS `DataUltimaLezione` FROM (`student` `s` left join `lesson` `l` on(`s`.`StudentID` = `l`.`StudentID`)) GROUP BY `s`.`StudentID`, `s`.`FirstName`, `s`.`LastName`, `s`.`City`, `s`.`PhoneNumber` ORDER BY count(`l`.`LessonID`) DESC ;

-- --------------------------------------------------------

--
-- Struttura per vista `vista_fatturato_mensile`
--
DROP TABLE IF EXISTS `vista_fatturato_mensile`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_fatturato_mensile`  AS SELECT year(`p`.`PaymentDate`) AS `Anno`, month(`p`.`PaymentDate`) AS `Mese`, date_format(`p`.`PaymentDate`,'%Y-%m') AS `AnnoMese`, count(distinct `p`.`PaymentID`) AS `NumeroPagamenti`, count(`l`.`LessonID`) AS `LezioniPagate`, sum(`p`.`Amount`) AS `FatturatoTotale`, avg(`p`.`Amount`) AS `MediaPagamento` FROM (`payment` `p` left join `lesson` `l` on(`p`.`PaymentID` = `l`.`PaymentID`)) GROUP BY year(`p`.`PaymentDate`), month(`p`.`PaymentDate`), date_format(`p`.`PaymentDate`,'%Y-%m') ORDER BY year(`p`.`PaymentDate`) DESC, month(`p`.`PaymentDate`) DESC ;

-- --------------------------------------------------------

--
-- Struttura per vista `vista_lezioni_categoria`
--
DROP TABLE IF EXISTS `vista_lezioni_categoria`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_lezioni_categoria`  AS SELECT `c`.`CategoryStudent` AS `Categoria`, `c`.`Price` AS `Tariffa`, `l`.`LessonID` AS `LessonID`, `l`.`StartDate` AS `Data`, `l`.`StartTime` AS `Orario`, concat(`s`.`FirstName`,' ',`s`.`LastName`) AS `Studente`, `sub`.`SubjectName` AS `Materia`, `l`.`LessonType` AS `TipoLezione` FROM (((`category` `c` join `lesson` `l` on(`c`.`CategoryID` = `l`.`CategoryID`)) join `student` `s` on(`l`.`StudentID` = `s`.`StudentID`)) join `subject` `sub` on(`l`.`SubjectID` = `sub`.`SubjectID`)) ORDER BY `c`.`CategoryStudent` ASC, `l`.`StartDate` ASC, `l`.`StartTime` ASC ;

-- --------------------------------------------------------

--
-- Struttura per vista `vista_lezioni_giorno`
--
DROP TABLE IF EXISTS `vista_lezioni_giorno`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_lezioni_giorno`  AS SELECT `l`.`LessonID` AS `LessonID`, `l`.`StartDate` AS `Data`, `l`.`StartTime` AS `Orario`, concat(`s`.`FirstName`,' ',`s`.`LastName`) AS `Studente`, `sub`.`SubjectName` AS `Materia`, `c`.`CategoryStudent` AS `Categoria`, `l`.`LessonType` AS `TipoLezione`, `c`.`Price` AS `Tariffa` FROM (((`lesson` `l` join `student` `s` on(`l`.`StudentID` = `s`.`StudentID`)) join `subject` `sub` on(`l`.`SubjectID` = `sub`.`SubjectID`)) join `category` `c` on(`l`.`CategoryID` = `c`.`CategoryID`)) ORDER BY `l`.`StartDate` ASC, `l`.`StartTime` ASC ;

-- --------------------------------------------------------

--
-- Struttura per vista `vista_lezioni_materia`
--
DROP TABLE IF EXISTS `vista_lezioni_materia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_lezioni_materia`  AS SELECT `sub`.`SubjectName` AS `Materia`, `l`.`LessonID` AS `LessonID`, `l`.`StartDate` AS `Data`, `l`.`StartTime` AS `Orario`, concat(`s`.`FirstName`,' ',`s`.`LastName`) AS `Studente`, `c`.`CategoryStudent` AS `Categoria`, `c`.`Price` AS `Tariffa`, `l`.`LessonType` AS `TipoLezione` FROM (((`lesson` `l` join `subject` `sub` on(`l`.`SubjectID` = `sub`.`SubjectID`)) join `student` `s` on(`l`.`StudentID` = `s`.`StudentID`)) join `category` `c` on(`l`.`CategoryID` = `c`.`CategoryID`)) ORDER BY `sub`.`SubjectName` ASC, `l`.`StartDate` ASC, `l`.`StartTime` ASC ;

-- --------------------------------------------------------

--
-- Struttura per vista `vista_lezioni_non_pagate`
--
DROP TABLE IF EXISTS `vista_lezioni_non_pagate`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_lezioni_non_pagate`  AS SELECT `l`.`LessonID` AS `LessonID`, `l`.`StartDate` AS `Data`, `l`.`StartTime` AS `Orario`, concat(`s`.`FirstName`,' ',`s`.`LastName`) AS `Studente`, `s`.`PhoneNumber` AS `TelefonoStudente`, `sub`.`SubjectName` AS `Materia`, `c`.`CategoryStudent` AS `Categoria`, `c`.`Price` AS `ImportoAtteso`, `l`.`LessonType` AS `TipoLezione` FROM (((`lesson` `l` join `student` `s` on(`l`.`StudentID` = `s`.`StudentID`)) join `subject` `sub` on(`l`.`SubjectID` = `sub`.`SubjectID`)) join `category` `c` on(`l`.`CategoryID` = `c`.`CategoryID`)) WHERE `l`.`PaymentID` is null ORDER BY `l`.`StartDate` ASC, `l`.`StartTime` ASC ;

-- --------------------------------------------------------

--
-- Struttura per vista `vista_lezioni_orario`
--
DROP TABLE IF EXISTS `vista_lezioni_orario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_lezioni_orario`  AS SELECT `l`.`LessonID` AS `LessonID`, `l`.`StartTime` AS `Orario`, `l`.`StartDate` AS `Data`, concat(`s`.`FirstName`,' ',`s`.`LastName`) AS `Studente`, `sub`.`SubjectName` AS `Materia`, `c`.`CategoryStudent` AS `Categoria`, `c`.`Price` AS `Tariffa` FROM (((`lesson` `l` join `student` `s` on(`l`.`StudentID` = `s`.`StudentID`)) join `subject` `sub` on(`l`.`SubjectID` = `sub`.`SubjectID`)) join `category` `c` on(`l`.`CategoryID` = `c`.`CategoryID`)) ORDER BY `l`.`StartTime` ASC, `l`.`StartDate` ASC ;

-- --------------------------------------------------------

--
-- Struttura per vista `vista_lezioni_studente`
--
DROP TABLE IF EXISTS `vista_lezioni_studente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_lezioni_studente`  AS SELECT concat(`s`.`FirstName`,' ',`s`.`LastName`) AS `Studente`, `s`.`StudentID` AS `StudentID`, `l`.`LessonID` AS `LessonID`, `l`.`StartDate` AS `Data`, `l`.`StartTime` AS `Orario`, `sub`.`SubjectName` AS `Materia`, `c`.`CategoryStudent` AS `Categoria`, `c`.`Price` AS `Tariffa`, `l`.`LessonType` AS `TipoLezione` FROM (((`student` `s` join `lesson` `l` on(`s`.`StudentID` = `l`.`StudentID`)) join `subject` `sub` on(`l`.`SubjectID` = `sub`.`SubjectID`)) join `category` `c` on(`l`.`CategoryID` = `c`.`CategoryID`)) ORDER BY `s`.`LastName` ASC, `s`.`FirstName` ASC, `l`.`StartDate` ASC, `l`.`StartTime` ASC ;

-- --------------------------------------------------------

--
-- Struttura per vista `vista_registro_pagamenti`
--
DROP TABLE IF EXISTS `vista_registro_pagamenti`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_registro_pagamenti`  AS SELECT `l`.`LessonID` AS `LessonID`, `l`.`StartDate` AS `DataLezione`, `l`.`StartTime` AS `OrarioLezione`, concat(`s`.`FirstName`,' ',`s`.`LastName`) AS `Studente`, `sub`.`SubjectName` AS `Materia`, `c`.`Price` AS `TariffaLezione`, CASE WHEN `l`.`PaymentID` is null THEN 'NON PAGATA' ELSE 'PAGATA' END AS `StatoPagamento`, `p`.`PaymentDate` AS `DataPagamento`, concat(`pay`.`FirstName`,' ',`pay`.`LastName`) AS `Pagante`, `p`.`Amount` AS `ImportoPagamento`, `p`.`PaymentMethod` AS `MetodoPagamento` FROM (((((`lesson` `l` join `student` `s` on(`l`.`StudentID` = `s`.`StudentID`)) join `subject` `sub` on(`l`.`SubjectID` = `sub`.`SubjectID`)) join `category` `c` on(`l`.`CategoryID` = `c`.`CategoryID`)) left join `payment` `p` on(`l`.`PaymentID` = `p`.`PaymentID`)) left join `payer` `pay` on(`p`.`PayerID` = `pay`.`PayerID`)) ORDER BY `l`.`StartDate` ASC, `l`.`StartTime` ASC ;

-- --------------------------------------------------------

--
-- Struttura per vista `vista_situazione_pagante`
--
DROP TABLE IF EXISTS `vista_situazione_pagante`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_situazione_pagante`  AS SELECT `pay`.`PayerID` AS `PayerID`, concat(`pay`.`FirstName`,' ',`pay`.`LastName`) AS `Pagante`, `pay`.`PhoneNumber` AS `Telefono`, `pay`.`Email` AS `Email`, count(distinct `l`.`LessonID`) AS `NumeroLezioni`, sum(`c`.`Price`) AS `TotaleAtteso`, coalesce(sum(`p`.`Amount`),0) AS `TotalePagato`, sum(`c`.`Price`) - coalesce(sum(`p`.`Amount`),0) AS `Saldo` FROM (((`payer` `pay` left join `payment` `p` on(`pay`.`PayerID` = `p`.`PayerID`)) left join `lesson` `l` on(`p`.`PaymentID` = `l`.`PaymentID`)) left join `category` `c` on(`l`.`CategoryID` = `c`.`CategoryID`)) GROUP BY `pay`.`PayerID`, `pay`.`FirstName`, `pay`.`LastName`, `pay`.`PhoneNumber`, `pay`.`Email` ORDER BY sum(`c`.`Price`) - coalesce(sum(`p`.`Amount`),0) DESC ;

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
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `lesson`
--
ALTER TABLE `lesson`
  MODIFY `LessonID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `payer`
--
ALTER TABLE `payer`
  MODIFY `PayerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT per la tabella `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT per la tabella `student`
--
ALTER TABLE `student`
  MODIFY `StudentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT per la tabella `subject`
--
ALTER TABLE `subject`
  MODIFY `SubjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
