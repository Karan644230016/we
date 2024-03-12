-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2024 at 03:43 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `activitydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `act_ID` int(3) NOT NULL,
  `act_title` varchar(255) NOT NULL,
  `act_desc` text NOT NULL,
  `act_dateStart` date NOT NULL,
  `act_dateEnd` date NOT NULL,
  `act_numStd` int(100) NOT NULL,
  `act_location` varchar(255) NOT NULL,
  `staff_ID` varchar(9) NOT NULL,
  `act_status` int(11) NOT NULL,
  `act_createAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`act_ID`, `act_title`, `act_desc`, `act_dateStart`, `act_dateEnd`, `act_numStd`, `act_location`, `staff_ID`, `act_status`, `act_createAt`) VALUES
(1, 'dddj', 'fdsa', '2024-03-05', '2024-03-13', 54, 'uyjh', 'lkgj', 1, '2024-03-12 10:33:48'),
(2, 'Team Building Workshop', 'A workshop to enhance team collaboration and communication skills.', '2024-03-15', '2024-03-16', 30, 'Conference Room A', '1', 1, '2024-03-11 17:00:00'),
(3, 'Team2 Building Workshop', 'A workshop to enhance team collaboration and communication skills.', '2024-03-15', '2024-03-16', 30, 'Conference Room A', '1', 1, '0000-00-00 00:00:00'),
(4, 'Team3 Building Workshop', 'A workshop to enhance team collaboration and communication skills.', '2024-03-15', '2024-03-16', 30, 'Conference Room A', '1', 1, '0000-00-00 00:00:00'),
(5, 'Team4 Building Workshop', 'A workshop to enhance team collaboration and communication skills.', '2024-03-15', '2024-03-16', 30, 'Conference Room A', 'll', 1, '2024-03-12 14:42:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`act_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `act_ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
