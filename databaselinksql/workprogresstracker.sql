-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2023 at 03:25 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `workprogresstracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dep_id` int(11) NOT NULL,
  `dep_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dep_id`, `dep_name`) VALUES
(1, 'Front-End');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `eid` int(50) NOT NULL,
  `emp_name` varchar(50) NOT NULL,
  `emp_email` varchar(50) NOT NULL,
  `emp_lastname` varchar(50) NOT NULL,
  `emp_phone` varchar(50) DEFAULT NULL,
  `e_pw` varchar(50) NOT NULL,
  `em_img` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`eid`, `emp_name`, `emp_email`, `emp_lastname`, `emp_phone`, `e_pw`, `em_img`) VALUES
(71, 'sam', 'admin@admin.com', 'maharjan', 'admin123', '1', NULL),
(92, 'sam', 'admin@admin.com', 'maharjan', 'admin123', '', NULL),
(93, 'sam', 'admin@admin.com', 'maharjan', 'admin123', '', NULL),
(94, 'salina', 'salinamaharjan@gmail.com', '', NULL, '123', NULL),
(95, 'admin@admin.com', 'sita@gmail.com', '', NULL, 'admin123', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `email`) VALUES
(17, 'salina', '123', 'salinamaharjan@gmail.com'),
(28, 'admin@admin.com', 'admin123', 'sita@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `m_id` int(50) NOT NULL,
  `m_name` varchar(50) NOT NULL,
  `m_email` varchar(50) NOT NULL,
  `m_phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`m_id`, `m_name`, `m_email`, `m_phone`) VALUES
(1, 'sizen', 'sizen@gmail.com', '9843652356');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `per_id` int(11) NOT NULL,
  `per_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL,
  `task_title` varchar(50) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `task_description` varchar(200) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `m_id` int(11) DEFAULT NULL,
  `e_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`task_id`, `task_title`, `status`, `task_description`, `start_date`, `end_date`, `m_id`, `e_id`) VALUES
(15, 'Design', 'Pending', 'put css flexbox in div id sidebar', '2023-05-31', '2023-06-01', 1, NULL),
(16, 'qweqweq', 'On-hold', 'qweqwe', '2023-06-02', '2023-06-08', 1, NULL),
(18, 'css', 'Pending', 'qweqweqw', '2023-05-31', '2023-06-01', 1, NULL),
(19, 'eqwe', 'Pending', '', '2023-07-06', '2023-06-27', 1, NULL),
(20, 'qwe', 'Pending', 'qweqw', '2023-06-21', '2023-07-05', 1, NULL),
(21, 'qeqwe', 'Pending', 'qwe', '2023-06-01', '2023-06-01', 1, NULL),
(22, 'eqwe', 'On-hold', 'qweqw', '2023-06-01', '2023-06-01', 1, NULL),
(23, 'qweqw', 'Pending', 'weqwe', '2023-06-01', '2023-06-01', 1, NULL),
(24, 'ewqe', 'Pending', 'qweqwe', '2023-06-01', '2023-06-01', 1, NULL),
(25, 'ewqeqw', 'Pending', 'qweqwe', '2023-07-07', '2023-06-30', 1, NULL),
(26, 'qweqwe', 'On-hold', 'ewqeq', '2023-06-30', '2023-06-27', 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dep_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`eid`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`per_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`task_id`),
  ADD KEY `manager_id` (`m_id`),
  ADD KEY `employee_id` (`e_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dep_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `eid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `m_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `per_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `employee_id` FOREIGN KEY (`e_id`) REFERENCES `employee` (`eid`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `manager_id` FOREIGN KEY (`m_id`) REFERENCES `manager` (`m_id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
