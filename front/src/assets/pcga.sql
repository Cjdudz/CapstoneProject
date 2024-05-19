-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 12, 2024 at 04:31 PM
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
-- Table structure for table `additionaldata`
--

CREATE TABLE `additionaldata` (
  `ID` int NOT NULL,
  `ApplicantID` int DEFAULT NULL,
  `ProfessionalLicenses` varchar(255) DEFAULT NULL,
  `SpecialTraining` varchar(255) DEFAULT NULL,
  `SpecialInterestsOrSkills` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `additionaldata`
--

INSERT INTO `additionaldata` (`ID`, `ApplicantID`, `ProfessionalLicenses`, `SpecialTraining`, `SpecialInterestsOrSkills`) VALUES
(1, NULL, '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `applicationform`
--

CREATE TABLE `applicationform` (
  `id` int NOT NULL,
  `field1` varchar(255) DEFAULT NULL,
  `field2` varchar(255) DEFAULT NULL,
  `typeOfApplication` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `suffix` varchar(50) DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `otherNamesUsed` varchar(255) DEFAULT NULL,
  `homeAddress` varchar(255) DEFAULT NULL,
  `maritalStatus` enum('Single','Married','Separated','Widow/Widower') DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL,
  `schoolName` varchar(255) DEFAULT NULL,
  `degreesObtained` varchar(255) DEFAULT NULL,
  `inclusiveDates` varchar(255) DEFAULT NULL,
  `yearGraduated` varchar(50) DEFAULT NULL,
  `employmentStatus` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `natureOfOffice` varchar(255) DEFAULT NULL,
  `pastOrCurrentGovernmentPosition` varchar(255) DEFAULT NULL,
  `highestAppointmentOrElectedOffice` varchar(255) DEFAULT NULL,
  `professionalLicenses` varchar(255) DEFAULT NULL,
  `specialTraining` varchar(255) DEFAULT NULL,
  `specialInterestsOrSkills` varchar(255) DEFAULT NULL,
  `height` varchar(50) DEFAULT NULL,
  `weight` varchar(50) DEFAULT NULL,
  `colorOfEyes` varchar(50) DEFAULT NULL,
  `colorOfHair` varchar(50) DEFAULT NULL,
  `scarsOrMarks` varchar(255) DEFAULT NULL,
  `sssGsisNo` varchar(50) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `citizenship` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `bloodType` varchar(10) DEFAULT NULL,
  `telNoHome` varchar(20) DEFAULT NULL,
  `telNoBusiness` varchar(20) DEFAULT NULL,
  `mobilePhone` varchar(20) DEFAULT NULL,
  `email1` varchar(255) DEFAULT NULL,
  `email2` varchar(255) DEFAULT NULL,
  `faxNo` varchar(20) DEFAULT NULL,
  `acrNo` varchar(50) DEFAULT NULL,
  `passportNo` varchar(255) DEFAULT NULL,
  `typeOfVisa` varchar(255) DEFAULT NULL,
  `tinNo` varchar(50) DEFAULT NULL,
  `ecLastName` varchar(255) DEFAULT NULL,
  `ecFirstName` varchar(255) DEFAULT NULL,
  `ecMiddleInitial` varchar(10) DEFAULT NULL,
  `ecSuffix` varchar(50) DEFAULT NULL,
  `ecRelationship` varchar(255) DEFAULT NULL,
  `ecAddress` varchar(255) DEFAULT NULL,
  `ecTelNoHome` varchar(20) DEFAULT NULL,
  `ecTelNoBusiness` varchar(20) DEFAULT NULL,
  `ecMobilePhone` varchar(20) DEFAULT NULL,
  `functionsInvolved` varchar(255) DEFAULT NULL,
  `purpose` text,
  `willingToBeTrained` enum('Yes','No') DEFAULT NULL,
  `willingToTravel` enum('Yes','No') DEFAULT NULL,
  `available24Hrs` enum('Yes','No') DEFAULT NULL,
  `daysAdvanceNotice` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `placeDateOfMembership` varchar(255) DEFAULT NULL,
  `positionHeld` varchar(255) DEFAULT NULL,
  `nbiClearance` varchar(255) DEFAULT NULL,
  `policeClearance` varchar(255) DEFAULT NULL,
  `barangayClearance` varchar(255) DEFAULT NULL,
  `orientationSeminarCertificate` varchar(255) DEFAULT NULL,
  `convictionDetails` text,
  `sponsorName` varchar(255) DEFAULT NULL,
  `applicantName` varchar(255) DEFAULT NULL,
  `thumbprints` blob,
  `photo` varchar(255) DEFAULT NULL,
  `applicantStatus` enum('Accepted','Not Accepted') DEFAULT NULL,
  `reasonForNotAccepted` text,
  `instructions` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date1` date DEFAULT NULL,
  `date2` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `educationalbackground`
--

CREATE TABLE `educationalbackground` (
  `ID` int NOT NULL,
  `ApplicantID` int DEFAULT NULL,
  `College` varchar(100) DEFAULT NULL,
  `SchoolName` varchar(100) DEFAULT NULL,
  `DegreesObtained` varchar(100) DEFAULT NULL,
  `InclusiveDates` varchar(50) DEFAULT NULL,
  `YearGraduated` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `educationalbackground`
--

INSERT INTO `educationalbackground` (`ID`, `ApplicantID`, `College`, `SchoolName`, `DegreesObtained`, `InclusiveDates`, `YearGraduated`) VALUES
(1, NULL, '1', '1', '1', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `emergencycontactinformation`
--

CREATE TABLE `emergencycontactinformation` (
  `ID` int NOT NULL,
  `ApplicantID` int DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleInitial` varchar(1) DEFAULT NULL,
  `Suffix` varchar(10) DEFAULT NULL,
  `Relationship` varchar(50) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `TelNoHome` varchar(20) DEFAULT NULL,
  `TelNoBusiness` varchar(20) DEFAULT NULL,
  `MobilePhone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `emergencycontactinformation`
--

INSERT INTO `emergencycontactinformation` (`ID`, `ApplicantID`, `LastName`, `FirstName`, `MiddleInitial`, `Suffix`, `Relationship`, `Address`, `TelNoHome`, `TelNoBusiness`, `MobilePhone`) VALUES
(1, NULL, '111', '1111', '1', '11', '1', '1', '11', '111', '111');

-- --------------------------------------------------------

--
-- Table structure for table `employmentoccupationalbackground`
--

CREATE TABLE `employmentoccupationalbackground` (
  `ID` int NOT NULL,
  `ApplicantID` int DEFAULT NULL,
  `EmploymentStatus` varchar(50) DEFAULT NULL,
  `Company` varchar(100) DEFAULT NULL,
  `NatureOfOffice` varchar(100) DEFAULT NULL,
  `PastOrCurrentGovernmentPosition` varchar(100) DEFAULT NULL,
  `HighestAppointmentOrElectedOffice` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employmentoccupationalbackground`
--

INSERT INTO `employmentoccupationalbackground` (`ID`, `ApplicantID`, `EmploymentStatus`, `Company`, `NatureOfOffice`, `PastOrCurrentGovernmentPosition`, `HighestAppointmentOrElectedOffice`) VALUES
(1, NULL, NULL, '1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `formdata`
--

CREATE TABLE `formdata` (
  `id` int NOT NULL,
  `idNo` varchar(50) NOT NULL,
  `auxiliaryDistrict` varchar(100) NOT NULL,
  `squadronNo` varchar(50) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `middleName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `maidenLastName` varchar(100) DEFAULT NULL,
  `rankDesignationAuthority` varchar(100) NOT NULL,
  `homeAddress` varchar(255) NOT NULL,
  `maritalStatus` varchar(50) NOT NULL,
  `weight` decimal(5,2) NOT NULL,
  `eyes` varchar(50) NOT NULL,
  `height` decimal(5,2) NOT NULL,
  `hair` varchar(50) NOT NULL,
  `bloodType` varchar(10) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `religion` varchar(50) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `identifyingData` varchar(255) NOT NULL,
  `emergencyContact` varchar(255) NOT NULL,
  `emergencyContactAddress` varchar(255) NOT NULL,
  `emergencyContactNumber` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `formdata`
--

INSERT INTO `formdata` (`id`, `idNo`, `auxiliaryDistrict`, `squadronNo`, `firstName`, `middleName`, `lastName`, `maidenLastName`, `rankDesignationAuthority`, `homeAddress`, `maritalStatus`, `weight`, `eyes`, `height`, `hair`, `bloodType`, `sex`, `religion`, `dateOfBirth`, `identifyingData`, `emergencyContact`, `emergencyContactAddress`, `emergencyContactNumber`, `created_at`, `updated_at`) VALUES
(1, '1', '1', '1', '11', '1', '1', '', '1', '1', 'Widowed', 1.00, '1', 1.00, '1', '1', 'Male', '1', '2003-11-11', '1', '1', '1', '1', '2024-04-06 22:24:49', '2024-04-06 22:24:49'),
(2, '1', '1', '1', '11', '1', '1', '', '1', '1', 'Widowed', 1.00, '1', 1.00, '1', '1', 'Male', '1', '2003-11-11', '1', '1', '1', '1', '2024-04-06 22:25:44', '2024-04-06 22:25:44'),
(3, '1222', '2', '2', '2', '2', '2', '', '2', '2', 'Widowed', 2.00, '22', 2.00, '2', '2', 'Male', '2', '1111-11-11', '2', '2', '2', '2', '2024-04-07 18:13:39', '2024-04-07 18:13:39'),
(4, '1', '1', '1', '1', '1', '1', '', '1', '1', '', 0.00, '', 0.00, '', '', '', '', '0000-00-00', '', '', '', '', '2024-05-09 22:38:43', '2024-05-09 22:38:43'),
(5, '1', '1', '1', '1', '1', '1', '', '1', '1', '', 0.00, '', 0.00, '', '', '', '', '0000-00-00', '', '', '', '', '2024-05-11 06:08:53', '2024-05-11 06:08:53'),
(6, '1', '1', '11', '1', '1', '1', '', '1', '1', '', 0.00, '', 0.00, '', '', '', '', '0000-00-00', '', '', '', '', '2024-05-11 06:12:41', '2024-05-11 06:12:41');

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
(3, '1212', '2121-02-11', '121111', '2023-12-13 23:31:36', '2023-12-13 23:31:36'),
(4, '1', '0000-00-00', '1', '2023-12-27 17:29:45', '2023-12-27 17:29:45'),
(5, '1', '0000-00-00', '1', '2023-12-27 17:29:46', '2023-12-27 17:29:46'),
(6, '1', '0000-00-00', '1', '2023-12-27 17:29:46', '2023-12-27 17:29:46'),
(7, '1', '0000-00-00', '1', '2023-12-27 17:29:50', '2023-12-27 17:29:50'),
(8, '1', '0000-00-00', '1', '2023-12-27 17:29:50', '2023-12-27 17:29:50'),
(9, '1', '0000-00-00', '1', '2023-12-27 17:29:50', '2023-12-27 17:29:50'),
(10, 'asd', '0011-11-11', 'aaa', '2024-04-07 07:00:15', '2024-04-07 07:00:15'),
(11, 'asd', '0011-11-11', 'aaa', '2024-04-07 07:00:24', '2024-04-07 07:00:24'),
(12, 'Badeth', '0000-00-00', 'adlskala', '2024-04-08 02:14:55', '2024-04-08 02:14:55'),
(13, 'Badeth', '0000-00-00', 'adlskala', '2024-04-08 02:15:02', '2024-04-08 02:15:02');

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
-- Table structure for table `membershipapplication`
--

CREATE TABLE `membershipapplication` (
  `name` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `passport` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `club` varchar(255) DEFAULT NULL,
  `applicationDate` date DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `suffix` varchar(10) DEFAULT NULL,
  `maritalStatus` varchar(50) DEFAULT NULL,
  `numChildren` int DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `page2LastName` varchar(255) DEFAULT NULL,
  `page2FirstName` varchar(255) DEFAULT NULL,
  `middleInitial` char(1) DEFAULT NULL,
  `page2Suffix` varchar(10) DEFAULT NULL,
  `telHome` varchar(20) DEFAULT NULL,
  `telBusiness` varchar(20) DEFAULT NULL,
  `page3LastName` varchar(255) DEFAULT NULL,
  `page3FirstName` varchar(255) DEFAULT NULL,
  `page3MiddleInitial` char(1) DEFAULT NULL,
  `page3Suffix` varchar(10) DEFAULT NULL,
  `page3TelHome` varchar(20) DEFAULT NULL,
  `page3TelBusiness` varchar(20) DEFAULT NULL,
  `page4LastName` varchar(255) DEFAULT NULL,
  `page4FirstName` varchar(255) DEFAULT NULL,
  `page4MiddleInitial` char(1) DEFAULT NULL,
  `page4Suffix` varchar(10) DEFAULT NULL,
  `page4TelHome` varchar(20) DEFAULT NULL,
  `page4TelBusiness` varchar(20) DEFAULT NULL,
  `personalHistoryName` varchar(255) DEFAULT NULL,
  `personalHistoryAddress` varchar(255) DEFAULT NULL,
  `personalHistoryAge` int DEFAULT NULL,
  `personalHistoryHeight` decimal(5,2) DEFAULT NULL,
  `personalHistoryWeight` decimal(5,2) DEFAULT NULL,
  `physicalCondition` varchar(255) DEFAULT NULL,
  `spouseName` varchar(255) DEFAULT NULL,
  `marriageDetails` varchar(255) DEFAULT NULL,
  `children` varchar(255) DEFAULT NULL,
  `residence` varchar(255) DEFAULT NULL,
  `citizenship` varchar(255) DEFAULT NULL,
  `fatherInLawBirth` date DEFAULT NULL,
  `fatherInLawAddress` varchar(255) DEFAULT NULL,
  `fatherInLawOccupation` varchar(255) DEFAULT NULL,
  `fatherInLawEmployment` varchar(255) DEFAULT NULL,
  `fatherInLawEducation` varchar(255) DEFAULT NULL,
  `fatherInLawCourses` varchar(255) DEFAULT NULL,
  `fatherInLawEligibility` varchar(255) DEFAULT NULL,
  `militaryHistoryDateEntered` date DEFAULT NULL,
  `militaryHistorySourceOfCommission` varchar(255) DEFAULT NULL,
  `visit1Country` varchar(255) DEFAULT NULL,
  `visit1Purpose` varchar(255) DEFAULT NULL,
  `visit1Date` date DEFAULT NULL,
  `visit2Country` varchar(255) DEFAULT NULL,
  `visit2Purpose` varchar(255) DEFAULT NULL,
  `visit2Date` date DEFAULT NULL,
  `visit3Country` varchar(255) DEFAULT NULL,
  `visit3Purpose` varchar(255) DEFAULT NULL,
  `visit3Date` date DEFAULT NULL,
  `neighborAddress` varchar(255) DEFAULT NULL,
  `organizationMembership` varchar(255) DEFAULT NULL,
  `miscellaneousAddress` varchar(255) DEFAULT NULL,
  `languageWrite` varchar(255) DEFAULT NULL,
  `certificationSignedAt` varchar(255) DEFAULT NULL,
  `certificationDate` date DEFAULT NULL,
  `certificationLeftThumbmark` blob,
  `certificationRightThumbmark` blob,
  `certificationWitness1` varchar(255) DEFAULT NULL,
  `certificationWitness2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `membershipapplication`
--

INSERT INTO `membershipapplication` (`name`, `nationality`, `dob`, `passport`, `address`, `telephone`, `email`, `occupation`, `club`, `applicationDate`, `lastName`, `firstName`, `middleName`, `suffix`, `maritalStatus`, `numChildren`, `sex`, `height`, `weight`, `page2LastName`, `page2FirstName`, `middleInitial`, `page2Suffix`, `telHome`, `telBusiness`, `page3LastName`, `page3FirstName`, `page3MiddleInitial`, `page3Suffix`, `page3TelHome`, `page3TelBusiness`, `page4LastName`, `page4FirstName`, `page4MiddleInitial`, `page4Suffix`, `page4TelHome`, `page4TelBusiness`, `personalHistoryName`, `personalHistoryAddress`, `personalHistoryAge`, `personalHistoryHeight`, `personalHistoryWeight`, `physicalCondition`, `spouseName`, `marriageDetails`, `children`, `residence`, `citizenship`, `fatherInLawBirth`, `fatherInLawAddress`, `fatherInLawOccupation`, `fatherInLawEmployment`, `fatherInLawEducation`, `fatherInLawCourses`, `fatherInLawEligibility`, `militaryHistoryDateEntered`, `militaryHistorySourceOfCommission`, `visit1Country`, `visit1Purpose`, `visit1Date`, `visit2Country`, `visit2Purpose`, `visit2Date`, `visit3Country`, `visit3Purpose`, `visit3Date`, `neighborAddress`, `organizationMembership`, `miscellaneousAddress`, `languageWrite`, `certificationSignedAt`, `certificationDate`, `certificationLeftThumbmark`, `certificationRightThumbmark`, `certificationWitness1`, `certificationWitness2`) VALUES
('1', '1', '0111-11-11', '11', '11', '11', '11', '11', '11', '2024-04-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('1', '1', '0000-00-00', '1', '1', '1', '1', '1', '1', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `created_at`) VALUES
(9, 'West Philippine Sea Update', 'Amidst escalating tensions, a surprising turn of events unfolds in the West Philippine Sea as marine biologists discover a new species of coral thriving in disputed waters. This unexpected find, named Acropora pacifica, not only adds to the region\'s biodiversity but also sparks renewed calls for collaborative conservation efforts. Scientists believe that studying this resilient coral could offer valuable insights into climate change adaptation strategies for vulnerable ecosystems. While geopolitical disputes persist, this discovery serves as a reminder of the urgent need for environmental stewardship in this ecologically rich and contested maritime territory.', '2024-04-21 06:56:36'),
(12, 'Weather Update', 'The Philippines may see up to two tropical cyclones develop or enter its area of responsibility this May, the state weather bureau said on Wednesday as unusually hot weather continues to grip the country.\n\n“One or two cyclones are possible to form or enter the Philippine Area of Responsibility this month,” PAGASA weather specialist Rhea Torres said. \n\nThe weather agency forecasts two possible cyclone tracks. One possible typhoon track could see a storm approach the Philippine landmass before moving away.\n\nIf a cyclone is formed in the eastern section of Mindanao, it may traverse Eastern Visayas, Bicol region, MIMAROPA, and CALABARZON before exiting into the West Philippine Sea, and recurve away from the land. \n\nTorres, however, noted that there are no cyclones expected to affect the Philippines until next week. ', '2024-05-09 01:50:54');

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
-- Table structure for table `personal`
--

CREATE TABLE `personal` (
  `id` int NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `rank` varchar(255) DEFAULT NULL,
  `pcgsn` varchar(255) DEFAULT NULL,
  `branch_of_service` varchar(255) DEFAULT NULL,
  `job_assignment` varchar(255) DEFAULT NULL,
  `business_address` text,
  `home_address` text,
  `birth_date` date DEFAULT NULL,
  `place_of_birth` varchar(255) DEFAULT NULL,
  `change_in_name` text,
  `nicknames` text,
  `nationality` varchar(255) DEFAULT NULL,
  `tin` varchar(255) DEFAULT NULL,
  `national_registration_card` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `blood_type` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `build` varchar(255) DEFAULT NULL,
  `complexion` varchar(255) DEFAULT NULL,
  `eye_color` varchar(255) DEFAULT NULL,
  `hair_color` varchar(255) DEFAULT NULL,
  `scars` text,
  `marital_status` varchar(255) DEFAULT NULL,
  `spouse_name` varchar(255) DEFAULT NULL,
  `date_of_marriage` date DEFAULT NULL,
  `spouse_occupation` varchar(255) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `father_dob` date DEFAULT NULL,
  `father_address` text,
  `father_occupation` varchar(255) DEFAULT NULL,
  `father_citizenship` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `mother_dob` date DEFAULT NULL,
  `mother_address` text,
  `mother_occupation` varchar(255) DEFAULT NULL,
  `mother_citizenship` varchar(255) DEFAULT NULL,
  `siblings` text,
  `step_parent` varchar(255) DEFAULT NULL,
  `step_parent_address` text,
  `step_parent_occupation` varchar(255) DEFAULT NULL,
  `step_parent_citizenship` varchar(255) DEFAULT NULL,
  `elementary` varchar(255) DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL,
  `post_graduate` varchar(255) DEFAULT NULL,
  `other_schools` text,
  `civil_service_eligibility` varchar(255) DEFAULT NULL,
  `enlistment_date` date DEFAULT NULL,
  `commission_date` date DEFAULT NULL,
  `source_of_commission` varchar(255) DEFAULT NULL,
  `important_unit_assignment` text,
  `military_schools` text,
  `decorations_and_awards` text,
  `residence_history` text,
  `employment_history` text,
  `dismissal_or_resignation` text,
  `foreign_countries_visited` text,
  `salary_dependency` text,
  `bank_accounts` text,
  `assets_and_liabilities_statement` text,
  `income_tax_return_filed` text,
  `credit_references` text,
  `arrest_record` text,
  `family_arrest_record` text,
  `administrative_case` text,
  `pd1081_detention` text,
  `intoxicants_usage` text,
  `character_references` text,
  `neighbors` text,
  `organizations` text,
  `hobbies` text,
  `language_dialect` text,
  `lie_detection_test` text
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
-- Table structure for table `personalinformation`
--

CREATE TABLE `personalinformation` (
  `ID` int NOT NULL,
  `TypeOfApplication` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `Suffix` varchar(10) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `OtherNamesUsed` varchar(255) DEFAULT NULL,
  `HomeAddress` varchar(255) DEFAULT NULL,
  `MaritalStatus` varchar(20) DEFAULT NULL,
  `SpouseName` varchar(100) DEFAULT NULL,
  `NumberOfChildren` int DEFAULT NULL,
  `Height` decimal(5,2) DEFAULT NULL,
  `Weight` decimal(5,2) DEFAULT NULL,
  `ColorOfEyes` varchar(50) DEFAULT NULL,
  `ColorOfHair` varchar(50) DEFAULT NULL,
  `ScarsOrMarks` varchar(255) DEFAULT NULL,
  `SSSorGSISNo` varchar(20) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `PlaceOfBirth` varchar(100) DEFAULT NULL,
  `Citizenship` varchar(50) DEFAULT NULL,
  `Religion` varchar(50) DEFAULT NULL,
  `BloodType` varchar(10) DEFAULT NULL,
  `TelNoHome` varchar(20) DEFAULT NULL,
  `TelNoBusiness` varchar(20) DEFAULT NULL,
  `MobilePhone` varchar(20) DEFAULT NULL,
  `Email1` varchar(100) DEFAULT NULL,
  `Email2` varchar(100) DEFAULT NULL,
  `FaxNo` varchar(20) DEFAULT NULL,
  `ACRNo` varchar(20) DEFAULT NULL,
  `PassportNo` varchar(20) DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  `TypeOfVisa` varchar(50) DEFAULT NULL,
  `TINNo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `personalinformation`
--

INSERT INTO `personalinformation` (`ID`, `TypeOfApplication`, `LastName`, `FirstName`, `MiddleName`, `Suffix`, `Gender`, `OtherNamesUsed`, `HomeAddress`, `MaritalStatus`, `SpouseName`, `NumberOfChildren`, `Height`, `Weight`, `ColorOfEyes`, `ColorOfHair`, `ScarsOrMarks`, `SSSorGSISNo`, `DateOfBirth`, `PlaceOfBirth`, `Citizenship`, `Religion`, `BloodType`, `TelNoHome`, `TelNoBusiness`, `MobilePhone`, `Email1`, `Email2`, `FaxNo`, `ACRNo`, `PassportNo`, `ExpiryDate`, `TypeOfVisa`, `TINNo`) VALUES
(1, '', '', '', '', '', '', '', '', '', '', NULL, 0.00, 0.00, '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '', ''),
(2, '2', '3', '45', '5', '1', 'Female', '1', '1', 'Widow/Widower', '1', 1, 1.00, 1.00, '1', '1', '1', '1', '2024-05-10', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0000-00-00', '1', '1');

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
  `applicationDate` date NOT NULL,
  `age` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rcgaapplications`
--

INSERT INTO `rcgaapplications` (`id`, `name`, `nationality`, `dob`, `passport`, `address`, `telephone`, `email`, `occupation`, `club`, `applicationDate`, `age`) VALUES
(1, '1', '1', '2023-11-30', '1', '1', '1', '1', '1', '1', '2024-01-04', 0),
(2, '1', '1', '2023-11-30', '1', '1', '1', '1', '1', '1', '2024-01-04', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rcga_applications`
--

CREATE TABLE `rcga_applications` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age` int NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rcga_applications`
--

INSERT INTO `rcga_applications` (`id`, `name`, `age`, `nationality`, `dob`, `passport`, `address`, `telephone`, `email`, `occupation`, `club`, `applicationDate`, `created_at`, `updated_at`, `status`) VALUES
(1, 'John Doe', 0, 'USA', '1990-01-01', 'AB123456', '123 Main St, City', '+1234567890', 'john.doe@example.com', 'Engineer', 'Tech Club', '2023-01-01', '2023-12-13 15:21:27', '2024-04-20 17:25:59', 'accepted'),
(2, 'Jane Smith', 0, 'Canada', '1985-05-15', 'CD789012', '456 Oak St, Town', '+9876543210', 'jane.smith@example.com', 'Teacher', 'Education Club', '2023-02-15', '2023-12-13 15:21:27', '2024-02-28 12:30:15', 'accepted'),
(7, '', 0, '', '0000-00-00', '', '', '', '', '', '', '0000-00-00', '2023-12-13 15:48:37', '2024-02-28 12:48:49', 'rejected'),
(8, '1212', 0, '12121', '0001-02-21', '12121', '2121121', '21', '2121', '121', '211', '0111-02-12', '2023-12-13 15:48:55', '2024-02-28 12:48:38', 'accepted'),
(9, '1', 0, '1', '0000-00-00', '11', '1', '1', '1', '1', '1', '0000-00-00', '2023-12-13 23:33:34', '2024-02-28 12:56:04', 'rejected'),
(10, '11', 0, '11', '0011-11-11', '11', '11', '11', '11', '11', '111', '0000-00-00', '2023-12-13 23:36:40', '2023-12-27 17:37:18', 'accepted'),
(11, '11', 0, '11', '2023-12-01', '1', '1', '1', '1', '11', '11', '2023-12-14', '2023-12-13 23:39:05', '2023-12-27 17:37:18', 'accepted'),
(12, '', 0, '', '0000-00-00', '', '', '', '', '', '', '0000-00-00', '2023-12-14 02:37:11', '2024-02-28 12:56:08', 'accepted'),
(13, '', 0, '', '0000-00-00', '', '', '', '', '', '', '0000-00-00', '2023-12-27 17:33:30', '2023-12-27 17:37:16', 'accepted'),
(14, '', 0, '', '0000-00-00', '', '', '', '', '', '', '0000-00-00', '2023-12-27 17:34:19', '2023-12-27 17:37:15', 'accepted'),
(15, '', 0, '', '0000-00-00', '', '', '', '', '', '', '0000-00-00', '2023-12-27 17:35:54', '2023-12-27 17:37:11', 'accepted'),
(16, '', 0, '', '0000-00-00', '', '', '', '', '', '', '0000-00-00', '2023-12-27 17:56:34', '2023-12-27 17:56:34', ''),
(17, '1', 0, '', '0000-00-00', '', '', '', '', '', '', '0000-00-00', '2023-12-27 17:56:39', '2023-12-27 17:56:39', ''),
(18, '1', 0, '', '0000-00-00', '', '', '', '', '', '', '0000-00-00', '2023-12-27 17:56:44', '2023-12-27 17:56:44', ''),
(19, '111', 0, '1', '0000-00-00', '1', '1', '1', '', '', '', '0000-00-00', '2023-12-27 17:56:53', '2024-04-21 06:36:10', 'accepted'),
(20, '', 0, '', '0000-00-00', '', '', '', '', '', '', '0000-00-00', '2024-02-28 12:47:31', '2024-02-28 12:47:31', ''),
(21, '', 0, '', '0000-00-00', '', '', '', '', '', '', '0000-00-00', '2024-02-28 13:03:17', '2024-02-28 13:03:17', ''),
(22, '', 0, '', '0000-00-00', '', '', '', '', '', '', '0000-00-00', '2024-02-28 13:09:01', '2024-02-28 13:09:01', ''),
(23, '1', 1, '1', '0000-00-00', '1', '1', '1', '1', '1', '11', '0001-11-11', '2024-04-20 17:25:11', '2024-04-20 17:25:11', '');

-- --------------------------------------------------------

--
-- Table structure for table `readiness_input`
--

CREATE TABLE `readiness_input` (
  `id` int NOT NULL,
  `functions_involved` varchar(255) DEFAULT NULL,
  `purpose` text,
  `willing_to_be_trained` text,
  `willing_to_travel` text,
  `available_24hrs` text,
  `days_advance_notice` int DEFAULT NULL,
  `applicant_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `readiness_input`
--

INSERT INTO `readiness_input` (`id`, `functions_involved`, `purpose`, `willing_to_be_trained`, `willing_to_travel`, `available_24hrs`, `days_advance_notice`, `applicant_id`, `created_at`, `updated_at`) VALUES
(1, NULL, '1', NULL, NULL, NULL, NULL, NULL, '2024-05-11 07:49:52', '2024-05-11 07:49:52'),
(2, NULL, '1', NULL, NULL, NULL, NULL, NULL, '2024-05-11 07:52:03', '2024-05-11 07:52:03'),
(3, '1', 'sa', '0', '0', '0', 0, NULL, '2024-05-11 07:54:37', '2024-05-11 07:54:37'),
(4, '', '', '0', '0', '0', 0, NULL, '2024-05-11 07:59:49', '2024-05-11 07:59:49'),
(5, '1', '1', '0', '0', '0', 0, NULL, '2024-05-11 08:02:21', '2024-05-11 08:02:21'),
(6, '', '', '0', '0', '0', 0, NULL, '2024-05-11 08:02:58', '2024-05-11 08:02:58'),
(7, '', '', '0', '0', '0', 0, NULL, '2024-05-11 08:03:14', '2024-05-11 08:03:14'),
(8, '1', '1', '0', '0', '0', 0, NULL, '2024-05-11 08:04:42', '2024-05-11 08:04:42'),
(9, '', '', '', 'Yes', 'Yes', 0, NULL, '2024-05-11 08:06:14', '2024-05-11 08:06:14'),
(10, '1', '1', 'Yes', 'Yes', 'Yes', 0, NULL, '2024-05-11 08:06:31', '2024-05-11 08:06:31');

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(37, '12', '$2y$10$/Eg8XhLh..SxUVqUrtLHxuezfTqmHEDlcabN7aDxm8eYYfpPLLiXW', 'FJMwI7ROqvW1EudP5jiL4TkfrzVaXBhD0GU8KxtbmsCe63NS2Y', 'active', 'user', '0000-00-00 00:00:00'),
(38, '11', '$2y$10$aPYxPkpR6.C8XFWScakT3uKRU5ZEtkoyZykcEBIQDbF7KTIu70Zry', 'EzRAsT3UZXaPC8eS1oQjgLuNIlcWbV9hrpOxGwq5vki60mfB7d', 'active', 'admin', '0000-00-00 00:00:00'),
(39, '12', '$2y$10$g/Jk9xzqjWEmgMAkhGalKeQq3FWFTsp7Cd.sqlPj.xRcl25wnLWr6', 'OMyhSNqoXfck4uirBRAYed1lbpjHWvaxVKtn09JsEm7D5UzT8P', 'active', 'admin', '0000-00-00 00:00:00'),
(40, '12', '$2y$10$ZOzLw6HGIfZUPUqhe65.B.vSqzs/bwojRdgVU0SP0W9.FUBNwmbPW', 'b0arTvzeRIY9MKDpXCAxGS3yN4Z6Fo27nVLlEPiOwHBUf8sWcu', 'active', '', '0000-00-00 00:00:00'),
(41, '1', '$2y$10$IceU6/vlmg/s5jQou6RfjO9wX9V3eOO5JY/De1OQMau8bYu/gCIr2', 'hxdlUNuTnQseB0jaWbkfV2IAERzMOorCK4H7vLypcmJgFY8tS9', 'active', '', '0000-00-00 00:00:00'),
(42, '1', '$2y$10$sYLgqvv3udtvA5GWnqBdWeFx6UXzjiedtuNkXCc4NDm0oRmIYAPQW', 'O5hRyurUg9EDHslXBxPkWoat6jAQ84iJFCKnLfMe1wZ3Tp7Gbc', 'active', '', '0000-00-00 00:00:00'),
(43, '1', '$2y$10$oaPCGmBUvY2KU5YB6hISEu/LdUvwVR0p7mSrejIl6Z0cfwSBsR8By', 'y0pB5U8E36tQ1TrMgvwxROJsPANmYqIHahLl7Kj2Dd9nW4okuz', 'active', '', '0000-00-00 00:00:00'),
(44, '11', '$2y$10$xdmtPBapiCw2hY9H8AJuOu1uwLTkWffroLokRhoEPnfOFFAA6hyFi', 'lC9f3rDWuBLKXng6UzHj0pNtcZ2xPMav1QomhkETIi47bwysJe', 'active', '', '0000-00-00 00:00:00'),
(47, '1', '$2y$10$koRjIH94Wx7g.V9ZKoYr..72iPczqwGPms/Poyv2qhwUgd1VijTnq', 'lY5iWbNc27rMLVpUQmRwOZKv9CFxyXf60IsSBoaEenutJqDdT8', 'active', '', '0000-00-00 00:00:00'),
(48, '1', '$2y$10$UGZN8uS2uhREbxl5d9axaekSvAk69aBRrcNiWG8liT2XKGv/dVzp6', 'xWl63OJqNCefkVQD5YHvySXI9KR7gmBaErGZ1souhUbtTjdLFA', 'active', 'admin', '0000-00-00 00:00:00'),
(49, '121', '$2y$10$WPuFM8HDnTwLnWYbhdGAiubU7SFxmuujNSiB3ZriZfRMITDVjnwOK', 'PGk3AN8xup0bZ2465zhnYyIOdW7wlicKvmatgoDHUT1SjLEsRF', 'active', '', '0000-00-00 00:00:00'),
(50, 'iamadmin', '$2y$10$uTtf6baLPaZ9VJb/q3W4Guy1Ixro5ua92B6qAsrg7rhvfIhB8eOgW', 'cKAsF4Pnv7LEDXeSpRm1xiMHqTW259U3bkzVagCwoQZ8hGBtyY', 'active', '', '0000-00-00 00:00:00'),
(51, 'adminito', '$2y$10$ICiNw5KuNwR8RAQ.aWJm4OPGC8MPN2SQbtZYPHBgRDUdIUJ2T/t4a', 'eyvAIbRxEcTUdu4CkD2nJigYOVlXQjGMth0BWrwN3pPs9Kz75f', 'active', 'admin', '0000-00-00 00:00:00'),
(52, 'userako', '$2y$10$o1BiKpUIhwFrfDv6aSHsa.nZiseQgYLPNTaLyhxhvpi4C9zkw3cf.', 'nPdc94Uwqxvy0TSRJ8OFzLhstCbulX5YrGZ1QWfpgikm726Dae', 'active', 'user', '0000-00-00 00:00:00'),
(53, '123', '$2y$10$59q4tyDSfPOAPXJu241WYO8OEWhmqzZB7.tFO.hT9pX8UPLBzsD76', 'e4VNyU9apxuThtOInDPlM8mq3swCEQA7vFozHir6cfZgYSjRBW', 'active', 'admin', '0000-00-00 00:00:00'),
(54, 'admin', '$2y$10$PCzVlraXv5o4kvJMVGPepOY1FY8kjjTPlzKvrwTUzRknWeEOYCnke', 'tjhS9nQbHLE7dMkxAwmeIsFpcVlBqZN6rD3Jz50TXgU4OP2GoK', 'active', 'admin', '0000-00-00 00:00:00'),
(55, 'user', '$2y$10$BpEwBqgoMP3pUZg1oNR1D.5mxgY.4WSDa8y/QXOLLWJzz3IA53Vl6', 'd2k8wryNOiM1cUsDl3VQJmgGnCEb9veIhpFf5aSPZTzu6K4qxj', 'active', 'user', '0000-00-00 00:00:00'),
(60, 'Dodas', '$2y$10$b/kkejrdPR2stcXiYVq9ieyPaDggyO1xv4fzxbDbrpo3Wgw5DH6IG', 'DcYS01HXe2AZK7rfiVE4qpma6wLnuIo8sB5hzPvktd9bOjlUGR', 'active', 'user', '0000-00-00 00:00:00'),
(61, 'Badeth', '$2y$10$BamZSfr7aFwuenNdO1VS4uCM2kjZRiYTxIy8yErElyS9vTZtsgVIq', 'FELTys9e6zgWdaBnG4R2vqo5Ix7fc3tYH0u1P8JbmklirCSNUQ', 'active', 'user', '0000-00-00 00:00:00'),
(63, 'joan', '$2y$10$W1Xol/TCsZYg6FgBtZOpsOrRThnXGvXZxXol5Fllzc9kBe.tkv1Uu', 'DfzecdE1COlbL0unGXwm7g6V5ItvkHqArMx4TPy8KYJUR2NSpj', 'active', 'user', '0000-00-00 00:00:00'),
(64, '12345', '$2y$10$tjoHWDtmz2r.7GFtnh9DAeIymsARiV3mETO.0r0Yi2GrjvntBSowy', 'hdJ7RIUipFEbnoWvfNsQxySqaD3CAVBGtLg6eKj8uz15ZlYwOX', 'active', 'user', '0000-00-00 00:00:00'),
(65, 'joyce', '$2y$10$fI0w7xmHClL.FrvVyuDQYuvSVuYkbUAFb73/9igIdBvXlUlCDxjUG', 'ke2MPjKvs1bxmXqW8uc7L65oOFTtZgnD4ShJNpBdirRQCYy0wU', 'active', 'user', '0000-00-00 00:00:00'),
(66, 'user', '$2y$10$6vdL/lMQ5KLhp44/Zc3OSO/.6dgfvV/ktdLxY5EdXy7ldEj0VDtnO', 'KQcfhU6LHrjPpqJuMRvY4g1oElixI35Z7AXndWN8ezObV0mwT2', 'active', 'user', '0000-00-00 00:00:00'),
(67, 'user', '$2y$10$5ZZde4mAv/lVggJq/l1nvuAm78OnDw7zobiXi3bLFS8Ztui0OXrs6', 'KytIOgRx4Dd5A1LTm6Ej0CSJUbMXWYoe8ucFV3ZNrQpB2sfik7', 'active', 'user', '0000-00-00 00:00:00'),
(68, 'admin123', '$2y$10$g9uFMcSuZ6AksLwdb.lbwOt/OAMtNwWWHQ/IEsbTQ4NEVFDA15A1a', 'Yyq2zKTDtVC0iOmHPbrUM4BShXFacoE8fGkdjgw1neu79lx6NQ', 'active', 'user', '0000-00-00 00:00:00'),
(69, 'Dudas', '$2y$10$ATxwEwTuARF82vTy9nRPlO0r05Ik6X8boy1ia/2lqOWKAewOBuOOq', '96enYVFTROhy7JA4SbfQsHGpEX2Mq5loBjkWLrDUdxt81cNi3K', 'active', 'user', '0000-00-00 00:00:00'),
(70, '12', '$2y$10$QKz73GwbgQCJk.9GZ.ywPewBTAK85GaixzZ12sbwxX.blftj3t/zS', 'xYw4WQ7lgA3LsCUSHhv2cteEVFpDRNJ0i6GmudMPXrkna5oKzB', 'active', 'user', '0000-00-00 00:00:00'),
(71, '1', '$2y$10$dUqeodIulyegNQAHIk9ZoetWaOdVsS..eIOyPqYZb5Il33iEGsMye', 'XAvj6PxQrKEf5OZdUVTY7WRkiz2DgnB0JeLsSbao4mFyHtu9Cp', 'active', 'user', '0000-00-00 00:00:00'),
(72, 'User', '$2y$10$Uedw1t47Ug3MqgpVvXNp2ODaqjVSLsKIUhXyDjRNBX4IiO9iah4XO', 'MjezSpniLItK6hJVvr9TgURdEBbfY1P0Z7HWas3uxQFmCykD8q', 'active', 'user', '0000-00-00 00:00:00'),
(73, '111111', '$2y$10$n4tZVmQ7tvGpD2Q6hEuDDuQb4rm6mXJy4lwrK8W9C2smkYnmRk26O', 'mUCTpndt5Ar28LN9XZRIiqSjs4uBYgoyJbGQMfEKH7zvPOk3wF', 'active', 'user', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additionaldata`
--
ALTER TABLE `additionaldata`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ApplicantID` (`ApplicantID`);

--
-- Indexes for table `applicationform`
--
ALTER TABLE `applicationform`
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
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `educationalbackground`
--
ALTER TABLE `educationalbackground`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ApplicantID` (`ApplicantID`);

--
-- Indexes for table `emergencycontactinformation`
--
ALTER TABLE `emergencycontactinformation`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ApplicantID` (`ApplicantID`);

--
-- Indexes for table `employmentoccupationalbackground`
--
ALTER TABLE `employmentoccupationalbackground`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ApplicantID` (`ApplicantID`);

--
-- Indexes for table `formdata`
--
ALTER TABLE `formdata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interviews`
--
ALTER TABLE `interviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
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
-- Indexes for table `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personalhistory`
--
ALTER TABLE `personalhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personalinformation`
--
ALTER TABLE `personalinformation`
  ADD PRIMARY KEY (`ID`);

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
-- Indexes for table `readiness_input`
--
ALTER TABLE `readiness_input`
  ADD PRIMARY KEY (`id`),
  ADD KEY `applicant_id` (`applicant_id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
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
-- AUTO_INCREMENT for table `additionaldata`
--
ALTER TABLE `additionaldata`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `applicationform`
--
ALTER TABLE `applicationform`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `educationalbackground`
--
ALTER TABLE `educationalbackground`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `emergencycontactinformation`
--
ALTER TABLE `emergencycontactinformation`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employmentoccupationalbackground`
--
ALTER TABLE `employmentoccupationalbackground`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `formdata`
--
ALTER TABLE `formdata`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `interviews`
--
ALTER TABLE `interviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal`
--
ALTER TABLE `personal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personalinformation`
--
ALTER TABLE `personalinformation`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `readiness_input`
--
ALTER TABLE `readiness_input`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `additionaldata`
--
ALTER TABLE `additionaldata`
  ADD CONSTRAINT `additionaldata_ibfk_1` FOREIGN KEY (`ApplicantID`) REFERENCES `personalinformation` (`ID`);

--
-- Constraints for table `educationalbackground`
--
ALTER TABLE `educationalbackground`
  ADD CONSTRAINT `educationalbackground_ibfk_1` FOREIGN KEY (`ApplicantID`) REFERENCES `personalinformation` (`ID`);

--
-- Constraints for table `emergencycontactinformation`
--
ALTER TABLE `emergencycontactinformation`
  ADD CONSTRAINT `emergencycontactinformation_ibfk_1` FOREIGN KEY (`ApplicantID`) REFERENCES `personalinformation` (`ID`);

--
-- Constraints for table `employmentoccupationalbackground`
--
ALTER TABLE `employmentoccupationalbackground`
  ADD CONSTRAINT `employmentoccupationalbackground_ibfk_1` FOREIGN KEY (`ApplicantID`) REFERENCES `personalinformation` (`ID`);

--
-- Constraints for table `readiness_input`
--
ALTER TABLE `readiness_input`
  ADD CONSTRAINT `readiness_input_ibfk_1` FOREIGN KEY (`applicant_id`) REFERENCES `personalinformation` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
