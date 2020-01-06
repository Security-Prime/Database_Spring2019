-- phpMyAdmin SQL Dump
-- version 3.2.0
-- http://www.phpmyadmin.net
--
-- Host: mysql.cs.virginia.edu:3306
-- Generation Time: Mar 02, 2019 at 07:02 PM
-- Server version: 5.5.60
-- PHP Version: 5.4.16

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ja7ad_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `AppliedTo`
--

CREATE TABLE IF NOT EXISTS `AppliedTo` (
  `OrderID` int(10) unsigned NOT NULL,
  `CouponID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AppliedTo`
--


-- --------------------------------------------------------

--
-- Table structure for table `Coupon`
--

CREATE TABLE IF NOT EXISTS `Coupon` (
  `CouponID` int(10) unsigned NOT NULL,
  `CoupCode` int(11) NOT NULL,
  `CoupExpDate` date NOT NULL,
  `CoupDateSent` date NOT NULL,
  PRIMARY KEY (`CouponID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Coupon`
--


-- --------------------------------------------------------

--
-- Table structure for table `Creates`
--

CREATE TABLE IF NOT EXISTS `Creates` (
  `ProdID` int(10) unsigned NOT NULL,
  `ManufacturerID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ProdID`),
  KEY `ManufacturerID` (`ManufacturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Creates`
--


-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE IF NOT EXISTS `Customer` (
  `CusID` int(10) unsigned NOT NULL,
  `CustEmail` varchar(120) NOT NULL,
  `CustFName` varchar(120) NOT NULL,
  `CustLName` varchar(120) NOT NULL,
  PRIMARY KEY (`CusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customer`
--


-- --------------------------------------------------------

--
-- Table structure for table `LineItem_has_Orders`
--

CREATE TABLE IF NOT EXISTS `LineItem_has_Orders` (
  `LineItemID` int(10) unsigned NOT NULL,
  `ProdID` int(10) unsigned NOT NULL,
  `OrderID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`LineItemID`,`ProdID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `LineItem_has_Orders`
--


-- --------------------------------------------------------

--
-- Table structure for table `LineItem_has_product`
--

CREATE TABLE IF NOT EXISTS `LineItem_has_product` (
  `LineItemID` int(10) unsigned NOT NULL,
  `ProdID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`LineItemID`,`ProdID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `LineItem_has_product`
--


-- --------------------------------------------------------

--
-- Table structure for table `Line_Item`
--

CREATE TABLE IF NOT EXISTS `Line_Item` (
  `LineItemID` int(10) unsigned NOT NULL,
  `ProdID` int(10) unsigned NOT NULL,
  `PercentDiscount` double NOT NULL,
  `LineItemQty` int(10) unsigned NOT NULL,
  `CashDiscount` double NOT NULL,
  `CashFlag` tinyint(1) NOT NULL,
  PRIMARY KEY (`LineItemID`,`ProdID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Line_Item`
--


-- --------------------------------------------------------

--
-- Table structure for table `LocatedIn`
--

CREATE TABLE IF NOT EXISTS `LocatedIn` (
  `CustID` int(10) unsigned NOT NULL,
  `LocationID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`CustID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `LocatedIn`
--


-- --------------------------------------------------------

--
-- Table structure for table `Location`
--

CREATE TABLE IF NOT EXISTS `Location` (
  `LocationID` int(10) unsigned NOT NULL,
  `Region` varchar(120) NOT NULL,
  `State` varchar(120) NOT NULL,
  `Zip` int(10) unsigned NOT NULL,
  `Address` varchar(120) NOT NULL,
  `City` varchar(120) NOT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Location`
--


-- --------------------------------------------------------

--
-- Table structure for table `Makes`
--

CREATE TABLE IF NOT EXISTS `Makes` (
  `OrderID` int(10) unsigned NOT NULL,
  `CustID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Makes`
--


-- --------------------------------------------------------

--
-- Table structure for table `Manufacturer`
--

CREATE TABLE IF NOT EXISTS `Manufacturer` (
  `ManufacturerID` int(10) unsigned NOT NULL,
  `ManuName` varchar(120) NOT NULL,
  PRIMARY KEY (`ManufacturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Manufacturer`
--


-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE IF NOT EXISTS `Orders` (
  `OrderID` int(10) unsigned NOT NULL,
  `ShippingCost` decimal(10,0) NOT NULL,
  `TotalTax` decimal(10,0) NOT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Orders`
--


-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE IF NOT EXISTS `Product` (
  `ProdID` int(10) unsigned NOT NULL,
  `ProdCost` double NOT NULL,
  `ProdType` varchar(120) NOT NULL,
  `ProdName` varchar(120) NOT NULL,
  `ProdPrice` double NOT NULL,
  PRIMARY KEY (`ProdID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Product`
--


-- --------------------------------------------------------

--
-- Table structure for table `Promotion`
--

CREATE TABLE IF NOT EXISTS `Promotion` (
  `PromotionID` int(10) unsigned NOT NULL,
  `Detail` varchar(240) NOT NULL,
  PRIMARY KEY (`PromotionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Promotion`
--


-- --------------------------------------------------------

--
-- Table structure for table `Refunds`
--

CREATE TABLE IF NOT EXISTS `Refunds` (
  `ReturnID` int(10) unsigned NOT NULL,
  `ProdID` int(10) unsigned NOT NULL,
  `RefundAmt` double NOT NULL,
  `CustID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ReturnID`,`ProdID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Refunds`
--


-- --------------------------------------------------------

--
-- Table structure for table `Returns`
--

CREATE TABLE IF NOT EXISTS `Returns` (
  `ReturnID` int(10) unsigned NOT NULL,
  `ReturnDate` date NOT NULL,
  `ReturnQty` int(10) unsigned NOT NULL,
  `ProdID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ReturnID`,`ProdID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Returns`
--

