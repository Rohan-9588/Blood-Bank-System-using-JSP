-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 03, 2021 at 10:59 PM
-- Server version: 8.0.22
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arvi21_blood`
--

-- --------------------------------------------------------

--
-- Table structure for table `blood_request`
--

CREATE TABLE `blood_request` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `bgroup` varchar(100) NOT NULL,
  `mobile` varchar(200) NOT NULL,
  `location` varchar(200) NOT NULL,
  `hospital_id` int DEFAULT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blood_request`
--

INSERT INTO `blood_request` (`id`, `user_id`, `bgroup`, `mobile`, `location`, `hospital_id`, `status`) VALUES
(2, 1, 'AB+', '9762550099', '51as6das', 1, 1),
(3, 2, 'A+', '9096722806', 'arvi', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `camp`
--

CREATE TABLE `camp` (
  `id` int NOT NULL,
  `location_name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `hospital_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `camp`
--

INSERT INTO `camp` (`id`, `location_name`, `address`, `date`, `time`, `hospital_id`) VALUES
(2, 'asdas', 'Ravi nagar', '2020-02-20', '21:04:00', 1),
(3, 'Arvi', 'Sai nagar', '2020-03-18', '10:04:00', 3),
(4, '51as6das', 'Vrundavan nagar warud', '2020-02-26', '06:04:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `camp_donor`
--

CREATE TABLE `camp_donor` (
  `id` int NOT NULL,
  `camp_id` int NOT NULL,
  `user_id` int NOT NULL,
  `address` varchar(200) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `bgroup` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `camp_donor`
--

INSERT INTO `camp_donor` (`id`, `camp_id`, `user_id`, `address`, `mobile`, `bgroup`) VALUES
(4, 2, 1, 'asdasd', '641215121', 'AB+'),
(5, 2, 1, 'sd', '515121', 'AB+'),
(6, 3, 1, 'Arvi', '9096722806', 'AB-'),
(7, 2, 1, 'Vrundavan nagar warud', '9075319003', 'A+'),
(8, 4, 1, 'Warud, pusad', '9405945953', 'B+'),
(9, 4, 2, '101 shri sahnivas krishnarpan colony', '8855996970', 'AB+');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`id`, `name`, `address`, `mobile`, `email`, `password`, `photo`, `status`) VALUES
(1, 'Dhanashri Belsare', 'Vrundavan nagar warud', '9075319003', 'dhanashribelsare1801@gmail.com', '1234', 'tea.jpeg', 1),
(2, 'Anil Ambani', 'Ravi nagar', '9767734458', 'shubhangirajgure28@gmail.com', 'adas', NULL, 0),
(3, 'Anil Ambani', 'Ravi nagar', '9767734458', 'shubhangirajgure28@gmail.com', '1234', NULL, 1),
(4, 'Vishnu Onkar', 'Akola', '9096722806', 'akgbahadarpure@gmail.com', '123456', NULL, 0),
(6, 'Akshay bahadarpure', 'Amravati', '9096722806', 'akgbahadarpure@gmail.com', '1234', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `mobile` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(200) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `bgroup` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `mobile`, `address`, `dob`, `email`, `gender`, `bgroup`, `password`, `photo`, `status`) VALUES
(1, 'Chunnu Meheta', '9096722806', 'House No 1,  Gopal nagar', '2020-02-15', 'shubhammohod22@gmail.com', 'on', 'B+', 'Agb@9096', 'grocer.jpg', 1),
(2, 'Nikhil Bahaddarpure', '9762550099', 'gopal nagar', '2020-02-29', 'nikhilbahaddarpure@gmail.com', 'on', 'AB-', 'asdf', NULL, 1),
(3, 'Raghav Rathi', '8855996970', '101 shri sahnivas krishnarpan colony', '2020-02-20', 'raghavrathi8855@gmail.com', 'on', 'A+', '123', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_queries`
--

CREATE TABLE `user_queries` (
  `id` int NOT NULL,
  `query` varchar(300) NOT NULL,
  `answer` text,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_queries`
--

INSERT INTO `user_queries` (`id`, `query`, `answer`, `user_id`) VALUES
(1, 'asdas', 'asdasd asdasdasdas asd a sdas dasd', 1),
(2, 'What is my blood color?', 'yellow', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blood_request`
--
ALTER TABLE `blood_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `camp`
--
ALTER TABLE `camp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `camp_donor`
--
ALTER TABLE `camp_donor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_queries`
--
ALTER TABLE `user_queries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blood_request`
--
ALTER TABLE `blood_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `camp`
--
ALTER TABLE `camp`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `camp_donor`
--
ALTER TABLE `camp_donor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_queries`
--
ALTER TABLE `user_queries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
