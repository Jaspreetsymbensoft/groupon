-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 09, 2014 at 04:32 PM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `grouponasd`
--

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE IF NOT EXISTS `areas` (
  `divisionid` text NOT NULL,
  `id` text NOT NULL,
  `name` text NOT NULL,
  `lat` text NOT NULL,
  `lng` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `areas`
--


-- --------------------------------------------------------

--
-- Table structure for table `deals`
--

CREATE TABLE IF NOT EXISTS `deals` (
  `divisionid` text NOT NULL,
  `type` text NOT NULL,
  `redemptionLocation` text NOT NULL,
  `isMerchandisingDeal` text NOT NULL,
  `channels` text NOT NULL,
  `shortAnnouncementTitle` text NOT NULL,
  `largeImageUrl` text NOT NULL,
  `textAd` text NOT NULL,
  `merchant` text NOT NULL,
  `isGliveInventoryDeal` text NOT NULL,
  `grouponRating` text NOT NULL,
  `smallImageUrl` text NOT NULL,
  `tippedAt` text NOT NULL,
  `isInviteOnly` text NOT NULL,
  `status` text NOT NULL,
  `locationNote` text NOT NULL,
  `uuid` text NOT NULL,
  `limitedQuantityRemaining` text NOT NULL,
  `highlightsHtml` text NOT NULL,
  `grid4ImageUrl` text NOT NULL,
  `fulfillmentMethod` text NOT NULL,
  `startAt` text NOT NULL,
  `salesforceLink` text NOT NULL,
  `isNowDeal` text NOT NULL,
  `endAt` text NOT NULL,
  `mediumImageUrl` text NOT NULL,
  `title` text NOT NULL,
  `tippingPoint` text NOT NULL,
  `isOptionListComplete` text NOT NULL,
  `announcementTitle` text NOT NULL,
  `allowedInCart` text NOT NULL,
  `soldQuantity` text NOT NULL,
  `isTipped` text NOT NULL,
  `dealUrl` text NOT NULL,
  `dealTypes` text NOT NULL,
  `areas` text NOT NULL,
  `vip` text NOT NULL,
  `pitchHtml` text NOT NULL,
  `isSoldOut` text NOT NULL,
  `accessType` text NOT NULL,
  `grid6ImageUrl` text NOT NULL,
  `says` text NOT NULL,
  `isTravelBookableDeal` text NOT NULL,
  `sidebarImageUrl` text NOT NULL,
  `displayOptions` text NOT NULL,
  `tags` text NOT NULL,
  `placementPriority` text NOT NULL,
  `isAutoRefundEnabled` text NOT NULL,
  `division` text NOT NULL,
  `id` text NOT NULL,
  `soldQuantityMessage` text NOT NULL,
  `shippingAddressRequired` text NOT NULL,
  `options` text NOT NULL,
  `finePrint` text NOT NULL,
  `placeholderUrl` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deals`
--


-- --------------------------------------------------------

--
-- Table structure for table `dealslocation`
--

CREATE TABLE IF NOT EXISTS `dealslocation` (
  `dealsid` text NOT NULL,
  `streetAddress2` text NOT NULL,
  `lat` text NOT NULL,
  `city` text NOT NULL,
  `postalCode` text NOT NULL,
  `state` text NOT NULL,
  `lng` text NOT NULL,
  `phoneNumber` text NOT NULL,
  `name` text NOT NULL,
  `id` text NOT NULL,
  `streetAddress1` text NOT NULL,
  `neighborhood` text NOT NULL,
  `country` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dealslocation`
--


-- --------------------------------------------------------

--
-- Table structure for table `division`
--

CREATE TABLE IF NOT EXISTS `division` (
  `id` text NOT NULL,
  `name` text NOT NULL,
  `uuid` text NOT NULL,
  `lat` text NOT NULL,
  `lng` text NOT NULL,
  `isNowCustomerEnabled` text NOT NULL,
  `timezone` text NOT NULL,
  `isPresenceEnabled` text NOT NULL,
  `timezoneIdentifier` text NOT NULL,
  `isReserveEnabled` text NOT NULL,
  `areas` text NOT NULL,
  `defaultLocale` text NOT NULL,
  `timezoneOffsetInSeconds` text NOT NULL,
  `isNowMerchantEnabled` text NOT NULL,
  `country` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `division`
--


-- --------------------------------------------------------

--
-- Table structure for table `divisiondeals`
--

CREATE TABLE IF NOT EXISTS `divisiondeals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `divisionid` text NOT NULL,
  `dealsid` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1045 ;

--
-- Dumping data for table `divisiondeals`
--

