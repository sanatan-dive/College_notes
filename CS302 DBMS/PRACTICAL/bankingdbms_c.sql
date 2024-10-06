-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2020 at 08:41 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `banking_dbms`
--
mysql_upgrade;
CREATE DATABASE IF NOT EXISTS `banking_dbms` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `banking_dbms`;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_number` varchar(5) NOT NULL,
  `branch_name` varchar(20) NOT NULL,
  `balance` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_number`, `branch_name`, `balance`) VALUES
('A-101', 'Downtown', 500),
('A-102', 'Perryridge', 400),
('A-201', 'Brighton', 900),
('A-215', 'Mianus', 700),
('A-217', 'Brighton', 750),
('A-222', 'Redwood', 700),
('A-305', 'Round Hill', 350),
('A-101', 'Downtown', 500),
('A-102', 'Perryridge', 400),
('A-201', 'Brighton', 900),
('A-215', 'Mianus', 700),
('A-217', 'Brighton', 750),
('A-222', 'Redwood', 700),
('A-305', 'Round Hill', 350);

-- --------------------------------------------------------

--
-- Table structure for table `borrower`
--

CREATE TABLE `borrower` (
  `customer_name` varchar(35) NOT NULL,
  `loan_number` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `borrower`
--

INSERT INTO `borrower` (`customer_name`, `loan_number`) VALUES
('Curry', 'L-93'),
('Hayes', 'L - 15'),
('Jackson', 'L -14'),
('Jones', 'L - 17'),
('Smith ', 'L - 11'),
('Smith', 'L - 23'),
('Williams', 'L - 17'),
('Adams', 'L - 16'),
('Curry', 'L-93'),
('Hayes', 'L - 15'),
('Jackson', 'L -14'),
('Jones', 'L - 17'),
('Smith ', 'L - 11'),
('Smith', 'L - 23'),
('Williams', 'L - 17'),
('Adams', 'L - 16');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_name` varchar(50) NOT NULL,
  `branch_city` varchar(50) NOT NULL,
  `assets` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_name`, `branch_city`, `assets`) VALUES
('Brighton', 'Brooklyn', 7100000),
('Downtown', 'Brooklyn', 9000000),
('Mianus', 'Horseneck', 400000),
('North Town', 'Rye', 3700000),
('Perryridge', 'Horseneck', 1700000),
('Pownal', 'Bennington', 300000),
('Redwood', 'Palo Alto', 2100000),
('Round Hill', 'Horseneck', 8000000),
('Brighton', 'Brooklyn', 7100000),
('Downtown', 'Brooklyn', 9000000),
('Mianus', 'Horseneck', 400000),
('North Town', 'Rye', 3700000),
('Perryridge', 'Horseneck', 1700000),
('Pownal', 'Bennington', 300000),
('Redwood', 'Palo Alto', 2100000),
('Round Hill', 'Horseneck', 8000000);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_Name` char(15) NOT NULL,
  `Customer_Street` char(15) NOT NULL,
  `Customer_City` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_Name`, `Customer_Street`, `Customer_City`) VALUES
('Brooks', 'Senator', 'Brooklyn'),
('Curry', 'North', 'Rye'),
('Glenn', 'Sandhill', 'Woodside'),
('Green', 'Walnut', 'Stamford'),
('Hayes', 'Main', 'Harrison'),
('Johnson', 'Alma', 'Palo Alto'),
('Jones', 'Main', 'Harrison'),
('Lindsay', 'Park', 'Pittsfield'),
('Smith', 'North', 'Rye'),
('Turner', 'Putnam', 'Stamford'),
('Williams', 'Nassaw', 'Princeton'),
('Adams', 'Spring', 'Pittsfield'),
('Brooks', 'Senator', 'Brooklyn'),
('Curry', 'North', 'Rye'),
('Glenn', 'Sandhill', 'Woodside'),
('Green', 'Walnut', 'Stamford'),
('Hayes', 'Main', 'Harrison'),
('Johnson', 'Alma', 'Palo Alto'),
('Jones', 'Main', 'Harrison'),
('Lindsay', 'Park', 'Pittsfield'),
('Smith', 'North', 'Rye'),
('Turner', 'Putnam', 'Stamford'),
('Williams', 'Nassaw', 'Princeton'),
('Adams', 'Spring', 'Pittsfield');

-- --------------------------------------------------------

--
-- Table structure for table `depositor`
--

CREATE TABLE `depositor` (
  `customer_name` varchar(10) NOT NULL,
  `account_number` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depositor`
--

INSERT INTO `depositor` (`customer_name`, `account_number`) VALUES
('Hayes', 'A-102'),
('Johnson', 'A-101'),
('Jones', 'A-217'),
('Lindsay', 'A-222'),
('Smith', 'A-215'),
('Turner', 'A-305'),
('Johnson', 'A-201'),
('Hayes', 'A-102'),
('Johnson', 'A-101'),
('Jones', 'A-217'),
('Lindsay', 'A-222'),
('Smith', 'A-215'),
('Turner', 'A-305'),
('Johnson', 'A-201');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `loan_number` varchar(5) NOT NULL,
  `branch_name` varchar(20) NOT NULL,
  `amount` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`loan_number`, `branch_name`, `amount`) VALUES
('L-11', 'Round Hill', 900),
('L-14', 'Downtown', 1500),
('L-15', 'Perryridge', 1500),
('L-16', 'Perryridge', 1300),
('L-17', 'Downtown', 1000),
('L-23', 'Redwood', 2000),
('L-93', 'Mianus', 500),
('L-11', 'Round Hill', 900),
('L-14', 'Downtown', 1500),
('L-15', 'Perryridge', 1500),
('L-16', 'Perryridge', 1300),
('L-17', 'Downtown', 1000),
('L-23', 'Redwood', 2000),
('L-93', 'Mianus', 500);
--
-- Database: `bankingdata`
--
CREATE DATABASE IF NOT EXISTS `bankingdata` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bankingdata`;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_number` varchar(5) NOT NULL,
  `branch_name` varchar(20) NOT NULL,
  `balance` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_number`, `branch_name`, `balance`) VALUES
('A-101', 'Downtown', 500),
('A-102', 'Perryridge', 400),
('A-201', 'Brighton', 900),
('A-215', 'Mianus', 700),
('A-217', 'Brighton', 750),
('A-222', 'Redwood', 700),
('A-305', 'Round Hill', 350),
('A-101', 'Downtown', 500),
('A-102', 'Perryridge', 400),
('A-201', 'Brighton', 900),
('A-215', 'Mianus', 700),
('A-217', 'Brighton', 750),
('A-222', 'Redwood', 700),
('A-305', 'Round Hill', 350);

-- --------------------------------------------------------

--
-- Table structure for table `borrower`
--

CREATE TABLE `borrower` (
  `customer_name` varchar(35) NOT NULL,
  `loan_number` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `borrower`
--

INSERT INTO `borrower` (`customer_name`, `loan_number`) VALUES
('Curry', 'L - 93'),
('Hayes', 'L - 15'),
('Jackson', 'L - 14'),
('Jones', 'L - 17'),
('Smith ', 'L - 11'),
('Smith', 'L - 23'),
('Williams', 'L - 17'),
('Adams', 'L - 16'),
('Curry', 'L - 93'),
('Hayes', 'L - 15'),
('Jackson', 'L - 14'),
('Jones', 'L - 17'),
('Smith ', 'L - 11'),
('Smith', 'L - 23'),
('Williams', 'L - 17'),
('Adams', 'L - 16');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_name` varchar(50) NOT NULL,
  `branch_city` varchar(50) NOT NULL,
  `assets` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_name`, `branch_city`, `assets`) VALUES
('Brighton', 'Brooklyn', 7100000),
('Downtown', 'Brooklyn', 9000000),
('Mianus', 'Horseneck', 400000),
('North Town', 'Rye', 3700000),
('Perryridge', 'Horseneck', 1700000),
('Pownal', 'Bennington', 300000),
('Redwood', 'Palo Alto', 2100000),
('Round Hill', 'Horseneck', 8000000),
('Brighton', 'Brooklyn', 7100000),
('Downtown', 'Brooklyn', 9000000),
('Mianus', 'Horseneck', 400000),
('North Town', 'Rye', 3700000),
('Perryridge', 'Horseneck', 1700000),
('Pownal', 'Bennington', 300000),
('Redwood', 'Palo Alto', 2100000),
('Round Hill', 'Horseneck', 8000000);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_Name` char(15) NOT NULL,
  `Customer_Street` char(15) NOT NULL,
  `Customer_City` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_Name`, `Customer_Street`, `Customer_City`) VALUES
('Brooks', 'Senator', 'Brooklyn'),
('Curry', 'North', 'Rye'),
('Glenn', 'Sandhill', 'Woodside'),
('Green', 'Walnut', 'Stamford'),
('Hayes', 'Main', 'Harrison'),
('Johnson', 'Alma', 'Palo Alto'),
('Jones', 'Main', 'Harrison'),
('Lindsay', 'Park', 'Pittsfield'),
('Smith', 'North', 'Rye'),
('Turner', 'Putnam', 'Stamford'),
('Williams', 'Nassaw', 'Princeton'),
('Adams', 'Spring', 'Pittsfield'),
('Brooks', 'Senator', 'Brooklyn'),
('Curry', 'North', 'Rye'),
('Glenn', 'Sandhill', 'Woodside'),
('Green', 'Walnut', 'Stamford'),
('Hayes', 'Main', 'Harrison'),
('Johnson', 'Alma', 'Palo Alto'),
('Jones', 'Main', 'Harrison'),
('Lindsay', 'Park', 'Pittsfield'),
('Smith', 'North', 'Rye'),
('Turner', 'Putnam', 'Stamford'),
('Williams', 'Nassaw', 'Princeton'),
('Adams', 'Spring', 'Pittsfield');

-- --------------------------------------------------------

--
-- Table structure for table `depositor`
--

CREATE TABLE `depositor` (
  `customer_name` varchar(10) NOT NULL,
  `account_number` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depositor`
--

INSERT INTO `depositor` (`customer_name`, `account_number`) VALUES
('Hayes', 'A-102'),
('Johnson', 'A-101'),
('Jones', 'A-217'),
('Lindsay', 'A-222'),
('Smith', 'A-215'),
('Turner', 'A-305'),
('Johnson', 'A-201'),
('Hayes', 'A-102'),
('Johnson', 'A-101'),
('Jones', 'A-217'),
('Lindsay', 'A-222'),
('Smith', 'A-215'),
('Turner', 'A-305'),
('Johnson', 'A-201');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `loan_number` varchar(5) NOT NULL,
  `branch_name` varchar(20) NOT NULL,
  `amount` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`loan_number`, `branch_name`, `amount`) VALUES
('L-11', 'Round Hill', 900),
('L-14', 'Downtown', 1500),
('L-15', 'Perryridge', 1500),
('L-16', 'Perryridge', 1300),
('L-17', 'Downtown', 1000),
('L-23', 'Redwood', 2000),
('L-93', 'Mianus', 500),
('L-11', 'Round Hill', 900),
('L-14', 'Downtown', 1500),
('L-15', 'Perryridge', 1500),
('L-16', 'Perryridge', 1300),
('L-17', 'Downtown', 1000),
('L-23', 'Redwood', 2000),
('L-93', 'Mianus', 500);
--
-- Database: `bankingdbms`
--
CREATE DATABASE IF NOT EXISTS `bankingdbms` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bankingdbms`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SelectAllCustomer` ()  BEGIN SELECT* FROM customer; END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `select_all` ()  BEGIN

	select * from customer;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `select_c` (IN `city` VARCHAR(20))  BEGIN
	select * from customer where Customer_City=city;

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_City` (IN `city` VARCHAR(20))  BEGIN
	select * from customer where Customer_City=city;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `select_city_street` (IN `city` VARCHAR(20), IN `street` VARCHAR(20))  BEGIN
	select * from customer where Customer_City=city and Customer_Street=street;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_number` varchar(5) NOT NULL,
  `branch_name` varchar(20) NOT NULL,
  `balance` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_number`, `branch_name`, `balance`) VALUES
('A-101', 'Downtown', 500),
('A-102', 'Perryridge', 400),
('A-201', 'Brighton', 900),
('A-215', 'Mianus', 700),
('A-217', 'Brighton', 750),
('A-222', 'Redwood', 700),
('A-305', 'Round Hill', 350);

--
-- Triggers `account`
--
DELIMITER $$
CREATE TRIGGER `delete_info` BEFORE DELETE ON `account` FOR EACH ROW insert into
account_status values(old.account_number,"deleted",now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_info` AFTER INSERT ON `account` FOR EACH ROW insert into account_status values(new.account_number,"inserted",now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_info` AFTER UPDATE ON `account` FOR EACH ROW insert into
account_status values(new.account_number,"updated",now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `account_status`
--

CREATE TABLE `account_status` (
  `id` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_status`
--

INSERT INTO `account_status` (`id`, `action`, `date_time`) VALUES
('A-111', 'inserted', '2019-10-07 16:35:11'),
('A-111', 'deleted', '2019-10-07 16:49:06'),
('A-201', 'updated', '2019-10-07 16:51:14'),
('A-201', 'updated', '2019-10-07 16:52:21');

-- --------------------------------------------------------

--
-- Table structure for table `borrower`
--

CREATE TABLE `borrower` (
  `customer_name` varchar(35) NOT NULL,
  `loan_number` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `borrower`
--

INSERT INTO `borrower` (`customer_name`, `loan_number`) VALUES
('Smith ', 'L-11'),
('Jackson', 'L-14'),
('Hayes', 'L-15'),
('Adams', 'L-16'),
('Williams', 'L-17'),
('Smith', 'L-23'),
('Curry', 'L-93');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_name` varchar(50) NOT NULL,
  `branch_city` varchar(50) NOT NULL,
  `assets` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_name`, `branch_city`, `assets`) VALUES
('Brighton', 'Brooklyn', 7100000),
('Downtown', 'Brooklyn', 9000000),
('Mianus', 'Horseneck', 400000),
('North Town', 'Rye', 3700000),
('Perryridge', 'Horseneck', 1700000),
('Pownal', 'Bennington', 300000),
('Redwood', 'Palo Alto', 2100000),
('Round Hill', 'Horseneck', 8000000);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_Name` char(15) NOT NULL,
  `Customer_Street` char(15) NOT NULL,
  `Customer_City` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_Name`, `Customer_Street`, `Customer_City`) VALUES
('Brooks', 'Senator', 'Brooklyn'),
('Curry', 'North', 'Rye'),
('Glenn', 'Sandhill', 'Woodside'),
('Green', 'Walnut', 'Stamford'),
('Hayes', 'Main', 'Harrison'),
('Johnson', 'Alma', 'Palo Alto'),
('Jones', 'Main', 'Harrison'),
('Lindsay', 'Park', 'Pittsfield'),
('Smith', 'North', 'Rye'),
('Turner', 'Putnam', 'Stamford'),
('Williams', 'Nassaw', 'Princeton'),
('Adams', 'Spring', 'Pittsfield');

-- --------------------------------------------------------

--
-- Table structure for table `depositor`
--

CREATE TABLE `depositor` (
  `customer_name` varchar(10) NOT NULL,
  `account_number` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depositor`
--

INSERT INTO `depositor` (`customer_name`, `account_number`) VALUES
('Johnson', 'A-101'),
('Hayes', 'A-102'),
('Johnson', 'A-201'),
('Smith', 'A-215'),
('Jones', 'A-217'),
('Lindsay', 'A-222'),
('Turner', 'A-305');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `loan_number` varchar(5) NOT NULL,
  `branch_name` varchar(20) NOT NULL,
  `amount` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`loan_number`, `branch_name`, `amount`) VALUES
('L-11', 'Round Hill', 900),
('L-14', 'Downtown', 1500),
('L-15', 'Perryridge', 1500),
('L-16', 'Perryridge', 1300),
('L-17', 'Downtown', 1000),
('L-23', 'Redwood', 2000),
('L-93', 'Mianus', 500);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrower`
--
ALTER TABLE `borrower`
  ADD PRIMARY KEY (`loan_number`);

--
-- Indexes for table `depositor`
--
ALTER TABLE `depositor`
  ADD PRIMARY KEY (`account_number`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`loan_number`);
--
-- Database: `camplace _placement`
--
CREATE DATABASE IF NOT EXISTS `camplace _placement` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `camplace _placement`;
--
-- Database: `campus_placement`
--
CREATE DATABASE IF NOT EXISTS `campus_placement` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `campus_placement`;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `c_id` varchar(15) NOT NULL,
  `company_name` varchar(32) NOT NULL,
  `min_grade` int(11) NOT NULL,
  `participated` int(11) NOT NULL,
  `selected` int(11) NOT NULL,
  `package` decimal(10,3) NOT NULL,
  `tot_vacancies` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`c_id`, `company_name`, `min_grade`, `participated`, `selected`, `package`, `tot_vacancies`) VALUES
('101', 'Infosys', 7, 53, 34, '6.000', 60),
('102', 'Gemini Solutions', 8, 45, 3, '6.000', 20),
('103', 'Zycus', 8, 39, 0, '5.750', 10),
('104', 'uTrade', 7, 40, 0, '5.550', 10),
('105', 'SUFI', 7, 38, 2, '4.200', 10),
('106', 'Ernst&Young', 7, 35, 6, '4.000', 10),
('107', 'Greyb', 8, 34, 1, '3.800', 10),
('108', 'Quark', 8, 43, 7, '5.200', 10),
('109', 'Azcom', 9, 22, 0, '6.000', 10),
('110', 'Innow8', 9, 17, 3, '6.800', 10),
('111', 'Ommzi Solution', 8, 37, 6, '3.250', 10),
('112', 'VR Xpert', 7, 27, 1, '3.200', 10);

-- --------------------------------------------------------

--
-- Table structure for table `interviewers`
--

CREATE TABLE `interviewers` (
  `c_id` varchar(15) NOT NULL,
  `name_i` varchar(32) NOT NULL,
  `t_id` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interviewers`
--

INSERT INTO `interviewers` (`c_id`, `name_i`, `t_id`) VALUES
('101', 'Avinash Pathak', 'T-201'),
('102', 'Jay Nagpal', 'T-202'),
('103', 'Harsh Bhatia', 'T-203'),
('104', 'Dipika Saini', 'T-204'),
('105', 'Chetan Gupta', 'T-205'),
('106', 'Rajat Sharma', 'T-206'),
('107', 'Satish Arora', 'T-207'),
('108', 'Arjun Gupta', 'T-208'),
('109', 'Priyanka Tripathi', 'T-209'),
('110', 'Ritika Sachdeva', 'T-210'),
('111', 'Anubhav Roy', 'T-211'),
('112', 'Adarsh Malhotra', 'T-212');

-- --------------------------------------------------------

--
-- Table structure for table `placed`
--

CREATE TABLE `placed` (
  `s_id` varchar(15) NOT NULL,
  `c_id1` varchar(15) NOT NULL,
  `c_id2` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `placed`
--

INSERT INTO `placed` (`s_id`, `c_id1`, `c_id2`) VALUES
('CO13311', '101', '0'),
('CO14302', '101', '0'),
('CO14305', '101', '0'),
('CO14306', '101', '0'),
('CO14307', '101', '0'),
('CO14309', '106', '0'),
('CO14311', '101', '0'),
('CO14312', '112', '109'),
('CO14316', '108', '111'),
('CO14317', '102', '112'),
('CO14318', '111', '0'),
('CO14320', '101', '0'),
('CO14321', '101', '0'),
('CO14323', '101', '0'),
('CO14324', '101', '0'),
('CO14326', '101', '0'),
('CO14327', '101', '0'),
('CO14328', '101', '0'),
('CO14329', '104', '0'),
('CO14330', '109', '0'),
('CO14331', '101', '109'),
('CO14333', '101', '102'),
('CO14334', '101', '0'),
('CO14335', '101', '0'),
('CO14336', '101', '0'),
('CO14338', '101', '107'),
('CO14339', '101', '109'),
('CO14340', '102', ''),
('CO14342', '101', ''),
('CO14343', '101', ''),
('CO14344', '101', ''),
('CO14345', '101', ''),
('CO14347', '101', ''),
('CO14353', '101', ''),
('CO14354', '101', ''),
('CO14358', '101', ''),
('CO14359', '101', ''),
('CO14360', '101', ''),
('CO14361', '101', ''),
('CO14362', '101', ''),
('CO14363', '101', ''),
('LCO14368', '101', '');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `c_id` varchar(15) NOT NULL,
  `company_name` varchar(32) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`c_id`, `company_name`, `time`, `date`) VALUES
('101', 'Infosys', '10:00:00', '2017-09-01'),
('102', 'Gemini Solutions', '14:00:00', '2017-09-01'),
('103', 'Zycus', '10:00:00', '2017-09-02'),
('104', 'uTrade', '14:00:00', '2017-09-02'),
('105', 'SUFI', '10:00:00', '2017-09-03'),
('106', 'Ernst&Young', '14:00:00', '2017-09-03'),
('107', 'Greyb', '10:00:00', '2017-09-04'),
('108', 'Quark', '14:00:00', '2017-09-04'),
('109', 'Azcom', '10:00:00', '2017-09-05'),
('110', 'Innow8', '14:00:00', '2017-09-05'),
('111', 'Ommzi Solutions', '10:00:00', '2017-09-06'),
('112', 'VR Xpert', '14:00:00', '2017-09-06');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `name` varchar(22) DEFAULT NULL,
  `s_id` varchar(8) NOT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `cgpa` varchar(30) DEFAULT NULL,
  `eligible` varchar(9) DEFAULT NULL,
  `interested` varchar(11) DEFAULT NULL,
  `contact` varchar(11) DEFAULT NULL,
  `stream` varchar(6) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`name`, `s_id`, `gender`, `email`, `cgpa`, `eligible`, `interested`, `contact`, `stream`, `year`) VALUES
('AVNEESH VERMA', 'CO13311', 'Male', 'avneesh.verma.01@gmail.com', '6.77', 'YES', 'YES', '8288826869', 'C.S.E.', '4th'),
('AASHISH BHARDWAJ', 'CO14302', 'Male', 'bhaashu.9@gmail.com', '8.18', 'YES', 'YES', '9468295595', 'C.S.E.', '4th'),
('ABHIROOP SINGH GONDARA', 'CO14304', 'Male', 'abhi.gondara@gmail.com', '7.02', 'YES', 'YES', '9872982397', 'C.S.E.', '4th'),
('ADHYAN', 'CO14305', 'Male', 'adhy.1996@gmail.com', '7.25', 'YES', 'YES', '9464616786', 'C.S.E.', '4th'),
('ADITYA BANSAL', 'CO14306', 'Male', 'adi.bansal241996@gmail.com', '8.06', 'YES', 'YES', '7009554648', 'C.S.E.', '4th'),
('AKANKSHA', 'CO14307', 'Female', 'akanksha.chuchra96@gmail.com', '7.95', 'YES', 'YES', '9464045631', 'C.S.E.', '4th'),
('AKANKSHA KUMARI', 'CO14308', 'Female', 'Akankshasinghpatna29@gmail.com', '7.33', 'YES', 'YES', '9023739856', 'C.S.E.', '4th'),
('AKHILESH KUMAR', 'CO14309', 'Male', 'sharmaakb12@gmail.com', '8.4', 'YES', 'YES', '8198069959', 'C.S.E.', '4th'),
('AKSHAY GUPTA', 'CO14310', 'Male', 'akkigupta20@yahoo.in', '7.25', 'YES', 'YES', '9914307788', 'C.S.E.', '4th'),
('AKSHAT JAIN', 'CO14311', 'Male', 'akshat.hdfclife@gmail.com', '8.11', 'YES', 'YES', '8699960557', 'C.S.E.', '4th'),
('AKSHIT GUPTA', 'CO14312', 'Male', 'mr.akshitgupta@gmail.com', '7.96', 'YES', 'YES', '9988889518', 'C.S.E.', '4th'),
('AMANDEEP SINGH', 'CO14313', 'Male', 'amna7saini@yahoo.in', '8.43', 'YES', 'YES', '7696003289', 'C.S.E.', '4th'),
('AMARJEET JAKHAR', 'CO14314', 'Male', 'aj60200@gmail.com', '7.68', 'YES', 'YES', '8699389969', 'C.S.E.', '4th'),
('ANKIT PANDEY', 'CO14316', 'Male', 'ankpandey@outlook.com', '7.41', 'YES', 'YES', '9467609792', 'C.S.E.', '4th'),
('ANSHUL SHARMA', 'CO14317', 'Male', 'anshuls7766@gmail.com', '8.71', 'YES', 'YES', '8950268721', 'C.S.E.', '4th'),
('ARSHDEEP KAUR ', 'CO14318 ', 'Female', 'arshdeep24kaur@gmail.com', 'PASS but RLL', 'NO', 'YES', '9872588233', 'C.S.E.', '4th'),
('ASHIM BHASIN', 'CO14320', 'Male', 'ashimbhasin4@gmail.com', '8.09', 'YES', 'YES', '8558056929', 'C.S.E.', '4th'),
('DARSHAN SHARMA', 'CO14321', 'Male', 'thedarshansharma@gmail.com', '8.11', 'YES', 'YES', '8437073522', 'C.S.E.', '4th'),
('DIWANSHI VERMA', 'CO14323', 'Female', 'verma.diwanshi@gmail.com', '8.17', 'YES', 'YES', '7508337709', 'C.S.E.', '4th'),
('DRAVITA', 'CO14324', 'Female', 'dravitasingla1995@gmail.com ', '7.71', 'YES', 'YES', '9501254671', 'C.S.E.', '4th'),
('ESHA RANA', 'CO14325', 'Female', 'esharana1997@gmail.com', '8.33', 'YES', 'YES', '9876771412', 'C.S.E.', '4th'),
('HITESH KAUSHIK', 'CO14326', 'Male', 'hiteshkaushik545@gmail.com', '8.28', 'YES', 'YES', '8699006213', 'C.S.E.', '4th'),
('JITESH KUMAR', 'CO14327', 'Male', 'jitesh.kumar9895@gmail.com', '8.25', 'YES', 'YES', '7696373712', 'C.S.E.', '4th'),
('KANUPRIYA SHARMA', 'CO14328', 'Female', 'kanupriyasharma18@yahoo.in', '8.97', 'YES', 'YES', '7837741365', 'C.S.E.', '4th'),
('KUMAR GAURAV PANDEY', 'CO14329', 'Male', 'gaurav1911@outlook.com', '7.88', 'YES', 'YES', '8699256106', 'C.S.E.', '4th'),
('KUNAL AHUJA', 'CO14330', 'Male', 'kunal.ahuja4444@gmail.com', '8.73', 'YES', 'YES', '9023023757', 'C.S.E.', '4th'),
('MANSHA BHATIA', 'CO14331', 'Female', 'mansha_bhatia27@yahoo.in', '7.65', 'YES', 'YES', '8728072727', 'C.S.E.', '4th'),
('MANVIR SINGH', 'CO14332', 'Male', 'raagfrerramvs@gmail.com', '6.94', 'YES', 'YES', '8195950437', 'C.S.E.', '4th'),
('MITALI ARORA', 'CO14333', 'Female', 'Mitaliarora_14@rocketmail.com ', '8.03', 'YES', 'YES', '8427956798', 'C.S.E.', '4th'),
('MOHIT SINGH SANGWAN', 'CO14334', 'Male', 'rtr.mohitsangwan@gmail.com', '8.27', 'YES', 'YES', '9041049190', 'C.S.E.', '4th'),
('MUJAHID AHMAD', 'CO14335', 'Male', 'dihajum3@gmail.com', '7.73', 'YES', 'YES', '9592982786', 'C.S.E.', '4th'),
('MUKUL', 'CO14336', 'Male', 'mukul.madaan8@gmail.com', '7.36', 'YES', 'YES', '7508615346', 'C.S.E.', '4th'),
('NAVLEEN KOUR', 'CO14338', 'Female', 'navleenkour96@gmail.com', '7.89', 'YES', 'YES', '8289071942', 'C.S.E.', '4th'),
('NAYAN GUPTA', 'CO14339', 'Male', 'nayangupta824@gmail.com', '8.89', 'YES', 'YES', '7696122564', 'C.S.E.', '4th'),
('PARAS CHADHA', 'CO14340', 'Male', 'paraschadha18@gmail.com', '9.03', 'YES', 'YES', '9888772598', 'C.S.E.', '4th'),
('PRATINAV SARDANA ', 'CO14342', 'Male', 'pratinav.sardana@gmail.com', '8.36', 'YES', 'YES', '9417121636', 'C.S.E.', '4th'),
('PRIYA YADAV', 'CO14343', 'Female', 'priyayadav.ccet@gmail.com', '8.14', 'YES', 'YES', '9467754771', 'C.S.E.', '4th'),
('RAJAT SADANA', 'CO14344', 'Male', 'rajatsadana@hotmail.com ', '7.46', 'YES', 'YES', '9041279259', 'C.S.E.', '4th'),
('RIDHI SHARMA', 'CO14345', 'Female', 'ridhi96@gmail.com', '7.55', 'YES', 'YES', '9530569393', 'C.S.E.', '4th'),
('RINKU YADAV', 'CO14346', 'Male', 'rinkuccet@gmail.com', '8.6', 'YES', 'YES', '7508023064', 'C.S.E.', '4th'),
('RISHABH MALHOTRA', 'CO14347', 'Male', 'rishabh_malhotra@outlook.com', '8.75', 'YES', 'YES', '9878938209', 'C.S.E.', '4th'),
('RIZUL GOYAL', 'CO14348', 'Male', 'rizulgoyal.96@gmail.com', '7.53', 'YES', 'YES', '8727937349', 'C.S.E.', '4th'),
('SAHIL', 'CO14350', 'Male', 'sahil.menia42@gmail.com', '6.78', 'YES', 'YES', '9888207762', 'C.S.E.', '4th'),
('SAMEEKSHA JAIN', 'CO14351', 'Female', 'sameekshajn9@gmail.com', '7.54', 'YES', 'YES', '9780385033', 'C.S.E.', '4th'),
('SHUBHAM JINDAL', 'CO14353', 'Male', 'shubham27jindal@gmail.com', '6.88', 'YES', 'YES', '7508090016', 'C.S.E.', '4th'),
('SIMARPREET KAUR ', 'CO14354', 'Female', 'kaursimarpreet414@yahoo.com ', '8.79', 'YES', 'YES', '8288938416', 'C.S.E.', '4th'),
('SIMRANJEET SINGH ', 'CO14355', 'Male', 'simranjeet271@gmail.com', '8.79', 'YES', 'YES', '9872798700', 'C.S.E.', '4th'),
('SOPHIA DHAWAN', 'CO14357', 'Female', 'Dhawan.sophia@gmail.com', '7.34', 'YES', 'YES', '9780749621', 'C.S.E.', '4th'),
('SWASTIKA MOUDGIL', 'CO14358', 'Female', 'swastikaa15@gmail.com', '8.85', 'YES', 'YES', '8556873577', 'C.S.E.', '4th'),
('TARUN SUDHA', 'CO14359', 'Male', 'tarun.sudha98@gmail.com', '7.99', 'YES', 'YES', '7355693035', 'C.S.E.', '4th'),
('UPINDER ', 'CO14360', 'Male', 'upinder.goku7@gmail.com', '6.83', 'YES', 'YES', '7508301068', 'C.S.E.', '4th'),
('URVI FOTEDAR', 'CO14361', 'Female', 'urvifotedar@gmail.com', '8.5', 'YES', 'YES', '9736133810', 'C.S.E.', '4th'),
('VAIBHAV SAPRA', 'CO14362', 'Male', 'vaibhavsapra14@gmail.com', '7.53', 'YES', 'YES', '9530802484', 'C.S.E.', '4th'),
('AMANDEEP VERMA', 'CO14363', 'Male', 'vermaamandeep4@gmail.com', '7.51', 'YES', 'YES', '9878657197', 'C.S.E.', '4th'),
('MANAV SAINI', 'LCO13364', 'Male', 'manav25195@gmail.com', 'RLL (CS-602) (CS-604) ', 'NO', 'YES', '8968065116', 'C.S.E.', '4th'),
('AKRITI GUPTA', 'LCO14364', 'Female', 'akritigupta65@gmail.com', '7.15', 'YES', 'YES', '9041275066', 'C.S.E.', '4th'),
('CHATARBHUJ', 'LCO14365', 'Male', 'chatarbhuj02@gmail.com', 'PASS but RLL', 'NO', 'YES', '8699417421', 'C.S.E.', '4th'),
('DAKSHAY BEDI', 'LCO14366', 'Male', 'dakshaybedi7@gmail.com', 'RLL(CS-602)(CS-605 )', 'NO', 'YES', '9988242599', 'C.S.E.', '4th'),
('KARAN KUMAR', 'LCO14367', 'Male', 'karankumar143670@gmail.com', 'RLL(CS-602)', 'NO', 'YES', '9779063634', 'C.S.E.', '4th'),
('KRITI RANA ', 'LCO14368', 'Female', 'kritirana.k@gmail.com ', '8.13', 'YES', 'YES', '9915037648', 'C.S.E.', '4th'),
('MANPREET KAUR', 'LCO14369', 'Female', 'kaurmanpreet0036@gmail.com', 'RLL (CS-602)', 'NO', 'YES', '7889228099', 'C.S.E.', '4th'),
('NEENA', 'LCO14370', 'Female', 'neenasingh0116@gmail.com', '6.79', 'YES', 'YES', '9501003879', 'C.S.E.', '4th'),
('POONAM', 'LCO14371', 'Female', 'poonam.mahala7@gmail.com', '7.43', 'YES', 'YES', '8054301179', 'C.S.E.', '4th'),
('PRIYANKA RAWAT', 'LCO14372', 'Female', 'priyurajput9620@gmail.com', '8.01', 'YES', 'YES', '9779712042', 'C.S.E.', '4th'),
('RASHIKA', 'LCO14373', 'Female', 'rashikaccet@gmail.com', 'RLL (CS-602) (CS-604) (CS-605)', 'NO', 'YES', '9501335183', 'C.S.E.', '4th'),
('SHIFALI', 'LCO14375', 'Female', 'shefalibhasin3@gmail.com', '6.29', 'YES', 'YES', '8146368947', 'C.S.E.', '4th'),
('SHIVANI', 'LCO14376', 'Female', 'shivani158shivani@gmail.com', 'RLL (CS-602) (CS-604) (CS-605)', 'NO', 'YES', '9876816950', 'C.S.E.', '4th'),
('TANIA SOOD', 'LCO14377', 'Female', 'soodtania70@gmail.com', 'RLL (CS-602) (CS-604)', 'NO', 'YES', '9914478915', 'C.S.E.', '4th');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_duty`
--

CREATE TABLE `teacher_duty` (
  `t_id` varchar(15) NOT NULL,
  `teacher_name` varchar(32) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_duty`
--

INSERT INTO `teacher_duty` (`t_id`, `teacher_name`, `time`, `date`) VALUES
('T-201', 'Ankit Gupta', '10:00:00', '2017-09-01'),
('T-202', 'Gulshan Goyal', '14:00:00', '2017-09-01'),
('T-203', 'KJ', '10:00:00', '2017-09-02'),
('T-204', 'Sunil K Singh', '14:00:00', '2017-09-02'),
('T-205', 'Sarabjeet Singh', '10:00:00', '2017-09-03'),
('T-206', 'Amit Chabbra', '14:00:00', '2017-09-03'),
('T-207', 'Sunita', '10:00:00', '2017-09-04'),
('T-208', 'Varun', '14:00:00', '2017-09-04'),
('T-209', 'Taranjit Kaur', '10:00:00', '2017-09-05'),
('T-210', 'Ashu Arora', '14:00:00', '2017-09-05'),
('T-211', 'Parul Sharma', '10:00:00', '2017-09-06'),
('T-212', 'Sudhakar Kumar', '14:00:00', '2017-09-06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `interviewers`
--
ALTER TABLE `interviewers`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `placed`
--
ALTER TABLE `placed`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `teacher_duty`
--
ALTER TABLE `teacher_duty`
  ADD PRIMARY KEY (`t_id`);
--
-- Database: `ccet`
--
CREATE DATABASE IF NOT EXISTS `ccet` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ccet`;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `NAME` varchar(40) NOT NULL,
  `DEPT` varchar(20) NOT NULL,
  `ROOM NO` int(8) NOT NULL,
  `CATEGORY` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`NAME`, `DEPT`, `ROOM NO`, `CATEGORY`) VALUES
('Dr. Dheerendra Singh', 'CSE', 414, 'Teaching'),
('VGUPTA', 'CSE', 413, 'Teaching'),
('Dr. Radhey Sham', 'Mech', 300, 'Teaching'),
('Sh. H S Rana', 'Office', 104, 'Non Teaching'),
('Sh. Rewalsar Nath', 'Office', 209, 'Non Teaching'),
('Sh. Raghubir Singh', 'Office', 106, 'Non Teaching');
--
-- Database: `cities`
--
CREATE DATABASE IF NOT EXISTS `cities` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cities`;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_name` char(15) NOT NULL,
  `city_pincode` int(11) DEFAULT NULL,
  `state` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `name` char(15) NOT NULL,
  `city` char(30) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Database: `computational_data`
--
CREATE DATABASE IF NOT EXISTS `computational_data` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `computational_data`;

-- --------------------------------------------------------

--
-- Table structure for table `computation`
--

CREATE TABLE `computation` (
  `S.N.` int(2) NOT NULL,
  `Name_of_the_Official` varchar(27) NOT NULL,
  `Email_ID` varchar(29) NOT NULL,
  `Mobile_Number` varchar(10) NOT NULL,
  `Designation` varchar(16) NOT NULL,
  `Model_Of_Printer` varchar(37) NOT NULL,
  `Date_Of_Purchase_Of_Printer` varchar(2) NOT NULL,
  `Model_Of_Laptop` varchar(18) NOT NULL,
  `Date_Of_Purchase_Of_Laptop` varchar(2) NOT NULL,
  `Room_Number` varchar(4) NOT NULL,
  `Date_Of_Last_Refilling` varchar(9) NOT NULL,
  `Department` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `computation`
--

INSERT INTO `computation` (`S.N.`, `Name_of_the_Official`, `Email_ID`, `Mobile_Number`, `Designation`, `Model_Of_Printer`, `Date_Of_Purchase_Of_Printer`, `Model_Of_Laptop`, `Date_Of_Purchase_Of_Laptop`, `Room_Number`, `Date_Of_Last_Refilling`, `Department`) VALUES
(1, 'Hardeep Singh Rana', 'hooccet@gmail.com', '9988090708', 'A.C. (F&A)', '', '', 'Dell Latitude 3480', '', '', '', 'NA'),
(2, 'Meena Saini', '', '', 'S.O.', '', '', '', '', '', '', 'NA'),
(3, 'Madan', '', '9888002550', 'Clerk', 'HP Laserjet P1007', '', 'NA', 'NA', '', '', 'NA'),
(4, 'Lakhwinder Singh', 'bhuller180@gmail.com', '', '', '', '', '', '', '', '', 'NA'),
(5, 'Sandeep', 'Sandeepsangwan78917@gmail.com', '7988210952', 'Clerk', 'HP Laserjet P1007', '', '', '', '', '', 'NA'),
(6, 'Sudhir Kumar', 'Sudhir30khokhar1993@gmail.com', '7016053500', 'Clerk', 'HP Laserjet P1608dn', '', 'NA', 'NA', '', '9/7/2018', 'NA'),
(7, 'Vivek', 'Vivekjangra2022@gmail.com  ', '8708409565', 'Clerk', 'Samsung Xpress M2021w', '', 'NA', 'NA', '', '9/7/2018', 'NA'),
(8, 'Harinder Kumar', 'Harinder180976@gmail.com', '7986600980', 'Clerk', 'HP Laserjet P1108', '', 'NA', 'NA', '', '', 'NA'),
(9, 'Narr Singh', '', '', 'Steno Typist', '', '', '', '', '', '', 'NA'),
(10, 'Munish Chadha', '', '', '', 'HP Laserjet P1108', '', 'NA', 'NA', '', '13/6/18', 'NA'),
(11, 'Raghubir ', 'raghbirbisht@gmail.com', '9988627818', '', 'HP Laserjet P1007', '', 'NA', 'NA', '', '', 'NA'),
(12, 'Monika Thukral', 'Monikathukral9@gmail.com', '9876731523', 'Steno Typist', 'HP Laserjet P1108', '', 'NA', 'NA', '', '24/7/18', 'NA'),
(13, 'Dr. Jatinder Madan', 'jatindermadan@ccet.ac.in', '9041291970', 'Prof.', 'Canon 3010', '', 'HP Probook 440G3', '', '', '', 'Mechanical'),
(14, 'Er. Vinod Chauhan', 'vinodchauhan@ccet.ac.in', '9466736896', 'Asstt. Prof.', '', '', '', '', '', '', 'Mechanical'),
(15, 'Dr. Ashwani Kumar', 'ashwanikumar@ccet.ac.in', '9872882325', 'Asstt. Prof.', 'HP 2280', '', '', '', '', '3/10/2017', 'Mechanical'),
(16, 'Dr. Radhey Sham', 'radheysham@ccet.ac.in', '9888040982', 'Asstt. Prof.', 'HP Laserjet P1007', '', '', '', '', '10/5/2018', 'Mechanical'),
(17, 'Dr. SC Vettivel', 'scvettivel@ccet.ac.in', '9865822376', 'Asstt. Prof.', '', '', '', '', '', '', 'Mechanical'),
(18, 'Er. Mukesh Kumar', 'mukeshkumar@ccet.ac.in', '9478420561', 'Asstt. Prof.', '', '', '', '', '', '', 'Mechanical'),
(19, 'Er.Vaithilingam Senthil', 'vsenthil@ccet.ac.in', '9884121196', 'Asstt. Prof.', '', '', '', '', '', '', 'Mechanical'),
(20, 'Dr. Rajesh Kumar', 'rajeshaastha@ccet.ac.in', '9478548248', 'Prof.', 'Canon(All in one)', '', 'HP Probook 440G3', '', '', '', 'Civil'),
(21, 'Er. Mohd. Sakib Perwez Khan', 'sakib786@ccet.ac.in', '7839452836', 'Asstt. Prof.', 'HP Laserjet 1022', '', '', '', '', '10/5/2018', 'Civil'),
(22, 'Er. Taranjeet Kaur', 'taranjeetkaur@ccet.ac.in', '9814622761', 'Asstt. Prof.', 'HP Laserjet 1007', '', 'NA', 'NA', 'B323', '', 'Civil'),
(23, 'Anil Kumar', 'anilkumar@ccet.ac.in', '9816290720', 'Asstt. Prof.', '', '', '', '', '', '', 'Civil'),
(24, 'Poonam', 'poonam@ccet.ac.in', '8968399719', 'Asstt. Prof.', '', '', '', '', '', '', 'Civil'),
(25, 'Karuna Sharma', 'Karunasharma8168@ccet.ac.in', '8283833589', 'Asstt. Prof.', '', '', '', '', '', '', 'Civil'),
(26, 'Arfat Ahmed  ', 'arfat@ccet.ac.in', '8860736206', 'Asstt. Prof.', '', '', '', '', '', '', 'Civil'),
(27, 'Dr. Aradhana Mehta', 'aradhanam@gmail.com', '8054977561', 'Associate Prof.', '', '', '', '', '', '', 'Civil'),
(28, 'Dr. Sunil Kumar Singh', 'sksingh@ccet.ac.in', '9818182457', 'Prof.', 'HP Laserjet Colour, Canon(All in one)', '', 'HP Probook 440G3', '', '', '10/7/2018', 'CSE'),
(29, 'Er. Sunita', 'sunita@ccet.ac.in', '9041059379', 'Asstt. Prof.', 'HP Laserjet P1007', '', 'NA', '', 'A424', '', 'CSE'),
(30, 'Sarabjeet Singh', 'ssingh@ccet.ac.in', '9463739413', 'Asstt. Prof.', 'Canon LBP 6230/40', '', 'NA', '', 'A426', '5/6/2018', 'CSE'),
(31, 'Dr. Ankit Gupta  ', 'ankit@ccet.ac.in', '9412314479', 'Asstt. Prof.', 'HP Laserjet 1160', '', 'NA', '', 'A423', '', 'CSE'),
(32, 'Dr. Gulshan Goyal', 'gulshangoyal@ccet.ac.in', '9417506206', 'Asstt. Prof.', 'HP Laserjet P1108', '', 'HP Probook 440G3', '', 'A425', '11/5/2018', 'CSE'),
(33, 'Er. Sudhakar Kumar', 'sudhakar@ccet.ac.in', '8434518635', 'Asstt. Prof.', 'Canon 6230 LBP 6230/40', '', 'NA', '', 'A416', '', 'CSE'),
(34, 'Dr. Amit Chhabra', 'Amitchh80@gmail.com', '988862825', 'Asstt. Prof.', 'Canon 6230 LBP 6230/40', '', 'HP Probook 440G3', '', 'A421', '11/5/2018', 'CSE'),
(35, 'Er. Animesh Singh', 'animeshsingh@ccet.ac.in', '9584035345', 'Asstt. Prof.', 'HP Laserjet 1015', '', 'NA', '', 'A422', '', 'CSE'),
(36, 'Dr. Varun Gupta', 'varungupta@gmail.com', '9646047091', 'Associate Prof.', 'HP Laserjet 1160', '', 'Dell Latitude 3480', '', '', '10/5/2018', 'CSE'),
(37, 'Dr. Dheerendra Singh', 'professordsingh@gmail.com  ', '9876439071', 'Associate Prof.', 'Canon LBP 6230/40, HP Deskjet GT5810', '', 'Dell Latitude 3480', '', 'A414', '11/7/2018', 'CSE'),
(38, 'Dr. Davinder Singh Saini', 'dssaini@ccet.ac.in', '8146730369', 'Prof.', 'Laserjet Pro MFPM128fn', '', '', '', 'A315', '5/6/2018', 'ECE'),
(39, 'Dr. Krishan Gopal Sharma', 'kgsharma@ccet.ac.in', '9414403565', 'Associate Prof.', 'HP Laserjet P1007', '', '', '', 'A313', '', 'ECE'),
(40, 'Dr. Bhaskar Gupta', 'bgupta@ccet.ac.in', '9855908643', 'Associate Prof.', 'HP Laserjet 1108', '', '', '', 'A316', '11/7/2018', 'ECE'),
(41, 'Dr. Anil Kumar', 'anilrose@ccet.ac.in', '9416234853', 'Associate Prof.', '', '', '', '', '', '', 'ECE'),
(42, 'Dinesh Sharma', 'sharma82dinesh@gmail.com', '9671721850', 'Asstt. Prof.', 'NA', 'NA', 'NA', 'NA', 'A323', '', 'ECE'),
(43, 'Shilpa Jindal', 'shilpajindal@ccet.ac.in', '9463328881', 'Asstt. Prof.', 'NA', 'NA', 'NA', 'NA', 'A324', '', 'ECE'),
(44, 'Dr.Parvinder Kaur', 'pkaur@ccet.ac.in', '8295688911', 'Asstt. Prof.', '', '', '', '', '', '', 'ECE'),
(45, 'Hardeep Saini', 'hsaini@ccet.ac.in', '9914611106', 'Asstt. Prof.', '', '', '', '', '', '', 'ECE'),
(46, 'Anil Kumar Vaghmare', 'anil2siddu@gmail.com', '9849079734', 'Asstt. Prof.', 'NA', 'NA', 'NA', 'NA', 'A321', '', 'ECE'),
(47, 'Irfan Ahmad Khan', 'iakhan@ccet.ac.in', '7835947022', 'Asstt. Prof.', 'NA', 'NA', 'NA', 'NA', '', '', 'ECE'),
(48, 'Sarita Sharma', 'saritasharma@ccet.ac.in', '9988242611', 'Astt. Prof.', 'HP Laserjet P1007', '', 'NA', 'NA', 'A326', '', 'ECE'),
(49, 'Nipun Sharma', 'nipun_sharma27@yahoo.com', '9646071124', 'Asstt. Prof.', '', '', '', '', '', '', 'Mechanical'),
(50, 'Rajiv Kumar', 'rajivkumar@ccet.ac.in', '9417723312', 'Asstt. Prof.', '', '', '', '', '', '', 'Mechanical'),
(51, 'Surinder Sharma', 'suri.kaushik2008@gmail.com', '9463667857', 'Lab Tech.', '', '', '', '', '', '', 'Mechanical'),
(52, 'Rajesh Kumar', 'rajesh260184@gmail.com', '9417723312', 'Lab Tech.', '', '', '', '', '', '', 'Mechanical'),
(53, 'Birinder Singh', 'saini6622@gmail.com', '9463336622', 'Lab Tech.', '', '', '', '', '', '', 'Mechanical'),
(54, 'Preet Karan Singh', '13april1699@gamil.com', '9803939513', 'Lab Tech.', '', '', '', '', '', '', 'Mechanical'),
(55, 'Malkeet Singh', 'malkeetmann83@gmail.com', '9815803764', 'Workshop Asstt.', '', '', '', '', '', '', 'Mechanical'),
(56, 'Manoj Kumar', 'manjoj.engg21@gmail.com', '9855595574', 'Workshop Asstt.', '', '', '', '', '', '', 'Mechanical'),
(57, 'Madan Lal Kundan', 'mlk5693@gmail.com', '9417682756', 'Consultant', '', '', '', '', '', '', 'Mechanical'),
(58, 'Vandana Sharma', 'randu.kinjal@gmail.com', '9646228935', 'Lab Tech.', 'HP Laserjet P1606dn', '', 'NA', 'NA', 'A420', '5/6/2018', 'ECE'),
(59, 'Mokesh Kumari', 'mokesh05@gmail.com', '8054982293', 'Lab Asstt.', 'NA', 'NA', 'NA', 'NA', 'A412', '', 'ECE'),
(60, 'Romica', 'romyreet@gmail.com', '9888934340', 'Lab Asstt.', 'NA', 'NA', 'NA', 'NA', 'A309', '', 'ECE'),
(61, 'Sumit Rana', 'rana.ricky1@gmail.com', '7009001080', 'Lab Asstt.', 'NA', 'NA', 'NA', 'NA', 'A302', '', 'ECE'),
(62, 'Yuvraj', 'yuvi.rathour@gmail.com', '9781001001', 'Lab Asstt.', 'NA', 'NA', 'NA', 'NA', 'A311', '', 'ECE'),
(63, 'Ashu Arora', '', '', 'Asstt. Prof.', '', '', '', '', '', '', 'Applied Science'),
(64, 'Neha', 'neha@ccet.ac.in', '9646614209', 'Asstt. Prof.', 'NA', 'NA', 'NA', 'NA', 'A104', '', 'Applied Science'),
(65, 'Dr. Manveen Kaur', 'manveenkaur@ccet.ac.in', '9988957007', 'Asstt. Prof.', 'NA', 'NA', 'NA', 'NA', '', '', 'Applied Science'),
(66, 'Dr. Parul Aggarwal', 'parul@ccet.ac.in', '8437911722', 'Asstt. Prof.', '', '', '', '', '', '', 'Applied Science'),
(67, 'Amit Kumar', 'amit6161@gmail.com', '9803939513', 'Lab Tech.', '', '', '', '', '', '', 'Applied Science'),
(68, 'Harmeet Singh', 'harmeetsing@ccet.in', '9855170144', 'Lab Tech.', 'NA', 'NA', 'NA', 'NA', 'A409', '', 'CSE'),
(69, 'Garima', 'garimashull10@gmail.com', '8054100542', 'Computer Asstt.', 'HP Laserjet P1108', '', 'NA', 'NA', '', '', 'CSE'),
(70, 'Gurpreet Singh ', 'gurpreet_bittu38@gmail.com', '9463628154', 'Lab Tech.', '', '', '', '', '', '', 'Civil'),
(71, 'Maninder Singh ', 'maninder2435@yahoo.com', '9815440752', 'Lab Tech.', '', '', '', '', '', '', 'Civil'),
(72, 'Shalini Wasan', 'shalini.wasan@gmail.com', '9855594072', 'Senior Librarian', '', '', '', '', '', '10/7/2018', 'NA'),
(73, 'Karamjit Kaur', 'karamjitkaur24@gmail.com', '9855334461', 'Library Asstt.', '', '', '', '', '', '', 'NA'),
(74, 'Riwalsar Nath', '', '9876372239', 'Senior Asstt.', '', '', '', '', '', '', 'NA'),
(75, 'Sanjiv ', 'sanjiveccet26@gmail.com', '9888123450', 'Driver', 'NA', 'NA', 'NA', 'NA', '', '', 'NA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `computation`
--
ALTER TABLE `computation`
  ADD PRIMARY KEY (`S.N.`);
--
-- Database: `examplll`
--
CREATE DATABASE IF NOT EXISTS `examplll` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `examplll`;

-- --------------------------------------------------------

--
-- Table structure for table `exp1`
--

CREATE TABLE `exp1` (
  `name` varchar(16) NOT NULL,
  `city` varchar(16) NOT NULL,
  `rollno` int(8) NOT NULL,
  `hosteller` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Database: `ipt_exp`
--
CREATE DATABASE IF NOT EXISTS `ipt_exp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ipt_exp`;

-- --------------------------------------------------------

--
-- Table structure for table `table_exp_g123`
--

CREATE TABLE `table_exp_g123` (
  `ROLL_NO` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Stud_Name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Group_ID` int(8) NOT NULL,
  `CITY` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_exp_g123`
--

INSERT INTO `table_exp_g123` (`ROLL_NO`, `Stud_Name`, `Group_ID`, `CITY`) VALUES
('CO17333', 'KESHAV', 3, 'CHANDIGARH'),
('CO17302', 'ABHIJEET', 3, 'PANCHKULA');
--
-- Database: `leet`
--
CREATE DATABASE IF NOT EXISTS `leet` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `leet`;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

--
-- Dumping data for table `pma__bookmark`
--

INSERT INTO `pma__bookmark` (`id`, `dbase`, `user`, `label`, `query`) VALUES
(1, 'banking_dbms', '', 'FORMAT', 'SelECT * FroM `lOan` wheRE Loan_numbeR =''L-15'''),
(2, 'banking_dbms', '', 'format1', 'SELECT `loan_number`, branch_name, amount FROM `loan` WHERE 1'),
(3, 'bankingdbms', 'root', 'b1', 'select customer_name, borrower.loan_number as loan_id, amount from borrower, loan where borrower.loan_number = loan.loan_number'),
(4, 'banking_dbms', '', '1', 'select customer_name, borrower.loan_number as loan_id, amount\r\nfrom borrower, loan\r\nwhere borrower.loan_number = loan.loan_number'),
(5, 'univesity', '', 'salaries of all instructors that are less than the largest salary', 'select distinct T.salary from instructor as T, instructor as S where T.salary < S.salary'),
(6, 'univesity', '', 'avg Salary', 'select avg (salary)\r\nfrom instructor\r\nwhere dept_name= ''Comp. Sci.''');

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'BankingSys', '{"quick_or_custom":"custom","what":"sql","structure_or_data_forced":"0","table_select[]":["account","borrower","branch","customer","depositor","loan"],"table_structure[]":["account","borrower","branch","customer","depositor","loan"],"table_data[]":["account","borrower","branch","customer","depositor","loan"],"output_format":"sendit","filename_template":"@DATABASE@","remember_template":"on","charset":"utf-8","compression":"zip","maxsize":"","codegen_structure_or_data":"data","codegen_format":"0","csv_separator":",","csv_enclosed":"\\"","csv_escaped":"\\"","csv_terminated":"AUTO","csv_null":"NULL","csv_structure_or_data":"data","excel_null":"NULL","excel_edition":"win","excel_structure_or_data":"data","htmlword_structure_or_data":"structure_and_data","htmlword_null":"NULL","json_structure_or_data":"data","latex_caption":"something","latex_structure_or_data":"structure_and_data","latex_structure_caption":"Structure of table @TABLE@","latex_structure_continued_caption":"Structure of table @TABLE@ (continued)","latex_structure_label":"tab:@TABLE@-structure","latex_relation":"something","latex_comments":"something","latex_mime":"something","latex_columns":"something","latex_data_caption":"Content of table @TABLE@","latex_data_continued_caption":"Content of table @TABLE@ (continued)","latex_data_label":"tab:@TABLE@-data","latex_null":"\\\\textit{NULL}","mediawiki_structure_or_data":"structure_and_data","mediawiki_caption":"something","mediawiki_headers":"something","ods_null":"NULL","ods_structure_or_data":"data","odt_structure_or_data":"structure_and_data","odt_relation":"something","odt_comments":"something","odt_mime":"something","odt_columns":"something","odt_null":"NULL","pdf_report_title":"","pdf_structure_or_data":"structure_and_data","phparray_structure_or_data":"data","sql_include_comments":"something","sql_header_comment":"","sql_compatibility":"NONE","sql_structure_or_data":"structure_and_data","sql_create_table":"something","sql_auto_increment":"something","sql_create_view":"something","sql_procedure_function":"something","sql_create_trigger":"something","sql_backquotes":"something","sql_type":"INSERT","sql_insert_syntax":"both","sql_max_query_size":"50000","sql_hex_for_binary":"something","sql_utc_time":"something","texytext_structure_or_data":"structure_and_data","texytext_null":"NULL","xml_structure_or_data":"data","xml_export_events":"something","xml_export_functions":"something","xml_export_procedures":"something","xml_export_tables":"something","xml_export_triggers":"something","xml_export_views":"something","xml_export_contents":"something","yaml_structure_or_data":"data","":null,"lock_tables":null,"as_separate_files":null,"csv_removeCRLF":null,"csv_columns":null,"excel_removeCRLF":null,"excel_columns":null,"htmlword_columns":null,"json_pretty_print":null,"ods_columns":null,"sql_dates":null,"sql_relation":null,"sql_mime":null,"sql_use_transaction":null,"sql_disable_fk":null,"sql_views_as_tables":null,"sql_metadata":null,"sql_create_database":null,"sql_drop_table":null,"sql_if_not_exists":null,"sql_truncate":null,"sql_delayed":null,"sql_ignore":null,"texytext_columns":null}'),
(2, 'root', 'database', 'University_3', '{"quick_or_custom":"quick","what":"sql","structure_or_data_forced":"0","table_select[]":["advisor","classroom","course","department","indefinite","instructor","prereq","section","student","takes","teaches","test","time_slot"],"table_structure[]":["advisor","classroom","course","department","indefinite","instructor","prereq","section","student","takes","teaches","test","time_slot"],"table_data[]":["advisor","classroom","course","department","indefinite","instructor","prereq","section","student","takes","teaches","test","time_slot"],"output_format":"sendit","filename_template":"@DATABASE@","remember_template":"on","charset":"utf-8","compression":"none","maxsize":"","codegen_structure_or_data":"data","codegen_format":"0","csv_separator":",","csv_enclosed":"\\"","csv_escaped":"\\"","csv_terminated":"AUTO","csv_null":"NULL","csv_structure_or_data":"data","excel_null":"NULL","excel_edition":"win","excel_structure_or_data":"data","htmlword_structure_or_data":"structure_and_data","htmlword_null":"NULL","json_structure_or_data":"data","latex_caption":"something","latex_structure_or_data":"structure_and_data","latex_structure_caption":"Structure of table @TABLE@","latex_structure_continued_caption":"Structure of table @TABLE@ (continued)","latex_structure_label":"tab:@TABLE@-structure","latex_relation":"something","latex_comments":"something","latex_mime":"something","latex_columns":"something","latex_data_caption":"Content of table @TABLE@","latex_data_continued_caption":"Content of table @TABLE@ (continued)","latex_data_label":"tab:@TABLE@-data","latex_null":"\\\\textit{NULL}","mediawiki_structure_or_data":"structure_and_data","mediawiki_caption":"something","mediawiki_headers":"something","ods_null":"NULL","ods_structure_or_data":"data","odt_structure_or_data":"structure_and_data","odt_relation":"something","odt_comments":"something","odt_mime":"something","odt_columns":"something","odt_null":"NULL","pdf_report_title":"","pdf_structure_or_data":"structure_and_data","phparray_structure_or_data":"data","sql_include_comments":"something","sql_header_comment":"","sql_compatibility":"NONE","sql_structure_or_data":"structure_and_data","sql_create_table":"something","sql_auto_increment":"something","sql_create_view":"something","sql_procedure_function":"something","sql_create_trigger":"something","sql_backquotes":"something","sql_type":"INSERT","sql_insert_syntax":"both","sql_max_query_size":"50000","sql_hex_for_binary":"something","sql_utc_time":"something","texytext_structure_or_data":"structure_and_data","texytext_null":"NULL","xml_structure_or_data":"data","xml_export_events":"something","xml_export_functions":"something","xml_export_procedures":"something","xml_export_tables":"something","xml_export_triggers":"something","xml_export_views":"something","xml_export_contents":"something","yaml_structure_or_data":"data","":null,"lock_tables":null,"as_separate_files":null,"csv_removeCRLF":null,"csv_columns":null,"excel_removeCRLF":null,"excel_columns":null,"htmlword_columns":null,"json_pretty_print":null,"ods_columns":null,"sql_dates":null,"sql_relation":null,"sql_mime":null,"sql_use_transaction":null,"sql_disable_fk":null,"sql_views_as_tables":null,"sql_metadata":null,"sql_create_database":null,"sql_drop_table":null,"sql_if_not_exists":null,"sql_truncate":null,"sql_delayed":null,"sql_ignore":null,"texytext_columns":null}'),
(3, 'root', 'table', 'Computational DATA', '{"quick_or_custom":"quick","what":"sql","allrows":"1","output_format":"sendit","filename_template":"@TABLE@","remember_template":"on","charset":"utf-8","compression":"none","maxsize":"","codegen_structure_or_data":"data","codegen_format":"0","csv_separator":",","csv_enclosed":"\\"","csv_escaped":"\\"","csv_terminated":"AUTO","csv_null":"NULL","csv_structure_or_data":"data","excel_null":"NULL","excel_edition":"win","excel_structure_or_data":"data","htmlword_structure_or_data":"structure_and_data","htmlword_null":"NULL","json_structure_or_data":"data","latex_caption":"something","latex_structure_or_data":"structure_and_data","latex_structure_caption":"Structure of table @TABLE@","latex_structure_continued_caption":"Structure of table @TABLE@ (continued)","latex_structure_label":"tab:@TABLE@-structure","latex_relation":"something","latex_comments":"something","latex_mime":"something","latex_columns":"something","latex_data_caption":"Content of table @TABLE@","latex_data_continued_caption":"Content of table @TABLE@ (continued)","latex_data_label":"tab:@TABLE@-data","latex_null":"\\\\textit{NULL}","mediawiki_structure_or_data":"data","mediawiki_caption":"something","mediawiki_headers":"something","ods_null":"NULL","ods_structure_or_data":"data","odt_structure_or_data":"structure_and_data","odt_relation":"something","odt_comments":"something","odt_mime":"something","odt_columns":"something","odt_null":"NULL","pdf_report_title":"","pdf_structure_or_data":"data","phparray_structure_or_data":"data","sql_include_comments":"something","sql_header_comment":"","sql_compatibility":"NONE","sql_structure_or_data":"structure_and_data","sql_create_table":"something","sql_auto_increment":"something","sql_create_view":"something","sql_procedure_function":"something","sql_create_trigger":"something","sql_backquotes":"something","sql_type":"INSERT","sql_insert_syntax":"both","sql_max_query_size":"50000","sql_hex_for_binary":"something","sql_utc_time":"something","texytext_structure_or_data":"structure_and_data","texytext_null":"NULL","xml_structure_or_data":"data","xml_export_events":"something","xml_export_functions":"something","xml_export_procedures":"something","xml_export_tables":"something","xml_export_triggers":"something","xml_export_views":"something","xml_export_contents":"something","yaml_structure_or_data":"data","":null,"lock_tables":null,"csv_removeCRLF":null,"csv_columns":null,"excel_removeCRLF":null,"excel_columns":null,"htmlword_columns":null,"json_pretty_print":null,"ods_columns":null,"sql_dates":null,"sql_relation":null,"sql_mime":null,"sql_use_transaction":null,"sql_disable_fk":null,"sql_views_as_tables":null,"sql_metadata":null,"sql_drop_table":null,"sql_if_not_exists":null,"sql_truncate":null,"sql_delayed":null,"sql_ignore":null,"texytext_columns":null}'),
(4, 'root', 'database', 'bankingdbms', '{"quick_or_custom":"quick","what":"sql","structure_or_data_forced":"0","table_select[]":["account","borrower","branch","customer","depositor","loan"],"table_structure[]":["account","borrower","branch","customer","depositor","loan"],"table_data[]":["account","borrower","branch","customer","depositor","loan"],"output_format":"sendit","filename_template":"@DATABASE@","remember_template":"on","charset":"utf-8","compression":"none","maxsize":"","codegen_structure_or_data":"data","codegen_format":"0","csv_separator":",","csv_enclosed":"\\"","csv_escaped":"\\"","csv_terminated":"AUTO","csv_null":"NULL","csv_structure_or_data":"data","excel_null":"NULL","excel_edition":"win","excel_structure_or_data":"data","htmlword_structure_or_data":"structure_and_data","htmlword_null":"NULL","json_structure_or_data":"data","latex_caption":"something","latex_structure_or_data":"structure_and_data","latex_structure_caption":"Structure of table @TABLE@","latex_structure_continued_caption":"Structure of table @TABLE@ (continued)","latex_structure_label":"tab:@TABLE@-structure","latex_relation":"something","latex_comments":"something","latex_mime":"something","latex_columns":"something","latex_data_caption":"Content of table @TABLE@","latex_data_continued_caption":"Content of table @TABLE@ (continued)","latex_data_label":"tab:@TABLE@-data","latex_null":"\\\\textit{NULL}","mediawiki_structure_or_data":"structure_and_data","mediawiki_caption":"something","mediawiki_headers":"something","ods_null":"NULL","ods_structure_or_data":"data","odt_structure_or_data":"structure_and_data","odt_relation":"something","odt_comments":"something","odt_mime":"something","odt_columns":"something","odt_null":"NULL","pdf_report_title":"","pdf_structure_or_data":"structure_and_data","phparray_structure_or_data":"data","sql_include_comments":"something","sql_header_comment":"","sql_compatibility":"NONE","sql_structure_or_data":"structure_and_data","sql_create_table":"something","sql_auto_increment":"something","sql_create_view":"something","sql_procedure_function":"something","sql_create_trigger":"something","sql_backquotes":"something","sql_type":"INSERT","sql_insert_syntax":"both","sql_max_query_size":"50000","sql_hex_for_binary":"something","sql_utc_time":"something","texytext_structure_or_data":"structure_and_data","texytext_null":"NULL","xml_structure_or_data":"data","xml_export_events":"something","xml_export_functions":"something","xml_export_procedures":"something","xml_export_tables":"something","xml_export_triggers":"something","xml_export_views":"something","xml_export_contents":"something","yaml_structure_or_data":"data","":null,"lock_tables":null,"as_separate_files":null,"csv_removeCRLF":null,"csv_columns":null,"excel_removeCRLF":null,"excel_columns":null,"htmlword_columns":null,"json_pretty_print":null,"ods_columns":null,"sql_dates":null,"sql_relation":null,"sql_mime":null,"sql_use_transaction":null,"sql_disable_fk":null,"sql_views_as_tables":null,"sql_metadata":null,"sql_create_database":null,"sql_drop_table":null,"sql_if_not_exists":null,"sql_truncate":null,"sql_delayed":null,"sql_ignore":null,"texytext_columns":null}'),
(5, 'root', 'database', 'University7-8-19', '{"quick_or_custom":"quick","what":"sql","structure_or_data_forced":"0","table_select[]":["advisor","classroom","course","department","indefinite","instructor","prereq","section","student","takes","teaches","test","time_slot"],"table_structure[]":["advisor","classroom","course","department","indefinite","instructor","prereq","section","student","takes","teaches","test","time_slot"],"table_data[]":["advisor","classroom","course","department","indefinite","instructor","prereq","section","student","takes","teaches","test","time_slot"],"output_format":"sendit","filename_template":"@DATABASE@","remember_template":"on","charset":"utf-8","compression":"none","maxsize":"","codegen_structure_or_data":"data","codegen_format":"0","csv_separator":",","csv_enclosed":"\\"","csv_escaped":"\\"","csv_terminated":"AUTO","csv_null":"NULL","csv_structure_or_data":"data","excel_null":"NULL","excel_edition":"win","excel_structure_or_data":"data","htmlword_structure_or_data":"structure_and_data","htmlword_null":"NULL","json_structure_or_data":"data","latex_caption":"something","latex_structure_or_data":"structure_and_data","latex_structure_caption":"Structure of table @TABLE@","latex_structure_continued_caption":"Structure of table @TABLE@ (continued)","latex_structure_label":"tab:@TABLE@-structure","latex_relation":"something","latex_comments":"something","latex_mime":"something","latex_columns":"something","latex_data_caption":"Content of table @TABLE@","latex_data_continued_caption":"Content of table @TABLE@ (continued)","latex_data_label":"tab:@TABLE@-data","latex_null":"\\\\textit{NULL}","mediawiki_structure_or_data":"structure_and_data","mediawiki_caption":"something","mediawiki_headers":"something","ods_null":"NULL","ods_structure_or_data":"data","odt_structure_or_data":"structure_and_data","odt_relation":"something","odt_comments":"something","odt_mime":"something","odt_columns":"something","odt_null":"NULL","pdf_report_title":"","pdf_structure_or_data":"structure_and_data","phparray_structure_or_data":"data","sql_include_comments":"something","sql_header_comment":"","sql_compatibility":"NONE","sql_structure_or_data":"structure_and_data","sql_create_table":"something","sql_auto_increment":"something","sql_create_view":"something","sql_procedure_function":"something","sql_create_trigger":"something","sql_backquotes":"something","sql_type":"INSERT","sql_insert_syntax":"both","sql_max_query_size":"50000","sql_hex_for_binary":"something","sql_utc_time":"something","texytext_structure_or_data":"structure_and_data","texytext_null":"NULL","xml_structure_or_data":"data","xml_export_events":"something","xml_export_functions":"something","xml_export_procedures":"something","xml_export_tables":"something","xml_export_triggers":"something","xml_export_views":"something","xml_export_contents":"something","yaml_structure_or_data":"data","":null,"lock_tables":null,"as_separate_files":null,"csv_removeCRLF":null,"csv_columns":null,"excel_removeCRLF":null,"excel_columns":null,"htmlword_columns":null,"json_pretty_print":null,"ods_columns":null,"sql_dates":null,"sql_relation":null,"sql_mime":null,"sql_use_transaction":null,"sql_disable_fk":null,"sql_views_as_tables":null,"sql_metadata":null,"sql_create_database":null,"sql_drop_table":null,"sql_if_not_exists":null,"sql_truncate":null,"sql_delayed":null,"sql_ignore":null,"texytext_columns":null}'),
(6, 'root', 'server', 'yyyy', '{"quick_or_custom":"quick","what":"sql","db_select[]":["banking_dbms","bankingdata","bankingdbms","camplace _placement","campus_placement","ccet","cities","computational_data","examplll","ipt_exp","phpmyadmin","riya","test","timtables","university_6th","univesity"],"output_format":"sendit","filename_template":"@SERVER@","remember_template":"on","charset":"utf-8","compression":"none","maxsize":"","codegen_structure_or_data":"data","codegen_format":"0","csv_separator":",","csv_enclosed":"\\"","csv_escaped":"\\"","csv_terminated":"AUTO","csv_null":"NULL","csv_structure_or_data":"data","excel_null":"NULL","excel_edition":"win","excel_structure_or_data":"data","htmlword_structure_or_data":"structure_and_data","htmlword_null":"NULL","json_structure_or_data":"data","latex_caption":"something","latex_structure_or_data":"structure_and_data","latex_structure_caption":"Structure of table @TABLE@","latex_structure_continued_caption":"Structure of table @TABLE@ (continued)","latex_structure_label":"tab:@TABLE@-structure","latex_relation":"something","latex_comments":"something","latex_mime":"something","latex_columns":"something","latex_data_caption":"Content of table @TABLE@","latex_data_continued_caption":"Content of table @TABLE@ (continued)","latex_data_label":"tab:@TABLE@-data","latex_null":"\\\\textit{NULL}","mediawiki_structure_or_data":"data","mediawiki_caption":"something","mediawiki_headers":"something","ods_null":"NULL","ods_structure_or_data":"data","odt_structure_or_data":"structure_and_data","odt_relation":"something","odt_comments":"something","odt_mime":"something","odt_columns":"something","odt_null":"NULL","pdf_report_title":"","pdf_structure_or_data":"data","phparray_structure_or_data":"data","sql_include_comments":"something","sql_header_comment":"","sql_compatibility":"NONE","sql_structure_or_data":"structure_and_data","sql_create_table":"something","sql_auto_increment":"something","sql_create_view":"something","sql_procedure_function":"something","sql_create_trigger":"something","sql_backquotes":"something","sql_type":"INSERT","sql_insert_syntax":"both","sql_max_query_size":"50000","sql_hex_for_binary":"something","sql_utc_time":"something","texytext_structure_or_data":"structure_and_data","texytext_null":"NULL","yaml_structure_or_data":"data","":null,"as_separate_files":null,"csv_removeCRLF":null,"csv_columns":null,"excel_removeCRLF":null,"excel_columns":null,"htmlword_columns":null,"json_pretty_print":null,"ods_columns":null,"sql_dates":null,"sql_relation":null,"sql_mime":null,"sql_use_transaction":null,"sql_disable_fk":null,"sql_views_as_tables":null,"sql_metadata":null,"sql_drop_database":null,"sql_drop_table":null,"sql_if_not_exists":null,"sql_truncate":null,"sql_delayed":null,"sql_ignore":null,"texytext_columns":null}'),
(7, 'root', 'table', 'bankingdb2020', '{"quick_or_custom":"quick","what":"sql","allrows":"1","output_format":"sendit","filename_template":"@TABLE@","remember_template":"on","charset":"utf-8","compression":"none","maxsize":"","codegen_structure_or_data":"data","codegen_format":"0","csv_separator":",","csv_enclosed":"\\"","csv_escaped":"\\"","csv_terminated":"AUTO","csv_null":"NULL","csv_structure_or_data":"data","excel_null":"NULL","excel_edition":"win","excel_structure_or_data":"data","htmlword_structure_or_data":"structure_and_data","htmlword_null":"NULL","json_structure_or_data":"data","latex_caption":"something","latex_structure_or_data":"structure_and_data","latex_structure_caption":"Structure of table @TABLE@","latex_structure_continued_caption":"Structure of table @TABLE@ (continued)","latex_structure_label":"tab:@TABLE@-structure","latex_relation":"something","latex_comments":"something","latex_mime":"something","latex_columns":"something","latex_data_caption":"Content of table @TABLE@","latex_data_continued_caption":"Content of table @TABLE@ (continued)","latex_data_label":"tab:@TABLE@-data","latex_null":"\\\\textit{NULL}","mediawiki_structure_or_data":"data","mediawiki_caption":"something","mediawiki_headers":"something","ods_null":"NULL","ods_structure_or_data":"data","odt_structure_or_data":"structure_and_data","odt_relation":"something","odt_comments":"something","odt_mime":"something","odt_columns":"something","odt_null":"NULL","pdf_report_title":"","pdf_structure_or_data":"data","phparray_structure_or_data":"data","sql_include_comments":"something","sql_header_comment":"","sql_compatibility":"NONE","sql_structure_or_data":"structure_and_data","sql_create_table":"something","sql_auto_increment":"something","sql_create_view":"something","sql_procedure_function":"something","sql_create_trigger":"something","sql_backquotes":"something","sql_type":"INSERT","sql_insert_syntax":"both","sql_max_query_size":"50000","sql_hex_for_binary":"something","sql_utc_time":"something","texytext_structure_or_data":"structure_and_data","texytext_null":"NULL","xml_structure_or_data":"data","xml_export_events":"something","xml_export_functions":"something","xml_export_procedures":"something","xml_export_tables":"something","xml_export_triggers":"something","xml_export_views":"something","xml_export_contents":"something","yaml_structure_or_data":"data","":null,"lock_tables":null,"csv_removeCRLF":null,"csv_columns":null,"excel_removeCRLF":null,"excel_columns":null,"htmlword_columns":null,"json_pretty_print":null,"ods_columns":null,"sql_dates":null,"sql_relation":null,"sql_mime":null,"sql_use_transaction":null,"sql_disable_fk":null,"sql_views_as_tables":null,"sql_metadata":null,"sql_drop_table":null,"sql_if_not_exists":null,"sql_truncate":null,"sql_delayed":null,"sql_ignore":null,"texytext_columns":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{"db":"bankingdbms","table":"borrower"},{"db":"bankingdata","table":"borrower"},{"db":"banking_dbms","table":"loan"},{"db":"banking_dbms","table":"borrower"},{"db":"banking_dbms","table":"depositor"},{"db":"bankingdbms","table":"account"},{"db":"bankingdata","table":"loan"},{"db":"bankingdata","table":"depositor"},{"db":"bankingdata","table":"account"},{"db":"bankingdbms","table":"loan"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'CCET', 'EMPLOYEE', '{"sorted_col":"`EMPLOYEE`.`ROOM NO` ASC"}', '2018-06-11 15:54:59'),
('root', 'bankingdbms', 'account', '{"sorted_col":"`account`.`branch_name`  ASC"}', '2019-07-30 06:31:32'),
('root', 'bankingdbms', 'depositor', '{"sorted_col":"`depositor`.`account_number`  DESC"}', '2019-08-08 10:44:36');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2018-06-11 15:40:58', '{"collation_connection":"utf8mb4_unicode_ci"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Database: `riya`
--
CREATE DATABASE IF NOT EXISTS `riya` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `riya`;

-- --------------------------------------------------------

--
-- Table structure for table `dbms`
--

CREATE TABLE `dbms` (
  `name` varchar(30) NOT NULL,
  `age` int(10) NOT NULL,
  `id` varchar(30) NOT NULL,
  `city` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `timtables`
--
CREATE DATABASE IF NOT EXISTS `timtables` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `timtables`;

-- --------------------------------------------------------

--
-- Table structure for table `cse`
--

CREATE TABLE `cse` (
  `Lectuers` varchar(15) NOT NULL,
  `9:00-10:00` varchar(15) NOT NULL COMMENT 'EMPTY',
  `10:00-11:00` varchar(15) NOT NULL COMMENT 'EMPTY',
  `11:00-12:00` varchar(1) NOT NULL COMMENT 'EMPTY'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cse`
--

INSERT INTO `cse` (`Lectuers`, `9:00-10:00`, `10:00-11:00`, `11:00-12:00`) VALUES
('nECESSARY', 'COMPUTER', 'dEL', 'M');
--
-- Database: `university_6th`
--
CREATE DATABASE IF NOT EXISTS `university_6th` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `university_6th`;

-- --------------------------------------------------------

--
-- Table structure for table `advisor`
--

CREATE TABLE `advisor` (
  `s_ID` varchar(5) NOT NULL,
  `i_ID` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advisor`
--

INSERT INTO `advisor` (`s_ID`, `i_ID`) VALUES
('23121', '76543'),
('44553', '22222'),
('45678', '22222'),
('76543', '45565'),
('76653', '98345'),
('98765', '98345'),
('98988', '76766');

-- --------------------------------------------------------

--
-- Table structure for table `classroom`
--

CREATE TABLE `classroom` (
  `building` varchar(15) DEFAULT NULL,
  `room_number` varchar(7) DEFAULT NULL,
  `capacity` decimal(4,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classroom`
--

INSERT INTO `classroom` (`building`, `room_number`, `capacity`) VALUES
('Packard', '101', '500'),
('Painter', '514', '10'),
('Taylor', '3128', '70'),
('Watson', '100', '30'),
('Watson', '120', '50');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` varchar(8) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `credits` decimal(2,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `title`, `dept_name`, `credits`) VALUES
('BIO-101', 'Intro. to Biology', 'Biology', '4'),
('BIO-301', 'Genetics', 'Biology', '4'),
('BIO-399', 'Computational Biology', 'Biology', '3'),
('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', '4'),
('CS-190', 'Game Design', 'Comp. Sci.', '4'),
('CS-315', 'Robotics', 'Comp. Sci.', '3'),
('CS-319', 'Image Processing', 'Comp. Sci.', '3'),
('CS-347', 'Database System Concepts', 'Comp. Sci.', '3'),
('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', '3'),
('FIN-201', 'Investment Banking', 'Finance', '3'),
('HIS-351', 'World History', 'History', '3'),
('MU-199', 'Music Video Production', 'Music', '3'),
('PHY-101', 'Physical Principles', 'Physics', '4');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_name` varchar(20) NOT NULL,
  `building` varchar(15) DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_name`, `building`, `budget`) VALUES
('Biology', 'Watson', '90000.00'),
('Comp. Sci.', 'Taylor', '100000.00'),
('Elec. Eng.', 'Taylor', '85000.00'),
('Finance', 'Painter', '120000.00'),
('History', 'Painter', '50000.00'),
('Music', 'Packard', '80000.00'),
('Physics', 'Watson', '70000.00');

-- --------------------------------------------------------

--
-- Table structure for table `indefinite`
--

CREATE TABLE `indefinite` (
  `ID` int(11) DEFAULT NULL,
  `NAME` varchar(25) DEFAULT NULL,
  `MAKRS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `ID` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`ID`, `name`, `dept_name`, `salary`) VALUES
('10005', 'Dr Dheerendra Singh', 'Computer', '154239.96'),
('10082', 'vicky', 'Computer', '163909.05'),
('10101', 'Srinivasan', 'Computer', '75245.63'),
('10976', 'taran', 'Music', '163909.05'),
('12121', 'Wu', 'Finance', '104186.25'),
('15151', 'Mozart', 'Music', '46305.00'),
('15152', 'Mozart', 'Music', '46305.00'),
('17', 'Wu', 'Computer', '138910.50'),
('22222', 'Einstein', 'Physics', '107879.63'),
('32343', 'El Said', 'History', '69457.50'),
('33456', 'Gold', 'Physics', '100713.38'),
('45565', 'Katz', 'Computer', '86821.88'),
('58583', 'Califieri', 'History', '71772.75'),
('76543', 'Singh', 'Finance', '92610.00'),
('76766', 'Crick', 'Biology', '83349.00'),
('83821', 'Brandt', 'Computer', '104472.90'),
('98345', 'Kim', 'Elec. Eng.', '92610.00');

-- --------------------------------------------------------

--
-- Table structure for table `prereq`
--

CREATE TABLE `prereq` (
  `course_id` varchar(8) NOT NULL,
  `prereq_id` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prereq`
--

INSERT INTO `prereq` (`course_id`, `prereq_id`) VALUES
('BIO-301', 'BIO-101'),
('BIO-399', 'BIO-101'),
('CS-190', 'CS-101'),
('CS-315', 'CS-101'),
('CS-319', 'CS-101'),
('CS-347', 'CS-101'),
('EE-181', 'PHY-101');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `course_id` varchar(8) NOT NULL,
  `sec_id` varchar(8) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `building` varchar(15) DEFAULT NULL,
  `room_number` varchar(7) DEFAULT NULL,
  `time_slot_id` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`course_id`, `sec_id`, `semester`, `year`, `building`, `room_number`, `time_slot_id`) VALUES
('BIO-101', '1', 'Summer', '2009', 'Painter', '514', 'B'),
('BIO-301', '1', 'Summer', '2010', 'Painter', '514', 'A'),
('CS-101', '1', 'Fall', '2009', 'Packard', '101', 'H'),
('CS-101', '1', 'Spring', '2010', 'Packard', '101', 'F'),
('CS-190', '1', 'Spring', '2009', 'Taylor', '3128', 'E'),
('CS-190', '2', 'Spring', '2009', 'Taylor', '3128', 'A'),
('CS-315', '1', 'Spring', '2010', 'Watson', '120', 'D'),
('CS-319', '1', 'Spring', '2010', 'Watson', '100', 'B'),
('CS-319', '2', 'Spring', '2010', 'Taylor', '3128', 'C'),
('CS-347', '1', 'Fall', '2009', 'Taylor', '3128', 'A'),
('EE-181', '1', 'Spring', '2009', 'Taylor', '3128', 'C'),
('FIN-201', '1', 'Spring', '2010', 'Packard', '101', 'B'),
('HIS-351', '1', 'Spring', '2010', 'Painter', '514', 'C'),
('MU-199', '1', 'Spring', '2010', 'Packard', '101', 'D'),
('PHY-101', '1', 'Fall', '2009', 'Watson', '100', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `ID` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `tot_cred` decimal(3,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `takes`
--

CREATE TABLE `takes` (
  `ID` varchar(5) NOT NULL,
  `course_id` varchar(8) NOT NULL,
  `sec_id` varchar(8) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `grade` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `takes`
--

INSERT INTO `takes` (`ID`, `course_id`, `sec_id`, `semester`, `year`, `grade`) VALUES
('00128', 'CS-101', '1', 'Fall', '2009', 'A'),
('00128', 'CS-347', '1', 'Fall', '2009', 'A-'),
('12345', 'CS-101', '1', 'Fall', '2009', 'C'),
('12345', 'CS-190', '2', 'Spring', '2009', 'A'),
('12345', 'CS-315', '1', 'Spring', '2010', 'A'),
('12345', 'CS-347', '1', 'Fall', '2009', 'A'),
('19991', 'HIS-351', '1', 'Spring', '2010', 'B'),
('23121', 'FIN-201', '1', 'Spring', '2010', 'C+'),
('44553', 'PHY-101', '1', 'Fall', '2009', 'B-'),
('45678', 'CS-101', '1', 'Fall', '2009', 'F'),
('45678', 'CS-101', '1', 'Spring', '2010', 'B+'),
('45678', 'CS-319', '1', 'Spring', '2010', 'B'),
('54321', 'CS-101', '1', 'Fall', '2009', 'A-'),
('54321', 'CS-190', '2', 'Spring', '2009', 'B+'),
('55739', 'MU-199', '1', 'Spring', '2010', 'A-'),
('76543', 'CS-101', '1', 'Fall', '2009', 'A'),
('76543', 'CS-319', '2', 'Spring', '2010', 'A'),
('76653', 'EE-181', '1', 'Spring', '2009', 'C'),
('98765', 'CS-101', '1', 'Fall', '2009', 'C-'),
('98765', 'CS-315', '1', 'Spring', '2010', 'B'),
('98988', 'BIO-101', '1', 'Summer', '2009', 'A'),
('98988', 'BIO-301', '1', 'Summer', '2010', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teaches`
--

CREATE TABLE `teaches` (
  `ID` varchar(5) NOT NULL,
  `course_id` varchar(8) NOT NULL,
  `sec_id` varchar(8) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `year` decimal(4,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teaches`
--

INSERT INTO `teaches` (`ID`, `course_id`, `sec_id`, `semester`, `year`) VALUES
('10101', 'CS-101', '1', 'Fall', '2009'),
('10101', 'CS-315', '1', 'Spring', '2010'),
('10101', 'CS-347', '1', 'Fall', '2009'),
('12121', 'FIN-201', '1', 'Spring', '2010'),
('15151', 'MU-199', '1', 'Spring', '2010'),
('22222', 'PHY-101', '1', 'Fall', '2009'),
('32343', 'HIS-351', '1', 'Spring', '2010'),
('45565', 'CS-101', '1', 'Spring', '2010'),
('45565', 'CS-319', '1', 'Spring', '2010'),
('76766', 'BIO-101', '1', 'Summer', '2009'),
('76766', 'BIO-301', '1', 'Summer', '2010'),
('83821', 'CS-190', '1', 'Spring', '2009'),
('83821', 'CS-190', '2', 'Spring', '2009'),
('83821', 'CS-319', '2', 'Spring', '2010'),
('98345', 'EE-181', '1', 'Spring', '2009');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) DEFAULT NULL,
  `name` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`) VALUES
(123, 'Anubhav');

-- --------------------------------------------------------

--
-- Table structure for table `time_slot`
--

CREATE TABLE `time_slot` (
  `time_slot_id` varchar(4) NOT NULL,
  `day` varchar(1) NOT NULL,
  `start_hr` decimal(2,0) NOT NULL,
  `start_min` decimal(2,0) NOT NULL,
  `end_hr` decimal(2,0) DEFAULT NULL,
  `end_min` decimal(2,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `time_slot`
--

INSERT INTO `time_slot` (`time_slot_id`, `day`, `start_hr`, `start_min`, `end_hr`, `end_min`) VALUES
('A', 'F', '8', '0', '8', '50'),
('A', 'M', '8', '0', '8', '50'),
('A', 'W', '8', '0', '8', '50'),
('B', 'F', '9', '0', '9', '50'),
('B', 'M', '9', '0', '9', '50'),
('B', 'W', '9', '0', '9', '50'),
('C', 'F', '11', '0', '11', '50'),
('C', 'M', '11', '0', '11', '50'),
('C', 'W', '11', '0', '11', '50'),
('D', 'F', '13', '0', '13', '50'),
('D', 'M', '13', '0', '13', '50'),
('D', 'W', '13', '0', '13', '50'),
('E', 'R', '10', '30', '11', '45'),
('E', 'T', '10', '30', '11', '45'),
('F', 'R', '14', '30', '15', '45'),
('F', 'T', '14', '30', '15', '45'),
('G', 'F', '16', '0', '16', '50'),
('G', 'M', '16', '0', '16', '50'),
('G', 'W', '16', '0', '16', '50'),
('H', 'W', '10', '0', '12', '30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advisor`
--
ALTER TABLE `advisor`
  ADD PRIMARY KEY (`s_ID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_name`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `prereq`
--
ALTER TABLE `prereq`
  ADD PRIMARY KEY (`course_id`,`prereq_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`course_id`,`sec_id`,`semester`,`year`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `takes`
--
ALTER TABLE `takes`
  ADD PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`);

--
-- Indexes for table `teaches`
--
ALTER TABLE `teaches`
  ADD PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`);

--
-- Indexes for table `time_slot`
--
ALTER TABLE `time_slot`
  ADD PRIMARY KEY (`time_slot_id`,`day`,`start_hr`,`start_min`);
--
-- Database: `univesity`
--
CREATE DATABASE IF NOT EXISTS `univesity` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `univesity`;

-- --------------------------------------------------------

--
-- Table structure for table `advisor`
--

CREATE TABLE `advisor` (
  `s_ID` varchar(5) NOT NULL,
  `i_ID` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advisor`
--

INSERT INTO `advisor` (`s_ID`, `i_ID`) VALUES
('00128', '45565'),
('12345', '10101'),
('23121', '76543'),
('44553', '22222'),
('45678', '22222'),
('76543', '45565'),
('76653', '98345'),
('98765', '98345'),
('98988', '76766');

-- --------------------------------------------------------

--
-- Table structure for table `classroom`
--

CREATE TABLE `classroom` (
  `building` varchar(15) DEFAULT NULL,
  `room_number` varchar(7) DEFAULT NULL,
  `capacity` decimal(4,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classroom`
--

INSERT INTO `classroom` (`building`, `room_number`, `capacity`) VALUES
('Packard', '101', '500'),
('Painter', '514', '10'),
('Taylor', '3128', '70'),
('Watson', '100', '30'),
('Watson', '120', '50');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` varchar(8) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `credits` decimal(2,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `title`, `dept_name`, `credits`) VALUES
('BIO-101', 'Intro. to Biology', 'Biology', '4'),
('BIO-301', 'Genetics', 'Biology', '4'),
('BIO-399', 'Computational Biology', 'Biology', '3'),
('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', '4'),
('CS-190', 'Game Design', 'Comp. Sci.', '4'),
('CS-315', 'Robotics', 'Comp. Sci.', '3'),
('CS-319', 'Image Processing', 'Comp. Sci.', '3'),
('CS-347', 'Database System Concepts', 'Comp. Sci.', '3'),
('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', '3'),
('FIN-201', 'Investment Banking', 'Finance', '3'),
('HIS-351', 'World History', 'History', '3'),
('MU-199', 'Music Video Production', 'Music', '3'),
('PHY-101', 'Physical Principles', 'Physics', '4');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_name` varchar(20) NOT NULL,
  `building` varchar(15) DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_name`, `building`, `budget`) VALUES
('Biology', 'Watson', '90000.00'),
('Comp. Sci.', 'Taylor', '100000.00'),
('Elec. Eng.', 'Taylor', '85000.00'),
('Finance', 'Painter', '120000.00'),
('History', 'Painter', '50000.00'),
('Music', 'Packard', '80000.00'),
('Physics', 'Watson', '70000.00');

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `ID` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`ID`, `name`, `dept_name`, `salary`) VALUES
('10101', 'Srinivasan', 'Comp. Sci.', '87106.23'),
('12121', 'Wu', 'Finance', '113847.14'),
('15151', 'Mozart', 'Music', '53603.82'),
('22222', 'Einstein', 'Physics', '117882.99'),
('32343', 'El Said', 'History', '80405.75'),
('33456', 'Gold', 'Physics', '110052.22'),
('45565', 'Katz', 'Comp. Sci.', '100507.18'),
('58583', 'Califieri', 'History', '83085.93'),
('76543', 'Singh', 'Finance', '105165.61'),
('76766', 'Crick', 'Biology', '96486.88'),
('83821', 'Brandt', 'Comp. Sci.', '114160.36'),
('98345', 'Kim', 'Elec. Eng.', '105165.61');

-- --------------------------------------------------------

--
-- Table structure for table `prereq`
--

CREATE TABLE `prereq` (
  `course_id` varchar(8) NOT NULL,
  `prereq_id` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prereq`
--

INSERT INTO `prereq` (`course_id`, `prereq_id`) VALUES
('BIO-301', 'BIO-101'),
('BIO-399', 'BIO-101'),
('CS-190', 'CS-101'),
('CS-315', 'CS-101'),
('CS-319', 'CS-101'),
('CS-347', 'CS-101'),
('EE-181', 'PHY-101');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `course_id` varchar(8) NOT NULL,
  `sec_id` varchar(8) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `building` varchar(15) DEFAULT NULL,
  `room_number` varchar(7) DEFAULT NULL,
  `time_slot_id` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`course_id`, `sec_id`, `semester`, `year`, `building`, `room_number`, `time_slot_id`) VALUES
('BIO-101', '1', 'Summer', '2009', 'Painter', '514', 'B'),
('BIO-301', '1', 'Summer', '2010', 'Painter', '514', 'A'),
('CS-101', '1', 'Fall', '2009', 'Packard', '101', 'H'),
('CS-101', '1', 'Spring', '2010', 'Packard', '101', 'F'),
('CS-190', '1', 'Spring', '2009', 'Taylor', '3128', 'E'),
('CS-190', '2', 'Spring', '2009', 'Taylor', '3128', 'A'),
('CS-315', '1', 'Spring', '2010', 'Watson', '120', 'D'),
('CS-319', '1', 'Spring', '2010', 'Watson', '100', 'B'),
('CS-319', '2', 'Spring', '2010', 'Taylor', '3128', 'C'),
('CS-347', '1', 'Fall', '2009', 'Taylor', '3128', 'A'),
('EE-181', '1', 'Spring', '2009', 'Taylor', '3128', 'C'),
('FIN-201', '1', 'Spring', '2010', 'Packard', '101', 'B'),
('HIS-351', '1', 'Spring', '2010', 'Painter', '514', 'C'),
('MU-199', '1', 'Spring', '2010', 'Packard', '101', 'D'),
('PHY-101', '1', 'Fall', '2009', 'Watson', '100', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `ID` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `tot_cred` decimal(3,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`ID`, `name`, `dept_name`, `tot_cred`) VALUES
('00128', 'Zhang', 'Comp. Sci.', '102'),
('12345', 'Shankar', 'Comp. Sci.', '32'),
('19991', 'Brandt', 'History', '80'),
('23121', 'Chavez', 'Finance', '110'),
('44553', 'Peltier', 'Physics', '56'),
('45678', 'Levy', 'Physics', '46'),
('54321', 'Williams', 'Comp. Sci.', '54'),
('55739', 'Sanchez', 'Music', '38'),
('70557', 'Snow', 'Physics', '0'),
('76543', 'Brown', 'Comp. Sci.', '58'),
('76653', 'Aoi', 'Elec. Eng.', '60'),
('98765', 'Bourikas', 'Elec. Eng.', '98'),
('98988', 'Tanaka', 'Biology', '120');

-- --------------------------------------------------------

--
-- Table structure for table `takes`
--

CREATE TABLE `takes` (
  `ID` varchar(5) NOT NULL,
  `course_id` varchar(8) NOT NULL,
  `sec_id` varchar(8) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `grade` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `takes`
--

INSERT INTO `takes` (`ID`, `course_id`, `sec_id`, `semester`, `year`, `grade`) VALUES
('00128', 'CS-101', '1', 'Fall', '2009', 'A'),
('00128', 'CS-347', '1', 'Fall', '2009', 'A-'),
('12345', 'CS-101', '1', 'Fall', '2009', 'C'),
('12345', 'CS-190', '2', 'Spring', '2009', 'A'),
('12345', 'CS-315', '1', 'Spring', '2010', 'A'),
('12345', 'CS-347', '1', 'Fall', '2009', 'A'),
('19991', 'HIS-351', '1', 'Spring', '2010', 'B'),
('23121', 'FIN-201', '1', 'Spring', '2010', 'C+'),
('44553', 'PHY-101', '1', 'Fall', '2009', 'B-'),
('45678', 'CS-101', '1', 'Fall', '2009', 'F'),
('45678', 'CS-101', '1', 'Spring', '2010', 'B+'),
('45678', 'CS-319', '1', 'Spring', '2010', 'B'),
('54321', 'CS-101', '1', 'Fall', '2009', 'A-'),
('54321', 'CS-190', '2', 'Spring', '2009', 'B+'),
('55739', 'MU-199', '1', 'Spring', '2010', 'A-'),
('76543', 'CS-101', '1', 'Fall', '2009', 'A'),
('76543', 'CS-319', '2', 'Spring', '2010', 'A'),
('76653', 'EE-181', '1', 'Spring', '2009', 'C'),
('98765', 'CS-101', '1', 'Fall', '2009', 'C-'),
('98765', 'CS-315', '1', 'Spring', '2010', 'B'),
('98988', 'BIO-101', '1', 'Summer', '2009', 'A'),
('98988', 'BIO-301', '1', 'Summer', '2010', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teaches`
--

CREATE TABLE `teaches` (
  `ID` varchar(5) NOT NULL,
  `course_id` varchar(8) NOT NULL,
  `sec_id` varchar(8) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `year` decimal(4,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teaches`
--

INSERT INTO `teaches` (`ID`, `course_id`, `sec_id`, `semester`, `year`) VALUES
('10101', 'CS-101', '1', 'Fall', '2009'),
('10101', 'CS-315', '1', 'Spring', '2010'),
('10101', 'CS-347', '1', 'Fall', '2009'),
('12121', 'FIN-201', '1', 'Spring', '2010'),
('15151', 'MU-199', '1', 'Spring', '2010'),
('22222', 'PHY-101', '1', 'Fall', '2009'),
('32343', 'HIS-351', '1', 'Spring', '2010'),
('45565', 'CS-101', '1', 'Spring', '2010'),
('45565', 'CS-319', '1', 'Spring', '2010'),
('76766', 'BIO-101', '1', 'Summer', '2009'),
('76766', 'BIO-301', '1', 'Summer', '2010'),
('83821', 'CS-190', '1', 'Spring', '2009'),
('83821', 'CS-190', '2', 'Spring', '2009'),
('83821', 'CS-319', '2', 'Spring', '2010'),
('98345', 'EE-181', '1', 'Spring', '2009');

-- --------------------------------------------------------

--
-- Table structure for table `time_slot`
--

CREATE TABLE `time_slot` (
  `time_slot_id` varchar(4) NOT NULL,
  `day` varchar(1) NOT NULL,
  `start_hr` decimal(2,0) NOT NULL,
  `start_min` decimal(2,0) NOT NULL,
  `end_hr` decimal(2,0) DEFAULT NULL,
  `end_min` decimal(2,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `time_slot`
--

INSERT INTO `time_slot` (`time_slot_id`, `day`, `start_hr`, `start_min`, `end_hr`, `end_min`) VALUES
('A', 'F', '8', '0', '8', '50'),
('A', 'M', '8', '0', '8', '50'),
('A', 'W', '8', '0', '8', '50'),
('B', 'F', '9', '0', '9', '50'),
('B', 'M', '9', '0', '9', '50'),
('B', 'W', '9', '0', '9', '50'),
('C', 'F', '11', '0', '11', '50'),
('C', 'M', '11', '0', '11', '50'),
('C', 'W', '11', '0', '11', '50'),
('D', 'F', '13', '0', '13', '50'),
('D', 'M', '13', '0', '13', '50'),
('D', 'W', '13', '0', '13', '50'),
('E', 'R', '10', '30', '11', '45'),
('E', 'T', '10', '30', '11', '45'),
('F', 'R', '14', '30', '15', '45'),
('F', 'T', '14', '30', '15', '45'),
('G', 'F', '16', '0', '16', '50'),
('G', 'M', '16', '0', '16', '50'),
('G', 'W', '16', '0', '16', '50'),
('H', 'W', '10', '0', '12', '30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advisor`
--
ALTER TABLE `advisor`
  ADD PRIMARY KEY (`s_ID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_name`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `prereq`
--
ALTER TABLE `prereq`
  ADD PRIMARY KEY (`course_id`,`prereq_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`course_id`,`sec_id`,`semester`,`year`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `takes`
--
ALTER TABLE `takes`
  ADD PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`);

--
-- Indexes for table `teaches`
--
ALTER TABLE `teaches`
  ADD PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`);

--
-- Indexes for table `time_slot`
--
ALTER TABLE `time_slot`
  ADD PRIMARY KEY (`time_slot_id`,`day`,`start_hr`,`start_min`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
