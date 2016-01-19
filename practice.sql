-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2016 at 04:23 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `practice`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customers`
--

CREATE TABLE IF NOT EXISTS `tbl_customers` (
`id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_customers`
--

INSERT INTO `tbl_customers` (`id`, `first_name`, `last_name`, `email`, `contact_no`, `added_date`, `modified_date`, `status`) VALUES
(1, 'bishal', 'lama', 'lama@gmail.com', '1234567', '2015-12-10 03:56:56', NULL, 1),
(2, 'amar', 'Shrestha', 'a@gmail.com', '123451', '2015-12-10 06:47:35', NULL, 0),
(3, 'Ashish', 'Adhikari', 'aashishadhikari000@gmail.com', '1234512', '2015-12-10 06:48:44', NULL, 0),
(4, 'as', 'asda', 'a@gmail.com', '123123', '2015-12-10 06:49:39', NULL, 0),
(5, 'as', 'sdasd', 'asdasd', 'sd', '2015-12-11 02:04:15', NULL, 0),
(6, 'q', 'q', 'q', '213', '2015-12-11 02:15:48', NULL, 0),
(7, 'wewf', 'ewfwef', 'fwef', '312323', '2015-12-11 02:21:19', NULL, 0),
(8, 'asa', 'asdsa', 'a@gmail.com', 'ssafsfasf', '2015-12-11 05:14:58', NULL, 0),
(9, 'a', 'aa', 'a@gmail.com', '12312', '2016-01-19 02:51:50', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
