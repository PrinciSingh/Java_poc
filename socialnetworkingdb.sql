-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 23, 2016 at 02:49 PM
-- Server version: 5.6.28-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `socialnetworkingdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admininfo`
--

CREATE TABLE IF NOT EXISTS `admininfo` (
  `adminid` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admininfo`
--

INSERT INTO `admininfo` (`adminid`, `password`) VALUES
('admin1', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `album_details`
--

CREATE TABLE IF NOT EXISTS `album_details` (
  `image_slno` int(10) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `album_slno` varchar(10) NOT NULL,
  `image_caption` varchar(100) NOT NULL,
  `date_uploaded` varchar(50) NOT NULL,
  `album_cover` varchar(10) NOT NULL,
  PRIMARY KEY (`image_slno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

-- --------------------------------------------------------

--
-- Table structure for table `album_master`
--

CREATE TABLE IF NOT EXISTS `album_master` (
  `album_slno` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `album_title` text NOT NULL,
  `description` text NOT NULL,
  `date_created` varchar(50) NOT NULL,
  `date_updated` varchar(50) NOT NULL,
  `album_access` varchar(20) NOT NULL,
  PRIMARY KEY (`album_slno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

-- --------------------------------------------------------

--
-- Table structure for table `codeinfo`
--

CREATE TABLE IF NOT EXISTS `codeinfo` (
  `emailid` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `post_slno` int(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `msg` text NOT NULL,
  `date_post` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forgotpasswordcode`
--

CREATE TABLE IF NOT EXISTS `forgotpasswordcode` (
  `email` varchar(100) NOT NULL,
  `code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forum_answers`
--

CREATE TABLE IF NOT EXISTS `forum_answers` (
  `fp_slno` int(100) NOT NULL,
  `answered_by` varchar(100) NOT NULL,
  `answer` text NOT NULL,
  `date_post` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forum_post`
--

CREATE TABLE IF NOT EXISTS `forum_post` (
  `fp_slno` int(100) NOT NULL AUTO_INCREMENT,
  `post_by` varchar(100) NOT NULL,
  `post_msg` text NOT NULL,
  `post_date` varchar(100) NOT NULL,
  PRIMARY KEY (`fp_slno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `friend`
--

CREATE TABLE IF NOT EXISTS `friend` (
  `frslno` int(100) NOT NULL AUTO_INCREMENT,
  `sendto` varchar(50) NOT NULL,
  `sendfrom` varchar(50) NOT NULL,
  `joindate` varchar(50) NOT NULL,
  `status` varchar(15) NOT NULL,
  PRIMARY KEY (`frslno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=85 ;

-- --------------------------------------------------------

--
-- Table structure for table `learningzone`
--

CREATE TABLE IF NOT EXISTS `learningzone` (
  `email` varchar(100) NOT NULL,
  `upload_id` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `filename` varchar(100) NOT NULL,
  `date_uploaded` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `like_count`
--

CREATE TABLE IF NOT EXISTS `like_count` (
  `like_slno` int(12) NOT NULL AUTO_INCREMENT,
  `post_slno` int(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`like_slno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Table structure for table `like_counter`
--

CREATE TABLE IF NOT EXISTS `like_counter` (
  `post_slno` varchar(100) NOT NULL,
  `count` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `msg_id` int(100) NOT NULL AUTO_INCREMENT,
  `msg` text NOT NULL,
  `sendto` varchar(100) NOT NULL,
  `sendfrom` varchar(100) NOT NULL,
  `date_send` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Table structure for table `personal`
--

CREATE TABLE IF NOT EXISTS `personal` (
  `email` varchar(50) NOT NULL,
  `address` text,
  `school` varchar(100) DEFAULT NULL,
  `college` varchar(100) DEFAULT NULL,
  `work` varchar(100) DEFAULT NULL,
  `currentcity` varchar(100) DEFAULT NULL,
  `hometown` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `interest` text,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `post_slno` int(12) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `post_msg` text NOT NULL,
  `post_date` varchar(100) NOT NULL,
  `file` varchar(12000) DEFAULT NULL,
  PRIMARY KEY (`post_slno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `privacy_settings`
--

CREATE TABLE IF NOT EXISTS `privacy_settings` (
  `email` varchar(100) NOT NULL,
  `rest_on_email` varchar(10) NOT NULL,
  `rest_on_mobile` varchar(10) NOT NULL,
  `rest_on_photos` varchar(10) NOT NULL,
  `rest_on_friends` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userreg`
--

CREATE TABLE IF NOT EXISTS `userreg` (
  `fname` varchar(50) NOT NULL,
  `lname` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pwd` varchar(40) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `gender` varchar(8) NOT NULL,
  `dob` varchar(30) NOT NULL,
  `cdate` varchar(30) NOT NULL,
  `status` varchar(20) NOT NULL,
  `profilepic` varchar(200) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_status_info`
--

CREATE TABLE IF NOT EXISTS `user_status_info` (
  `email` varchar(100) NOT NULL,
  `reg_date` varchar(100) NOT NULL,
  `last_login_date` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
