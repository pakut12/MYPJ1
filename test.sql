-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:4306
-- Generation Time: Sep 06, 2022 at 11:38 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `wmbarcode`
--

CREATE TABLE `wmbarcode` (
  `MRNO` varchar(12) NOT NULL,
  `ITEM` varchar(18) NOT NULL,
  `ROLL` int(4) NOT NULL,
  `PALET` int(4) DEFAULT NULL,
  `PLANT` varchar(4) DEFAULT NULL,
  `DESC1` varchar(40) DEFAULT NULL,
  `DESC2` varchar(40) DEFAULT NULL,
  `DESC3` varchar(40) DEFAULT NULL,
  `PO` varchar(12) DEFAULT NULL,
  `POLN` int(5) DEFAULT NULL,
  `INVOICEDATE` date DEFAULT NULL,
  `CREATEDATE` date DEFAULT NULL,
  `QUANTITY` int(10) DEFAULT NULL,
  `UNIT` varchar(4) DEFAULT NULL,
  `SUPNAME` varchar(50) DEFAULT NULL,
  `INVOICE` varchar(15) DEFAULT NULL,
  `GRADE` varchar(2) DEFAULT NULL,
  `CODE` varchar(14) DEFAULT NULL,
  `BATCH` varchar(10) DEFAULT NULL,
  `CHANGEDATE` date DEFAULT NULL,
  `COLOR` varchar(9) DEFAULT NULL,
  `SUPPLIER` varchar(10) DEFAULT NULL,
  `DELIVERYNO` varchar(15) DEFAULT NULL,
  `PUGROUP` varchar(3) DEFAULT NULL,
  `PUNAME` varchar(18) DEFAULT NULL,
  `TELEPHONE` varchar(12) DEFAULT NULL,
  `PRICE` decimal(9,2) DEFAULT NULL,
  `PRD` varchar(12) DEFAULT NULL,
  `LOT` varchar(100) DEFAULT NULL,
  `PER` varchar(5) DEFAULT NULL,
  `CURR` varchar(5) DEFAULT NULL,
  `TOQC` varchar(1) DEFAULT NULL,
  `TOTEST` varchar(1) DEFAULT NULL,
  `RESULTQC` varchar(1) DEFAULT NULL,
  `RESULTTEST` varchar(1) DEFAULT NULL,
  `PAGE` varchar(4) DEFAULT NULL,
  `AFTERQTY` decimal(10,2) DEFAULT NULL,
  `REMARKRM1` varchar(60) DEFAULT NULL,
  `REMARKRM2` varchar(60) DEFAULT NULL,
  `REMARKRM3` varchar(60) DEFAULT NULL,
  `SAVEDATE` varchar(10) DEFAULT NULL,
  `DMWEIGHT` decimal(7,3) DEFAULT NULL,
  `MWEIGHT` decimal(7,3) DEFAULT NULL,
  `RMWIDTH` decimal(7,3) DEFAULT NULL,
  `REFMRNO` varchar(12) DEFAULT NULL,
  `OLDINVOICE` varchar(15) DEFAULT NULL,
  `REALQTY` decimal(10,2) DEFAULT NULL,
  `WEIGHT` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wmbarcode`
--

INSERT INTO `wmbarcode` (`MRNO`, `ITEM`, `ROLL`, `PALET`, `PLANT`, `DESC1`, `DESC2`, `DESC3`, `PO`, `POLN`, `INVOICEDATE`, `CREATEDATE`, `QUANTITY`, `UNIT`, `SUPNAME`, `INVOICE`, `GRADE`, `CODE`, `BATCH`, `CHANGEDATE`, `COLOR`, `SUPPLIER`, `DELIVERYNO`, `PUGROUP`, `PUNAME`, `TELEPHONE`, `PRICE`, `PRD`, `LOT`, `PER`, `CURR`, `TOQC`, `TOTEST`, `RESULTQC`, `RESULTTEST`, `PAGE`, `AFTERQTY`, `REMARKRM1`, `REMARKRM2`, `REMARKRM3`, `SAVEDATE`, `DMWEIGHT`, `MWEIGHT`, `RMWIDTH`, `REFMRNO`, `OLDINVOICE`, `REALQTY`, `WEIGHT`) VALUES
('902208002776', '90BKL0174-DG65', 1, 39, '9000', '20174EA POLY KNIT WD.66 C#92/DKCHARCOAL', ' 100% POLYESTER DOUBLE KNIT FABRIC KN M/', 'C 22GG/34IN  YARN #100-36/150-48 WEIGHT', '4592200652', 20, '2022-08-11', '2022-08-11', 40, 'YD', 'บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)', '193139', 'A', '9002200013738', 'KI-605/02', '2022-08-11', '4.5', '0600000089', '', '915', 'C. BUNDIT*', '', '98.00', '', '1', 'THB', '', '', '0', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 2, 39, '9000', '20174EA POLY KNIT WD.66 C#92/DKCHARCOAL', ' 100% POLYESTER DOUBLE KNIT FABRIC KN M/', 'C 22GG/34IN  YARN #100-36/150-48 WEIGHT', '4592200652', 20, '2022-08-11', '2022-08-11', 45, 'YD', 'บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)', '193139', 'A', '9002200013737', 'KI-605/02', '2022-08-11', '4.5', '0600000089', '', '915', 'C. BUNDIT*', '', '98.00', '', '1', 'THB', '', '', '0', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 3, 39, '9000', '20174EA POLY KNIT WD.66 C#92/DKCHARCOAL', ' 100% POLYESTER DOUBLE KNIT FABRIC KN M/', 'C 22GG/34IN  YARN #100-36/150-48 WEIGHT', '4592200652', 20, '2022-08-11', '2022-08-11', 45, 'YD', 'บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)', '193139', 'A', '9002200013736', 'KI-605/02', '2022-08-11', '4.5', '0600000089', '', '915', 'C. BUNDIT*', '', '98.00', '', '1', 'THB', '', '', '0', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 4, 39, '9000', '20174EA POLY KNIT WD.66 C#92/DKCHARCOAL', ' 100% POLYESTER DOUBLE KNIT FABRIC KN M/', 'C 22GG/34IN  YARN #100-36/150-48 WEIGHT', '4592200652', 20, '2022-08-11', '2022-08-11', 45, 'YD', 'บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)', '193139', 'A', '9002200013735', 'KI-605/02', '2022-08-11', '4.5', '0600000089', '', '915', 'C. BUNDIT*', '', '98.00', '', '1', 'THB', '', '', '0', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 5, 39, '9000', '20174EA POLY KNIT WD.66 C#92/DKCHARCOAL', ' 100% POLYESTER DOUBLE KNIT FABRIC KN M/', 'C 22GG/34IN  YARN #100-36/150-48 WEIGHT', '4592200652', 20, '2022-08-11', '2022-08-11', 45, 'YD', 'บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)', '193139', 'A', '9002200013734', 'KI-605/02', '2022-08-11', '4.5', '0600000089', '', '915', 'C. BUNDIT*', '', '98.00', '', '1', 'THB', '', '', '0', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 6, 39, '9000', '20174EA POLY KNIT WD.66 C#92/DKCHARCOAL', ' 100% POLYESTER DOUBLE KNIT FABRIC KN M/', 'C 22GG/34IN  YARN #100-36/150-48 WEIGHT', '4592200652', 20, '2022-08-11', '2022-08-11', 45, 'YD', 'บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)', '193139', 'A', '9002200013733', 'KI-605/02', '2022-08-11', '4.5', '0600000089', '', '915', 'C. BUNDIT*', '', '98.00', '', '1', 'THB', '', '', '0', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 7, 39, '9000', '20174EA POLY KNIT WD.66 C#92/DKCHARCOAL', ' 100% POLYESTER DOUBLE KNIT FABRIC KN M/', 'C 22GG/34IN  YARN #100-36/150-48 WEIGHT', '4592200652', 20, '2022-08-11', '2022-08-11', 45, 'YD', 'บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)', '193139', 'A', '9002200013732', 'KI-605/02', '2022-08-11', '4.5', '0600000089', '', '915', 'C. BUNDIT*', '', '98.00', '', '1', 'THB', '', '', '0', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 8, 39, '9000', '20174EA POLY KNIT WD.66 C#92/DKCHARCOAL', ' 100% POLYESTER DOUBLE KNIT FABRIC KN M/', 'C 22GG/34IN  YARN #100-36/150-48 WEIGHT', '4592200652', 20, '2022-08-11', '2022-08-11', 44, 'YD', 'บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)', '193139', 'A', '9002200013731', 'KI-607/03', '2022-08-11', '4.5', '0600000089', '', '915', 'C. BUNDIT*', '', '98.00', '', '1', 'THB', '', '', '0', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 9, 39, '9000', '20174EA POLY KNIT WD.66 C#92/DKCHARCOAL', ' 100% POLYESTER DOUBLE KNIT FABRIC KN M/', 'C 22GG/34IN  YARN #100-36/150-48 WEIGHT', '4592200652', 20, '2022-08-11', '2022-08-11', 45, 'YD', 'บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)', '193139', 'A', '9002200013730', 'KI-607/03', '2022-08-11', '4.5', '0600000089', '', '915', 'C. BUNDIT*', '', '98.00', '', '1', 'THB', '', '', '0', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 10, 39, '9000', '20174EA POLY KNIT WD.66 C#92/DKCHARCOAL', ' 100% POLYESTER DOUBLE KNIT FABRIC KN M/', 'C 22GG/34IN  YARN #100-36/150-48 WEIGHT', '4592200652', 20, '2022-08-11', '2022-08-11', 47, 'YD', 'บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)', '193139', 'A', '9002200013729', 'KI-607/03', '2022-08-11', '4.5', '0600000089', '', '915', 'C. BUNDIT*', '', '98.00', '', '1', 'THB', '', '', '0', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 11, 39, '9000', '20174EA POLY KNIT WD.66 C#92/DKCHARCOAL', ' 100% POLYESTER DOUBLE KNIT FABRIC KN M/', 'C 22GG/34IN  YARN #100-36/150-48 WEIGHT', '4592200652', 20, '2022-08-11', '2022-08-11', 47, 'YD', 'บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)', '193139', 'A', '9002200013728', 'KI-607/03', '2022-08-11', '4.5', '0600000089', '', '915', 'C. BUNDIT*', '', '98.00', '', '1', 'THB', '', '', '0', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 12, 39, '9000', '20174EA POLY KNIT WD.66 C#92/DKCHARCOAL', ' 100% POLYESTER DOUBLE KNIT FABRIC KN M/', 'C 22GG/34IN  YARN #100-36/150-48 WEIGHT', '4592200652', 20, '2022-08-11', '2022-08-11', 47, 'YD', 'บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)', '193139', 'A', '9002200013727', 'KI-607/03', '2022-08-11', '4.5', '0600000089', '', '915', 'C. BUNDIT*', '', '98.00', '', '1', 'THB', '', '', '0', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 13, 39, '9000', '20174EA POLY KNIT WD.66 C#92/DKCHARCOAL', ' 100% POLYESTER DOUBLE KNIT FABRIC KN M/', 'C 22GG/34IN  YARN #100-36/150-48 WEIGHT', '4592200652', 20, '2022-08-11', '2022-08-11', 47, 'YD', 'บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)', '193139', 'A', '9002200013726', 'KI-607/03', '2022-08-11', '4.5', '0600000089', '', '915', 'C. BUNDIT*', '', '98.00', '', '1', 'THB', '', '', '0', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 14, 39, '9000', '20174EA POLY KNIT WD.66 C#92/DKCHARCOAL', ' 100% POLYESTER DOUBLE KNIT FABRIC KN M/', 'C 22GG/34IN  YARN #100-36/150-48 WEIGHT', '4592200652', 20, '2022-08-11', '2022-08-11', 44, 'YD', 'บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)', '193139', 'A', '9002200013725', 'KI-607/03', '2022-08-11', '4.5', '0600000089', '', '915', 'C. BUNDIT*', '', '98.00', '', '1', 'THB', '', '', '0', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 15, 169, '9000', '20174EA POLY KNIT WD.66 C#92/DKCHARCOAL', ' 100% POLYESTER DOUBLE KNIT FABRIC KN M/', 'C 22GG/34IN  YARN #100-36/150-48 WEIGHT', '4592200652', 20, '2022-08-11', '2022-08-11', 42, 'YD', 'บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)', '193139', 'A', '9002200013724', 'KI-601/20', '2022-08-11', '4.5', '0600000089', '', '915', 'C. BUNDIT*', '', '98.00', '', '1', 'THB', '', '', '0', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 16, 169, '9000', '20174EA POLY KNIT WD.66 C#92/DKCHARCOAL', ' 100% POLYESTER DOUBLE KNIT FABRIC KN M/', 'C 22GG/34IN  YARN #100-36/150-48 WEIGHT', '4592200652', 20, '2022-08-11', '2022-08-11', 45, 'YD', 'บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)', '193139', 'A', '9002200013723', 'KI-601/20', '2022-08-11', '4.5', '0600000089', '', '915', 'C. BUNDIT*', '', '98.00', '', '1', 'THB', '', '', '0', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 17, 169, '9000', '20174EA POLY KNIT WD.66 C#92/DKCHARCOAL', ' 100% POLYESTER DOUBLE KNIT FABRIC KN M/', 'C 22GG/34IN  YARN #100-36/150-48 WEIGHT', '4592200652', 20, '2022-08-11', '2022-08-11', 45, 'YD', 'บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)', '193139', 'A', '9002200013722', 'KI-601/20', '2022-08-11', '4.5', '0600000089', '', '915', 'C. BUNDIT*', '', '98.00', '', '1', 'THB', '', '', '0', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 18, 169, '9000', '20174EA POLY KNIT WD.66 C#92/DKCHARCOAL', ' 100% POLYESTER DOUBLE KNIT FABRIC KN M/', 'C 22GG/34IN  YARN #100-36/150-48 WEIGHT', '4592200652', 20, '2022-08-11', '2022-08-11', 45, 'YD', 'บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)', '193139', 'A', '9002200013721', 'KI-601/20', '2022-08-11', '4.5', '0600000089', '', '915', 'C. BUNDIT*', '', '98.00', '', '1', 'THB', '', '', '0', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 19, 169, '9000', '20174EA POLY KNIT WD.66 C#92/DKCHARCOAL', ' 100% POLYESTER DOUBLE KNIT FABRIC KN M/', 'C 22GG/34IN  YARN #100-36/150-48 WEIGHT', '4592200652', 20, '2022-08-11', '2022-08-11', 47, 'YD', 'บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)', '193139', 'A', '9002200013720', 'KI-601/20', '2022-08-11', '4.5', '0600000089', '', '915', 'C. BUNDIT*', '', '98.00', '', '1', 'THB', '', '', '0', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 20, 169, '9000', '20174EA POLY KNIT WD.66 C#92/DKCHARCOAL', ' 100% POLYESTER DOUBLE KNIT FABRIC KN M/', 'C 22GG/34IN  YARN #100-36/150-48 WEIGHT', '4592200652', 20, '2022-08-11', '2022-08-11', 45, 'YD', 'บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)', '193139', 'A', '9002200013719', 'KI-601/20', '2022-08-11', '4.5', '0600000089', '', '915', 'C. BUNDIT*', '', '98.00', '', '1', 'THB', '', '', '0', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 21, 169, '9000', '20174EA POLY KNIT WD.66 C#92/DKCHARCOAL', ' 100% POLYESTER DOUBLE KNIT FABRIC KN M/', 'C 22GG/34IN  YARN #100-36/150-48 WEIGHT', '4592200652', 20, '2022-08-11', '2022-08-11', 44, 'YD', 'บริษัท โทเร เท็กซ์ไทล์ (ประเทศไทย)', '193139', 'A', '9002200013718', 'KI-601/20', '2022-08-11', '4.5', '0600000089', '', '915', 'C. BUNDIT*', '', '98.00', '', '1', 'THB', '', '', '0', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wmmaster`
--

CREATE TABLE `wmmaster` (
  `BARCODE` varchar(14) NOT NULL,
  `MRNO` varchar(12) DEFAULT NULL,
  `ITEM` varchar(18) DEFAULT NULL,
  `ROLL` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wmmaster`
--

INSERT INTO `wmmaster` (`BARCODE`, `MRNO`, `ITEM`, `ROLL`) VALUES
('9002200013718', '902208002776', '90BKL0174-DG65', '21'),
('9002200013719', '902208002776', '90BKL0174-DG65', '20'),
('9002200013720', '902208002776', '90BKL0174-DG65', '19'),
('9002200013721', '902208002776', '90BKL0174-DG65', '18'),
('9002200013722', '902208002776', '90BKL0174-DG65', '17'),
('9002200013723', '902208002776', '90BKL0174-DG65', '16'),
('9002200013724', '902208002776', '90BKL0174-DG65', '15'),
('9002200013725', '902208002776', '90BKL0174-DG65', '14'),
('9002200013726', '902208002776', '90BKL0174-DG65', '13'),
('9002200013727', '902208002776', '90BKL0174-DG65', '12'),
('9002200013728', '902208002776', '90BKL0174-DG65', '11'),
('9002200013729', '902208002776', '90BKL0174-DG65', '10'),
('9002200013730', '902208002776', '90BKL0174-DG65', '9'),
('9002200013731', '902208002776', '90BKL0174-DG65', '8'),
('9002200013732', '902208002776', '90BKL0174-DG65', '7'),
('9002200013733', '902208002776', '90BKL0174-DG65', '6'),
('9002200013734', '902208002776', '90BKL0174-DG65', '5'),
('9002200013735', '902208002776', '90BKL0174-DG65', '4'),
('9002200013736', '902208002776', '90BKL0174-DG65', '3'),
('9002200013737', '902208002776', '90BKL0174-DG65', '2'),
('9002200013738', '902208002776', '90BKL0174-DG65', '1');

-- --------------------------------------------------------

--
-- Table structure for table `wmqck`
--

CREATE TABLE `wmqck` (
  `MRNO` varchar(12) NOT NULL,
  `ITEM` varchar(18) NOT NULL,
  `ROLL` int(4) NOT NULL,
  `PALET` int(4) DEFAULT NULL,
  `ACTQTY` int(10) DEFAULT NULL,
  `ETHREAD` varchar(2) DEFAULT NULL,
  `EOIL` varchar(2) DEFAULT NULL,
  `EKNOT` varchar(2) DEFAULT NULL,
  `EJOINT` varchar(2) DEFAULT NULL,
  `EARCH` varchar(2) DEFAULT NULL,
  `EFURROW` varchar(2) DEFAULT NULL,
  `EDIRTY` varchar(2) DEFAULT NULL,
  `EALKALI` varchar(2) DEFAULT NULL,
  `EBROKEN` varchar(2) DEFAULT NULL,
  `EREPEAT` varchar(10) DEFAULT NULL,
  `TOTERR` int(3) DEFAULT NULL,
  `WIDTH` varchar(10) DEFAULT NULL,
  `GRADEQC` int(4) DEFAULT NULL,
  `QCDATE` date DEFAULT NULL,
  `BYNAME` varchar(30) DEFAULT NULL,
  `WEIGHT` int(8) DEFAULT NULL,
  `QTYLAY` int(1) DEFAULT NULL,
  `MARK` varchar(1) DEFAULT NULL,
  `REMARK1` varchar(150) DEFAULT NULL,
  `REMARK2` varchar(150) DEFAULT NULL,
  `REMARK3` varchar(150) DEFAULT NULL,
  `REJECT` varchar(1) DEFAULT NULL,
  `BYNAME1` varchar(20) DEFAULT NULL,
  `REMARK4` varchar(20) DEFAULT NULL,
  `WEIGHT1` varchar(10) DEFAULT NULL,
  `MARK_TOTERR` varchar(1) DEFAULT NULL,
  `REFMRNO` varchar(12) DEFAULT NULL,
  `point` float(7,2) DEFAULT NULL,
  `scolor` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wmqck`
--

INSERT INTO `wmqck` (`MRNO`, `ITEM`, `ROLL`, `PALET`, `ACTQTY`, `ETHREAD`, `EOIL`, `EKNOT`, `EJOINT`, `EARCH`, `EFURROW`, `EDIRTY`, `EALKALI`, `EBROKEN`, `EREPEAT`, `TOTERR`, `WIDTH`, `GRADEQC`, `QCDATE`, `BYNAME`, `WEIGHT`, `QTYLAY`, `MARK`, `REMARK1`, `REMARK2`, `REMARK3`, `REJECT`, `BYNAME1`, `REMARK4`, `WEIGHT1`, `MARK_TOTERR`, `REFMRNO`, `point`, `scolor`) VALUES
('902208002776', '90BKL0174-DG65', 1, 39, 40, '0', '0', '1', '2', NULL, '3', '0', '0', '0', NULL, 6, '120', NULL, '2022-08-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PakutSing', NULL, NULL, NULL, NULL, 2.40, NULL),
('902208002776', '90BKL0174-DG65', 2, 39, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PakutSing', NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 3, 39, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PakutSing', NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 4, 39, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PakutSing', NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 5, 39, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PakutSing', NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 6, 39, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PakutSing', NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 7, 39, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PakutSing', NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 8, 39, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PakutSing', NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 9, 39, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PakutSing', NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 10, 39, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PakutSing', NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 11, 39, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PakutSing', NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 12, 39, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PakutSing', NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 13, 39, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PakutSing', NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 14, 39, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PakutSing', NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 15, 169, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'à¸£à¸±à¸à¸à¸', NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 16, 169, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'à¸£à¸±à¸à¸à¸', NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 17, 169, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'à¸£à¸±à¸à¸à¸', NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 18, 169, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'à¸£à¸±à¸à¸à¸', NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 19, 169, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'à¸£à¸±à¸à¸à¸', NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 20, 169, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'à¸£à¸±à¸à¸à¸', NULL, NULL, NULL, NULL, NULL, NULL),
('902208002776', '90BKL0174-DG65', 21, 169, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'à¸£à¸±à¸à¸à¸', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wmuser`
--

CREATE TABLE `wmuser` (
  `userid` int(7) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `status` varchar(5) DEFAULT NULL,
  `statusqi` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wmuser`
--

INSERT INTO `wmuser` (`userid`, `password`, `firstname`, `lastname`, `status`, `statusqi`) VALUES
(111523, '45EB84E2871E24E63FB412D858D289DD', 'PakutSing', 'Jawala', '03', 'Y'),
(111552, '45EB84E2871E24E63FB412D858D289DD', 'Pakut Sing', 'Jawala', '01', 'Y'),
(115255, '45EB84E2871E24E63FB412D858D289DD', 'PakutS', 'JAW', '02', 'N');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wmbarcode`
--
ALTER TABLE `wmbarcode`
  ADD PRIMARY KEY (`MRNO`,`ITEM`,`ROLL`);

--
-- Indexes for table `wmmaster`
--
ALTER TABLE `wmmaster`
  ADD PRIMARY KEY (`BARCODE`);

--
-- Indexes for table `wmqck`
--
ALTER TABLE `wmqck`
  ADD PRIMARY KEY (`MRNO`,`ITEM`,`ROLL`);

--
-- Indexes for table `wmuser`
--
ALTER TABLE `wmuser`
  ADD PRIMARY KEY (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
