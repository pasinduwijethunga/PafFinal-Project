-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2021 at 04:54 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gajetbuget`
--

-- --------------------------------------------------------

--
-- Table structure for table `funder`
--

CREATE TABLE `funder` (
  `fundID` int(11) NOT NULL,
  `fundName` varchar(2000) NOT NULL,
  `fundContact` varchar(222) NOT NULL,
  `fundEmail` varchar(200) NOT NULL,
  `fundAdress` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `funder`
--

INSERT INTO `funder` (`fundID`, `fundName`, `fundContact`, `fundEmail`, `fundAdress`) VALUES
(4, 'Ngolanka', '0767252289', 'ngosrilanka@gmail.com', 'srilanka');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `proID` int(11) NOT NULL,
  `proCode` varchar(225) NOT NULL,
  `proName` varchar(225) NOT NULL,
  `proPrice` varchar(225) NOT NULL,
  `proDesc` varchar(225) NOT NULL,
  `proType` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`proID`, `proCode`, `proName`, `proPrice`, `proDesc`, `proType`) VALUES
(34, 'aaa', 'aaa', 'aa', 'aa', 'aa'),
(35, 'as', 'adasd', 'asda', '1212', 'dasda'),
(37, 'qwqwqw', 'eqwee', 'adads', 'dadsad', 'ada');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `funder`
--
ALTER TABLE `funder`
  ADD PRIMARY KEY (`fundID`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`proID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `funder`
--
ALTER TABLE `funder`
  MODIFY `fundID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `proID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
