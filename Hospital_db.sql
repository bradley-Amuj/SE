-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 28, 2019 at 08:33 AM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `Diagnosis`
--

CREATE TABLE `Diagnosis` (
  `ID` int(11) NOT NULL,
  `PatientEmail` varchar(40) NOT NULL,
  `Symptoms` longtext NOT NULL,
  `Medicine` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Diagnosis`
--

INSERT INTO `Diagnosis` (`ID`, `PatientEmail`, `Symptoms`, `Medicine`) VALUES
(1, 'CristianoRonaldo@gmail.com', 'Headache\r\nsweating\r\nFever\r\nshivering at night\r\nlose of appetite\r\n', 'panadol\r\nbrufene');

-- --------------------------------------------------------

--
-- Table structure for table `Patients`
--

CREATE TABLE `Patients` (
  `Firstname` varchar(20) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Phone_Number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Patients`
--

INSERT INTO `Patients` (`Firstname`, `Surname`, `Email`, `Phone_Number`) VALUES
('Cristiano', 'Ronaldo', 'CristianoRonaldo@gmail.com', '0723622008'),
('Jordan', 'River', 'JordanRiver@gmail.com', '0766577778'),
('Messi', 'Ozil', 'MessiOzil@gmail.com', '0788533778'),
('Thiago', 'Ozil', 'ThiagoOzil@gmail.com', '0723522778'),
('Victor', 'Wanyama', 'VictorWany@gmail.com', '0723522778');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `Firstname` varchar(20) NOT NULL,
  `Lastname` varchar(20) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `UserType` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`Firstname`, `Lastname`, `Email`, `Password`, `UserType`) VALUES
('Adrean', 'Kibe', 'AdreanKibe@gmail.com', 'c20ad4d76fe97759aa27a0c99bff6710', 1),
('Bradley', 'Juma', 'Bradleyjuma170@gmail', 'c20ad4d76fe97759aa27a0c99bff6710', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Diagnosis`
--
ALTER TABLE `Diagnosis`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `diagnosis_ibfk_1` (`PatientEmail`);

--
-- Indexes for table `Patients`
--
ALTER TABLE `Patients`
  ADD PRIMARY KEY (`Email`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Diagnosis`
--
ALTER TABLE `Diagnosis`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Diagnosis`
--
ALTER TABLE `Diagnosis`
  ADD CONSTRAINT `diagnosis_ibfk_1` FOREIGN KEY (`PatientEmail`) REFERENCES `Patients` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
