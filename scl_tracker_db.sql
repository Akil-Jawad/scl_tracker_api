-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2019 at 08:21 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scl_tracker_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `emergency_number_table`
--

CREATE TABLE `emergency_number_table` (
  `row_id` int(11) NOT NULL,
  `user_row_id` int(11) NOT NULL,
  `mobile_number` varchar(20) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `geolocation_update`
--

CREATE TABLE `geolocation_update` (
  `row_id` int(11) NOT NULL,
  `user_row_id` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  `geolocation` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_name_table`
--

CREATE TABLE `group_name_table` (
  `row_id` int(11) NOT NULL,
  `group_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `static_subcenter_table`
--

CREATE TABLE `static_subcenter_table` (
  `row_id` int(11) NOT NULL,
  `subcenter_name` varchar(50) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `create_timne` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `row_id` int(11) NOT NULL,
  `user_row_id` int(11) NOT NULL,
  `group_row_id` int(10) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_location_table`
--

CREATE TABLE `user_location_table` (
  `row_id` int(11) NOT NULL,
  `user_row_id` int(11) NOT NULL,
  `lat` double NOT NULL,
  `lon` double NOT NULL,
  `geolocation` varchar(50) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `row_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `present_address` varchar(100) NOT NULL,
  `supervisor_id` int(10) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emergency_number_table`
--
ALTER TABLE `emergency_number_table`
  ADD PRIMARY KEY (`row_id`);

--
-- Indexes for table `geolocation_update`
--
ALTER TABLE `geolocation_update`
  ADD PRIMARY KEY (`row_id`);

--
-- Indexes for table `group_name_table`
--
ALTER TABLE `group_name_table`
  ADD PRIMARY KEY (`row_id`);

--
-- Indexes for table `static_subcenter_table`
--
ALTER TABLE `static_subcenter_table`
  ADD PRIMARY KEY (`row_id`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`row_id`);

--
-- Indexes for table `user_location_table`
--
ALTER TABLE `user_location_table`
  ADD PRIMARY KEY (`row_id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`row_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `emergency_number_table`
--
ALTER TABLE `emergency_number_table`
  MODIFY `row_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `geolocation_update`
--
ALTER TABLE `geolocation_update`
  MODIFY `row_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_name_table`
--
ALTER TABLE `group_name_table`
  MODIFY `row_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `static_subcenter_table`
--
ALTER TABLE `static_subcenter_table`
  MODIFY `row_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `row_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_location_table`
--
ALTER TABLE `user_location_table`
  MODIFY `row_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `row_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
