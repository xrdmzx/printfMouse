-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 26, 2015 at 04:53 PM
-- Server version: 5.5.44-0ubuntu0.14.04.1-log
-- PHP Version: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `printfmouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `cage`
--

CREATE TABLE IF NOT EXISTS `cage` (
  `id` int(10) unsigned NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gene` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `count` tinyint(10) unsigned NOT NULL,
  `mice` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `males` tinyint(10) unsigned NOT NULL,
  `females` tinyint(10) unsigned NOT NULL,
  `pups` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `event` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cage`
--

INSERT INTO `cage` (`id`, `username`, `gene`, `count`, `mice`, `males`, `females`, `pups`, `event`) VALUES
(1, 'ron', 'ctgf', 4, '1,2,3,4', 1, 3, 'pup-080815,12', '2015-08-25,tail biopsy'),
(2, 'ron', 'spc', 1, '5', 1, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE IF NOT EXISTS `history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `cage` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mouse` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pups` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `event` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mice`
--

CREATE TABLE IF NOT EXISTS `mice` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gene` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sex` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `event` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mice`
--

INSERT INTO `mice` (`id`, `name`, `gene`, `sex`, `dob`, `event`, `notes`) VALUES
(1, 'ctgf-02102015-1', 'ctgf', 'f', '2015-02-10', '', ''),
(2, 'ctgf-02102015-2', 'ctgf', 'f', '2015-02-10', '', ''),
(3, 'ctgf-02102015-3', 'ctgf', 'f', '2015-02-10', '', ''),
(4, 'ctgf-02102015-4', 'ctgf', 'm', '2015-02-10', '', ''),
(5, 'spc-09112014-1', 'spc', 'm', '2014-09-11', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pups`
--

CREATE TABLE IF NOT EXISTS `pups` (
  `id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gene` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `dox` date NOT NULL,
  `genotyping` date NOT NULL,
  `dod` date NOT NULL,
  `litter` tinyint(100) NOT NULL,
  `event` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pups`
--

INSERT INTO `pups` (`id`, `name`, `gene`, `dob`, `dox`, `genotyping`, `dod`, `litter`, `event`) VALUES
(1, 'ctgf-080815', 'ctgf', '2015-08-08', '0000-00-00', '2015-08-25', '0000-00-00', 12, '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `hash`) VALUES
(1, 'ron', '$1$pc5qxNTJ$u9LcblENoPPH7tjWT5kio1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
