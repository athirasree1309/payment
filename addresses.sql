-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2024 at 08:30 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ultras`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `userEmail`, `name`, `address`, `city`, `state`, `zip`, `created_at`) VALUES
(1, 'anu@gmail.com', 'ATHIRA G', 'sdbnfbmnfskjd', 'Haripad', 'Kerala', '690514', '2024-07-25 15:49:27'),
(2, 'anu@gmail.com', 'ATHIRA G', 'Fghdsghgfushf', 'Haripad', 'Kerala', '690514', '2024-07-25 15:55:26'),
(3, 'anu@gmail.com', 'ATHIRA G', 'werefrert', 'Haripad', 'Kerala', '690514', '2024-07-25 15:57:07'),
(4, 'anu@gmail.com', 'ATHIRA G', 'vjhbhjbhkjb', 'Haripad', 'Kerala', '690514', '2024-07-25 16:08:07'),
(5, 'anu@gmail.com', 'ATHIRA G', 'vjhbhjbhkjb', 'Haripad', 'Kerala', '690514', '2024-07-25 16:09:41'),
(6, 'anu@gmail.com', 'ATHIRA G', 'vjhbhjbhkjb', 'Haripad', 'Kerala', '690514', '2024-07-25 16:09:45'),
(7, 'anu@gmail.com', 'ATHIRA G', 'fbhjknkm;', 'Haripad', 'Kerala', '690514', '2024-07-25 16:09:58'),
(8, 'anu@gmail.com', 'ATHIRA G', 'asdfghjk.', 'Haripad', 'Kerala', '690514', '2024-07-25 16:17:09'),
(9, 'anu@gmail.com', 'ATHIRA G', 'asdfghjk.', 'Haripad', 'Kerala', '690514', '2024-07-25 16:18:11'),
(10, 'anu@gmail.com', 'ATHIRA G', 'vcbnmgdshhd', 'Haripad', 'Kerala', '690514', '2024-07-25 16:21:41'),
(11, 'anu@gmail.com', 'Ameer', 'ghjbknmkl', 'Haripad', 'Kerala', '690514', '2024-07-25 16:28:27'),
(12, 'anu@gmail.com', 'Arya', 'fvgbjnm,.jlk;', 'Haripad', 'Kerala', '690514', '2024-07-25 16:45:56'),
(13, 'anu@gmail.com', 'ATHIRA G', 'dcfgvhjkjll;\'', 'Haripad', 'Kerala', '690514', '2024-07-25 16:47:02'),
(14, 'anu@gmail.com', 'Sreelakshmi', 'Kochi', 'Kochi', 'Kerala', '690514', '2024-07-25 19:05:55'),
(15, 'anu@gmail.com', 'Sreelakshmi', 'Kochi', 'Kochi', 'Kerala', '690514', '2024-07-25 19:06:51'),
(16, 'anu@gmail.com', 'Sreelakshmi Sajeevan', 'Kochi', 'Kochi', 'Kerala', '690514', '2024-07-25 19:26:03'),
(17, 'anu@gmail.com', 'Sampp,e', 'mfn,md', 'mfk', ',mdf,m', '45736589', '2024-07-25 19:29:33'),
(18, 'anu@gmail.com', 'Sampp,e', 'mfn,md', 'mfk', ',mdf,m', '45736589', '2024-07-25 19:41:07'),
(19, 'anu@gmail.com', 'Sampp,e', 'mfn,md', 'mfk', ',mdf,m', '45736589', '2024-07-25 19:44:54'),
(20, 'anu@gmail.com', 'Sampp,e', 'mfn,md', 'mfk', ',mdf,m', '45736589', '2024-07-25 19:50:36'),
(21, 'arunkrishna@gmail.com', 'ATHIRA G', 'nill', 'Haripad', 'Kerala', '690514', '2024-07-26 03:29:29'),
(22, 'arunkrishna@gmail.com', 'ATHIRA G', 'nill', 'Haripad', 'Kerala', '690514', '2024-07-26 04:04:50'),
(23, 'arunkrishna@gmail.com', 'ATHIRA G', 'nill', 'Haripad', 'Kerala', '690514', '2024-07-26 04:09:32'),
(24, 'arunkrishna@gmail.com', 'ATHIRA G', 'nill', 'Haripad', 'Kerala', '690514', '2024-07-26 06:11:08'),
(25, 'arunkrishna@gmail.com', 'ATHIRA G', 'nill', 'Haripad', 'Kerala', '690514', '2024-07-26 06:11:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
