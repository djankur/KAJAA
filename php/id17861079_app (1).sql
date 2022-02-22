-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 22, 2022 at 04:07 PM
-- Server version: 10.5.12-MariaDB
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id17861079_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(100) NOT NULL,
  `car_name` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `reg_no` varchar(255) NOT NULL,
  `price` varchar(11) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'available',
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `car_name`, `company`, `reg_no`, `price`, `status`, `photo`) VALUES
(1, 'XYZ 123', 'Ford', '111', '1500', 'available', 'uploads/test.png'),
(2, 'ABC 200', 'Lambo', '222', '2000', 'available', 'null'),
(3, 'PQR 100', 'TATA', '333', '1000', 'available', 'null'),
(4, 'FGH 500', 'TATA', '444', '1600', 'available', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `car_transaction`
--

CREATE TABLE `car_transaction` (
  `transaction_id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `reg_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `issue_date` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `return_date` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `issue_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `car_transaction`
--

INSERT INTO `car_transaction` (`transaction_id`, `user_id`, `reg_no`, `issue_date`, `return_date`, `issue_status`) VALUES
(1, 12, '111', '2022-02-25 00:00:00.000', '2022-02-26 00:00:00.000', 'processing'),
(2, 12, '111', '2022-02-25 00:00:00.000', '2022-02-26 00:00:00.000', 'processing'),
(3, 12, '111', '2022-02-25 00:00:00.000', '2022-02-26 00:00:00.000', 'processing'),
(4, 12, '111', '2022-02-25 00:00:00.000', '2022-02-26 00:00:00.000', 'processing'),
(5, 12, '111', '2022-02-25 00:00:00.000', '2022-02-26 00:00:00.000', 'processing'),
(6, 10, '111', '2022-02-23 00:00:00.000', '2022-02-25 00:00:00.000', 'processing'),
(7, 10, '111', '2022-02-23 00:00:00.000', '2022-02-24 00:00:00.000', 'processing'),
(8, 10, '111', '2022-02-23 00:00:00.000', '2022-02-24 00:00:00.000', 'processing'),
(9, 12, '222', '2022-02-24 00:00:00.000', '2022-02-25 00:00:00.000', 'processing'),
(10, 10, '111', '2022-02-22 00:00:00.000', '2022-02-24 00:00:00.000', 'processing'),
(11, 10, '111', '2022-02-23 00:00:00.000', '2022-02-25 00:00:00.000', 'processing'),
(12, 10, '444', '2022-12-21 00:00:00.000', '2022-12-24 00:00:00.000', 'processing'),
(13, 10, '111', '2022-02-25 00:00:00.000', '2022-02-26 00:00:00.000', 'processing'),
(14, 10, '111', '2022-02-25 00:00:00.000', '2022-02-26 00:00:00.000', 'processing');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `email`, `password`, `photo`) VALUES
(1, 'test name', 'test@test.test', 'test', ''),
(9, 'a', 'a', 'a', ''),
(10, 'aaaa', 'aa', 'aa', ''),
(11, 'an', 'an', 'an', ''),
(12, 'kkk', 'kk', 'kk', ''),
(13, 'a', 'b', 'c', ''),
(14, 'z', 'y', 'z', ''),
(15, 'Jumi Kalita', 'jk', 'jk', ''),
(16, 'qqww', 'qq', 'qq', 'uploads/6214db30b400b.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `car_transaction`
--
ALTER TABLE `car_transaction`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `car_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `car_transaction`
--
ALTER TABLE `car_transaction`
  MODIFY `transaction_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
