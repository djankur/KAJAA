-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2022 at 05:14 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kajaa`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `reg_no` varchar(255) NOT NULL,
  `car_name` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `price` varchar(11) NOT NULL,
  `status` enum('available','processing','booked') NOT NULL DEFAULT 'available',
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`reg_no`, `car_name`, `company`, `price`, `status`, `photo`) VALUES
('AS02GH4554', 'Roadster', 'Tesla', '10000', 'processing', 'uploads/tesla.jpg'),
('AS03ZX0101', 'Galardo', 'lamborghini', '10000', 'available', 'uploads/lambo.jpg'),
('as123', 'aaa', 'sss', '28000', 'available', 'uploads/6214de60be7dd8.44376047.jpeg'),
('AS25ZX8989', 'S class', 'Mercedes', '5000', 'available', 'uploads/sclass.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `car_transaction`
--

CREATE TABLE `car_transaction` (
  `transaction_id` bigint(20) NOT NULL,
  `user_id` int(100) NOT NULL,
  `reg_no` varchar(255) NOT NULL,
  `issue_date` varchar(20) DEFAULT NULL,
  `return_date` varchar(20) DEFAULT NULL,
  `issue_status` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_transaction`
--

INSERT INTO `car_transaction` (`transaction_id`, `user_id`, `reg_no`, `issue_date`, `return_date`, `issue_status`) VALUES
(42, 1, 'AS02GH4554', '2022/02/23', '2022/02/26', 'processing');

--
-- Triggers `car_transaction`
--
DELIMITER $$
CREATE TRIGGER `book_car` AFTER UPDATE ON `car_transaction` FOR EACH ROW BEGIN 
 IF(NEW.issue_status!=OLD.issue_status AND 	   		NEW.issue_status = 'booked') THEN 
 UPDATE car SET status = 'booked' WHERE reg_no = NEW.reg_no; END IF; END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `process_car` AFTER INSERT ON `car_transaction` FOR EACH ROW BEGIN IF( NEW.issue_status = 'processing') THEN UPDATE car SET status = 'processing' WHERE reg_no = NEW.reg_no; END IF; END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `return_car` AFTER UPDATE ON `car_transaction` FOR EACH ROW BEGIN
  	IF(NEW.issue_status!=OLD.issue_status AND 	NEW.issue_status = 'returned') THEN
    	UPDATE car SET status = 'available' WHERE reg_no = NEW.reg_no;

	END IF;    
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `transaction_delete` AFTER DELETE ON `car_transaction` FOR EACH ROW UPDATE car SET status = 'available' WHERE reg_no = old.reg_no
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `phone`, `email`, `password`) VALUES
(1, 'kaushik', '', 'a', 'a'),
(2, 'ajd', '1111', 'ajd', 'ajd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`reg_no`);

--
-- Indexes for table `car_transaction`
--
ALTER TABLE `car_transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `reg_no` (`reg_no`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car_transaction`
--
ALTER TABLE `car_transaction`
  MODIFY `transaction_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
