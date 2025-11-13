-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2025 at 06:52 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `users`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `usertype` varchar(55) NOT NULL,
  `email` varchar(55) NOT NULL,
  `password` varchar(55) NOT NULL,
  `barangay` varchar(55) NOT NULL,
  `file_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `usertype`, `email`, `password`, `barangay`, `file_path`) VALUES
(1, '', 'shou@gmail.com', '$2y$10$iwU.6taH17wjTPRv.nShQ..1AP2IZKVqGa.0iRvVKlMZhp.t', 'Barangay Sangandaan', 'uploads/Warframe0000.jpg'),
(2, '', 'kel@gmail.com', '$2y$10$I22mbRuD4LRyY66bAib3lelxXuqdsSlolarP9yN3Y.m7MuMU', 'Barangay Sangandaan', 'uploads/Warframe0000.jpg'),
(3, '', 'steve@gmail.com', 'mir4', 'Barangay Sangandaan', 'uploads/Warframe0000.jpg'),
(4, '', 'airam@gmail.com', 'ram', 'Barangay Sangandaan', 'uploads/Warframe0000.jpg'),
(5, '', 'shou123@gov.qc.ph', '123456', 'Barangay Sangandaan', 'uploads/Warframe0000.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `ticket_id` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `priority` varchar(55) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `requesttype` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `status` enum('PENDING','UNDER REVIEW','IN PROGRESS','READY','COMPLETED') DEFAULT 'PENDING',
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `ticket_id`, `user_id`, `fullname`, `priority`, `contact`, `requesttype`, `description`, `status`, `submitted_at`) VALUES
(10, 'BHR-2025-000001', 3, 'airam', '', '09167039130', 'ID', 'asdwadwasd', 'PENDING', '2025-11-13 13:12:35'),
(13, 'BHR-2025-000002', 3, 'jhamir', '', '09167039130', 'indigency', 'adwasdaw', 'PENDING', '2025-11-13 13:46:03');

-- --------------------------------------------------------

--
-- Table structure for table `request_updates`
--

CREATE TABLE `request_updates` (
  `id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `message` text DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT 'Admin',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket_id` (`ticket_id`);

--
-- Indexes for table `request_updates`
--
ALTER TABLE `request_updates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_request_id` (`request_id`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `request_updates`
--
ALTER TABLE `request_updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `request_updates`
--
ALTER TABLE `request_updates`
  ADD CONSTRAINT `request_updates_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
