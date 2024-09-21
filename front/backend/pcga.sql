-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 13, 2023 at 11:48 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pcga`
--

-- --------------------------------------------------------

--
-- Table structure for table `age_distribution`
--

CREATE TABLE `age_distribution` (
  `id` int NOT NULL,
  `age_group` varchar(10) NOT NULL,
  `count` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `age_distribution`
--

INSERT INTO `age_distribution` (`id`, `age_group`, `count`, `created_at`) VALUES
(1, '18-25', 20, '2023-11-30 07:00:03'),
(2, '26-30', 15, '2023-11-30 07:00:03'),
(3, '31-35', 10, '2023-11-30 07:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE `alerts` (
  `id` int NOT NULL,
  `message` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `alerts`
--

INSERT INTO `alerts` (`id`, `message`, `is_active`, `created_at`) VALUES
(1, 'Alert 1', 1, '2023-11-30 07:00:03'),
(2, 'Alert 2', 0, '2023-11-30 07:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `date_time` datetime NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `title`, `description`, `date_time`, `user_id`) VALUES
(1, 'Doctor Appointment', 'Checkup with Dr. Smith', '2023-11-30 10:00:00', 123);

-- --------------------------------------------------------

--
-- Table structure for table `certification`
--

CREATE TABLE `certification` (
  `id` int NOT NULL,
  `signedAt` text,
  `date` date DEFAULT NULL,
  `leftThumbmark` text,
  `rightThumbmark` text,
  `witness1` text,
  `witness2` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fatherinlaw`
--

CREATE TABLE `fatherinlaw` (
  `id` int NOT NULL,
  `birthDetails` text,
  `address` text,
  `occupation` text,
  `employmentDetails` text,
  `education` text,
  `courses` text,
  `eligibility` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `foreigncountriesvisited`
--

CREATE TABLE `foreigncountriesvisited` (
  `id` int NOT NULL,
  `country` text,
  `purpose` text,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ima2009_page2`
--

CREATE TABLE `ima2009_page2` (
  `id` int NOT NULL,
  `lastName` text,
  `firstName` text,
  `middleInitial` text,
  `suffix` text,
  `telHome` text,
  `telBusiness` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interviews`
--

CREATE TABLE `interviews` (
  `id` int NOT NULL,
  `intervieweeName` varchar(255) DEFAULT NULL,
  `interviewDate` date DEFAULT NULL,
  `comments` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `interviews`
--

INSERT INTO `interviews` (`id`, `intervieweeName`, `interviewDate`, `comments`, `created_at`, `updated_at`) VALUES
(1, '11', '1111-11-11', '1111', '2023-12-13 15:05:58', '2023-12-13 15:05:58'),
(2, '1212', '2121-02-11', '121', '2023-12-13 23:31:12', '2023-12-13 23:31:12'),
(3, '1212', '2121-02-11', '121111', '2023-12-13 23:31:36', '2023-12-13 23:31:36');

-- --------------------------------------------------------

--
-- Table structure for table `ma2009_page3`
--

CREATE TABLE `ma2009_page3` (
  `id` int NOT NULL,
  `pangaka` text,
  `applicantSignature` text,
  `sponsorSignature` text,
  `applicantDate` date DEFAULT NULL,
  `sponsorDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ma2009_page4`
--

CREATE TABLE `ma2009_page4` (
  `id` int NOT NULL,
  `general` text,
  `sectionI` text,
  `sectionII` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maritalhistory`
--

CREATE TABLE `maritalhistory` (
  `id` int NOT NULL,
  `spouseName` text,
  `marriageDetails` text,
  `children` text,
  `residence` text,
  `citizenship` text,
  `fatherName` text,
  `occupation` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `name`, `email`, `created_at`) VALUES
(1, 'John Doe', 'john@example.com', '2023-11-30 07:00:03'),
(2, 'Jane Doe', 'jane@example.com', '2023-11-30 07:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `text` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `militaryhistory`
--

CREATE TABLE `militaryhistory` (
  `id` int NOT NULL,
  `dateEntered` date DEFAULT NULL,
  `sourceOfCommission` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `miscellaneous`
--

CREATE TABLE `miscellaneous` (
  `id` int NOT NULL,
  `address` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `neighbors`
--

CREATE TABLE `neighbors` (
  `id` int NOT NULL,
  `address` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `id` int NOT NULL,
  `membership` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pcgpa_application`
--

CREATE TABLE `pcgpa_application` (
  `id` int NOT NULL,
  `lastName` text,
  `firstName` text,
  `middleName` text,
  `suffix` text,
  `maritalStatus` text,
  `numChildren` int DEFAULT NULL,
  `sex` text,
  `height` text,
  `weight` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personalhistory`
--

CREATE TABLE `personalhistory` (
  `id` int NOT NULL,
  `name` text,
  `address` text,
  `age` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `physicalCondition` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Project A', 'Description A', '2023-11-30 07:00:03'),
(2, 'Project B', 'Description B', '2023-11-30 07:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `rcgaapplications`
--

CREATE TABLE `rcgaapplications` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `passport` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `occupation` varchar(255) NOT NULL,
  `club` varchar(255) NOT NULL,
  `applicationDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rcgaapplications`
--

INSERT INTO `rcgaapplications` (`id`, `name`, `nationality`, `dob`, `passport`, `address`, `telephone`, `email`, `occupation`, `club`, `applicationDate`) VALUES
(1, '1', '1', '2023-11-30', '1', '1', '1', '1', '1', '1', '2024-01-04'),
(2, '1', '1', '2023-11-30', '1', '1', '1', '1', '1', '1', '2024-01-04');

-- --------------------------------------------------------

--
-- Table structure for table `rcga_applications`
--

CREATE TABLE `rcga_applications` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nationality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dob` date NOT NULL,
  `passport` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `telephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `occupation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `club` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applicationDate` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rcga_applications`
--

INSERT INTO `rcga_applications` (`id`, `name`, `nationality`, `dob`, `passport`, `address`, `telephone`, `email`, `occupation`, `club`, `applicationDate`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'USA', '1990-01-01', 'AB123456', '123 Main St, City', '+1234567890', 'john.doe@example.com', 'Engineer', 'Tech Club', '2023-01-01', '2023-12-13 15:21:27', '2023-12-13 15:21:27'),
(2, 'Jane Smith', 'Canada', '1985-05-15', 'CD789012', '456 Oak St, Town', '+9876543210', 'jane.smith@example.com', 'Teacher', 'Education Club', '2023-02-15', '2023-12-13 15:21:27', '2023-12-13 15:21:27'),
(7, '', '', '0000-00-00', '', '', '', '', '', '', '0000-00-00', '2023-12-13 15:48:37', '2023-12-13 15:48:37'),
(8, '1212', '12121', '0001-02-21', '12121', '2121121', '21', '2121', '121', '211', '0111-02-12', '2023-12-13 15:48:55', '2023-12-13 15:48:55'),
(9, '1', '1', '0000-00-00', '11', '1', '1', '1', '1', '1', '0000-00-00', '2023-12-13 23:33:34', '2023-12-13 23:33:34'),
(10, '11', '11', '0011-11-11', '11', '11', '11', '11', '11', '111', '0000-00-00', '2023-12-13 23:36:40', '2023-12-13 23:36:40'),
(11, '11', '11', '2023-12-01', '1', '1', '1', '1', '11', '11', '2023-12-14', '2023-12-13 23:39:05', '2023-12-13 23:39:05');

-- --------------------------------------------------------

--
-- Table structure for table `residencehistory`
--

CREATE TABLE `residencehistory` (
  `id` int NOT NULL,
  `places` text,
  `dates` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `revenue`
--

CREATE TABLE `revenue` (
  `id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `revenue`
--

INSERT INTO `revenue` (`id`, `amount`, `created_at`) VALUES
(1, 50000.50, '2023-11-30 07:00:03'),
(2, 75000.75, '2023-11-30 07:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `token` text NOT NULL,
  `status` text NOT NULL,
  `role` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `token`, `status`, `role`, `created_at`) VALUES
(36, '121', '$2y$10$VMsgXD5Ya5F0EhoYnzbuHuo6rsqXLbYxAcx84g2HPXsh6pk3PAeZG', '24eLk8HAOEmdInTxq0WrFNtU9ZKp5Vb63zBgiCMysovucljwXa', 'active', 'user', '0000-00-00 00:00:00'),
(37, '12', '$2y$10$/Eg8XhLh..SxUVqUrtLHxuezfTqmHEDlcabN7aDxm8eYYfpPLLiXW', 'FJMwI7ROqvW1EudP5jiL4TkfrzVaXBhD0GU8KxtbmsCe63NS2Y', 'active', 'user', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `age_distribution`
--
ALTER TABLE `age_distribution`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `certification`
--
ALTER TABLE `certification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fatherinlaw`
--
ALTER TABLE `fatherinlaw`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foreigncountriesvisited`
--
ALTER TABLE `foreigncountriesvisited`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ima2009_page2`
--
ALTER TABLE `ima2009_page2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interviews`
--
ALTER TABLE `interviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ma2009_page3`
--
ALTER TABLE `ma2009_page3`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ma2009_page4`
--
ALTER TABLE `ma2009_page4`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maritalhistory`
--
ALTER TABLE `maritalhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `militaryhistory`
--
ALTER TABLE `militaryhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `miscellaneous`
--
ALTER TABLE `miscellaneous`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `neighbors`
--
ALTER TABLE `neighbors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pcgpa_application`
--
ALTER TABLE `pcgpa_application`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personalhistory`
--
ALTER TABLE `personalhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rcgaapplications`
--
ALTER TABLE `rcgaapplications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rcga_applications`
--
ALTER TABLE `rcga_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `residencehistory`
--
ALTER TABLE `residencehistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `revenue`
--
ALTER TABLE `revenue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `age_distribution`
--
ALTER TABLE `age_distribution`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `alerts`
--
ALTER TABLE `alerts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `interviews`
--
ALTER TABLE `interviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rcgaapplications`
--
ALTER TABLE `rcgaapplications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rcga_applications`
--
ALTER TABLE `rcga_applications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `revenue`
--
ALTER TABLE `revenue`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
