-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2020 at 08:22 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thriftrendybase`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `fname` varchar(60) NOT NULL,
  `lname` varchar(60) NOT NULL,
  `phone1` varchar(60) NOT NULL,
  `phone2` varchar(60) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `pword` varchar(100) NOT NULL,
  `timeStamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `fname`, `lname`, `phone1`, `phone2`, `email`, `pword`, `timeStamp`) VALUES
(1, 'Khalid', 'Khalid', '+254712345678', NULL, 'khalid@driphub.com', '1234', '2020-03-02 10:39:08'),
(2, 'Lenny', 'Nganga', '+254787654321', NULL, 'lenny@driphub.com', '1234', '2020-03-02 10:39:08');

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('e62373f929f1');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `brandName` varchar(20) NOT NULL,
  `brandLogo` varchar(30) NOT NULL,
  `timeStamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `brandName`, `brandLogo`, `timeStamp`) VALUES
(1, 'Nike', 'brands/default.png', '2020-03-02 10:18:32'),
(2, 'Under Armor', 'brands/default.png', '2020-03-02 10:18:59'),
(3, 'Adidas', 'brands/default.png', '2020-03-02 10:19:16');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(20) NOT NULL,
  `picPath` varchar(100) DEFAULT NULL,
  `timeStamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `picPath`, `timeStamp`) VALUES
(1, 'Shirts', 'categories/Shirts.jpg', '2020-03-02 10:33:10'),
(2, 'Shorts', 'categories/Shorts.jpg', '2020-03-02 10:33:10'),
(3, 'T-Shirts', 'categories/T-Shirts.jpg', '2020-03-02 10:33:10'),
(4, 'Trousers', 'categories/Trousers.jpg', '2020-03-02 10:33:10'),
(5, 'Socks', 'categories/Socks.jpg', '2020-03-02 10:33:10'),
(6, 'Belts', 'categories/Belts.jpg', '2020-03-02 10:33:10'),
(7, 'Shoes', 'categories/Shoes.jpg', '2020-03-02 10:33:10'),
(8, 'Sandals', 'categories/Sandals.jpg', '2020-03-02 10:33:10'),
(9, 'Jeans', 'categories/Jeans.jpg', '2020-03-02 10:33:10'),
(10, 'Scarfs', 'categories/Scarfs.jpg', '2020-03-02 10:33:10'),
(11, 'Gloves', 'categories/Gloves.jpg', '2020-03-02 10:33:10'),
(12, 'Hats', 'categories/Hats.jpg', '2020-03-02 10:33:10'),
(13, 'Jackets', 'categories/Jackets.jpg', '2020-03-02 10:33:10'),
(14, 'Sweaters', 'categories/Sweaters.jpg', '2020-03-02 10:33:10'),
(15, 'Watches', 'categories/Watches.jpg', '2020-03-02 10:33:10'),
(16, 'Suits', 'categories/Suits.jpg', '2020-03-02 10:33:10'),
(17, 'Blazers', 'categories/Blazers.jpg', '2020-03-02 10:33:10'),
(18, 'Kanzu', 'categories/Kanzu.jpg', '2020-03-02 10:33:10'),
(19, 'Underwears', 'categories/Underwears.jpg', '2020-03-02 10:33:10'),
(20, 'Sweatpants', 'categories/Sweatpants.jpg', '2020-03-10 14:42:19');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `fname` varchar(60) NOT NULL,
  `lname` varchar(60) NOT NULL,
  `phone1` varchar(60) NOT NULL,
  `phone2` varchar(60) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `pword` varchar(100) NOT NULL,
  `address` varchar(60) DEFAULT NULL,
  `additionalInfo` varchar(60) DEFAULT NULL,
  `city` varchar(60) DEFAULT NULL,
  `region` varchar(60) DEFAULT NULL,
  `timeStamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `fname`, `lname`, `phone1`, `phone2`, `email`, `pword`, `address`, `additionalInfo`, `city`, `region`, `timeStamp`) VALUES
(1, 'John', 'Doe', '+254712345678', NULL, 'Doe@gmail.com', '12345678', NULL, NULL, NULL, NULL, '2020-03-02 10:50:42'),
(2, 'Jane', 'Smith', '+254712345678', NULL, 'jane@gmail.com', '87654321', NULL, NULL, NULL, NULL, '2020-03-02 10:50:42'),
(3, 'Abc', 'Def', '123456789', NULL, 'abc@def.xyz', 'a', NULL, NULL, NULL, NULL, '2020-07-29 12:51:53'),
(4, 'qwe', 'rty', '12344321', NULL, 'qwe@rty.com', '$2b$12$tF7euQNR8kZ3BUNZrs6WmesNJjnS0iJbam8v92nkKnxU9TyV1Brxy', NULL, NULL, NULL, NULL, '2020-07-29 13:38:05'),
(5, 'lenny', 'len', '12344321', NULL, 'lennylen@gmail.com', '$2b$12$NdmJAg6LYzJ.9J8VeI6ZFO9QCSGM9TRfXqe1PPZl/6sV3O37Zaamm', NULL, NULL, NULL, NULL, '2020-07-30 11:49:39'),
(6, 'n', 'mm', '12344321', NULL, 'n@gmail.com', '$2b$12$rDHutNz77sP.fyfYQMfzMOfv.8saAFepyJiI0XPKmgIAd.8Hot1Iu', NULL, NULL, NULL, NULL, '2020-07-30 12:29:06'),
(7, 'HP', 'not-a-dell', '430', '034', 'hp@gmail.com', '$2b$12$qab4T8R0jug5mR7EAPJ72.tsfUzt8TbfaSpt2OKblNsYu/53.GpjW', 'Black Rose', 'House 18', 'Nairobi', 'Kilimani', '2020-08-12 11:56:37'),
(8, 'Lenny', 'Ng\'ang\'a', '0791485000', '0791485001', 'lennylen254@gmail.com', '$2b$12$BuIZOIGMujeVxlAAtTd3pumcMokNNVUQLqFBRiGGb2pil3wM6pT/u', 'Black Rose', 'Developer\r\n\r\n@codewithlenny', 'Nairobi', 'Kilimani', '2020-08-26 20:14:55'),
(9, 'Lenny', 'Ng\'ang\'a', '0712345678', NULL, 'lennylen2020@gmail.com', '$2b$12$ug.kCcv6Po6GFYBnUGOJ6O2ON6GqNzKGNmovEU4Z/lmkoadVO0/MS', '30178-00100', 'My items should be delivered to Starehe Boy\'s Centre', 'Nairobi', 'Starehe', '2020-08-30 16:24:04');

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `id` int(11) NOT NULL,
  `materialName` varchar(20) NOT NULL,
  `timeStamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`id`, `materialName`, `timeStamp`) VALUES
(1, 'Cotton', '2020-03-02 10:34:56'),
(2, 'Wool', '2020-03-02 10:34:56'),
(3, 'Silk', '2020-03-02 10:34:56');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `size` varchar(60) NOT NULL,
  `color` varchar(60) DEFAULT NULL,
  `fulfilledDate` varchar(20) NOT NULL,
  `timeStamp` datetime DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `timeStamp` datetime DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `transactionCode` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `transactionCode` varchar(60) NOT NULL,
  `paidTotal` int(11) NOT NULL,
  `shipperPrice` int(11) NOT NULL,
  `dripQuota` int(11) NOT NULL,
  `dripQuotaTotal` int(11) NOT NULL,
  `sellerReturns` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `timeStamp` datetime DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `adultOrNot` int(11) NOT NULL,
  `availableColor` varchar(100) NOT NULL,
  `availableDiscount` int(11) DEFAULT NULL,
  `availableGender` varchar(25) NOT NULL,
  `availableQuantity` int(11) NOT NULL,
  `availableSize` varchar(20) NOT NULL,
  `brandid` int(11) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `materialid` int(11) DEFAULT NULL,
  `picturePath` varchar(100) NOT NULL,
  `productDescription` varchar(255) NOT NULL,
  `productName` varchar(60) NOT NULL,
  `productPrice` int(11) NOT NULL,
  `sellerid` int(11) DEFAULT NULL,
  `timeStamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `adultOrNot`, `availableColor`, `availableDiscount`, `availableGender`, `availableQuantity`, `availableSize`, `brandid`, `categoryid`, `discount`, `materialid`, `picturePath`, `productDescription`, `productName`, `productPrice`, `sellerid`, `timeStamp`) VALUES
(1, 1, '\'red\', \'green\'', NULL, 'male', 21, 'XXL', 2, 18, NULL, 1, 'male/Kanzu/Kanzu.jpg', 'Coolest on the market', 'Cool Kanzu', 6404, 1, '2020-03-11 11:06:23'),
(2, 0, '\'green\',\'pink\'', NULL, 'male', 45, 'XL', 2, 16, NULL, 1, 'male/Suits/Suits.jpg', 'Coolest on the market', 'Cool Suits', 1061, 1, '2020-03-11 11:06:24'),
(3, 1, 'pink', NULL, 'unisex', 47, 'X', 1, 18, NULL, 1, 'male/Kanzu/Kanzu.jpg', 'Coolest on the market', 'Cool Kanzu', 5392, 1, '2020-03-11 11:06:24'),
(4, 1, 'black', NULL, 'male', 5, 'S', 3, 19, NULL, 2, 'male/Underwears/Underwears.jpg', 'Coolest on the market', 'Cool Underwears', 1984, 1, '2020-03-11 11:06:24'),
(5, 1, '\'red\', \'green\'', NULL, 'female', 30, '\'XL\',\'XXL\'', 2, 8, NULL, 1, 'female/Sandals/Sandals.jpg', 'Coolest on the market', 'Cool Sandals', 2368, 1, '2020-03-11 11:06:24'),
(6, 1, 'pink', NULL, 'unisex', 20, 'XXL', 2, 3, NULL, 2, 'male/T-Shirts/T-Shirts.jpg', 'Coolest on the market', 'Cool T-Shirts', 1483, 1, '2020-03-11 11:12:22'),
(7, 0, 'yellow', NULL, 'unisex', 23, '\'XL\',\'XXL\'', 2, 15, NULL, 1, 'male/Watches/Watches.jpg', 'Coolest on the market', 'Cool Watches', 4928, 1, '2020-03-11 11:12:23'),
(8, 1, 'black', NULL, 'male', 41, '\'XL\',\'XXL\'', 1, 7, NULL, 1, 'male/Shoes/Shoes.jpg', 'Coolest on the market', 'Cool Shoes', 1924, 1, '2020-03-11 11:12:23'),
(9, 1, '\'white\', \'black\'', NULL, 'female', 49, '\'S\',\'X\'', 3, 12, NULL, 3, 'female/Hats/Hats.jpg', 'Coolest on the market', 'Cool Hats', 4559, 1, '2020-03-11 11:12:23'),
(10, 1, 'white', NULL, 'unisex', 16, '\'S\',\'X\'', 2, 1, NULL, 2, 'male/Shirts/Shirts.jpg', 'Coolest on the market', 'Cool Shirts', 1416, 1, '2020-03-11 11:12:23'),
(11, 0, 'red', NULL, 'female', 18, 'XL', 3, 1, NULL, 1, 'female/Shirts/Shirts.jpg', 'Coolest on the market', 'Cool Shirts', 5210, 1, '2020-03-11 11:12:23'),
(12, 1, '\'green\',\'pink\'', NULL, 'unisex', 31, 'X', 2, 3, NULL, 2, 'male/T-Shirts/T-Shirts.jpg', 'Coolest on the market', 'Cool T-Shirts', 2077, 1, '2020-03-11 11:12:23'),
(13, 0, 'yellow', NULL, 'male', 14, '\'XL\',\'XXL\'', 1, 17, NULL, 2, 'male/Blazers/Blazers.jpg', 'Coolest on the market', 'Cool Blazers', 1829, 1, '2020-03-11 11:12:23'),
(14, 0, 'black', NULL, 'female', 6, 'S', 3, 14, NULL, 3, 'female/Sweaters/Sweaters.jpg', 'Coolest on the market', 'Cool Sweaters', 3773, 1, '2020-03-11 11:12:24'),
(15, 0, 'yellow', NULL, 'unisex', 43, 'X', 1, 3, NULL, 2, 'male/T-Shirts/T-Shirts.jpg', 'Coolest on the market', 'Cool T-Shirts', 2658, 1, '2020-03-11 11:12:24'),
(16, 0, 'blue', NULL, 'female', 41, '\'XL\',\'XXL\'', 3, 13, NULL, 2, 'female/Jackets/Jackets.jpg', 'Coolest on the market', 'Cool Jackets', 5730, 1, '2020-03-11 11:12:24'),
(17, 0, 'yellow', NULL, 'female', 5, 'S', 2, 5, NULL, 1, 'female/Socks/Socks.jpg', 'Coolest on the market', 'Cool Socks', 6105, 1, '2020-03-11 11:12:24'),
(18, 0, '\'white\', \'black\'', NULL, 'unisex', 9, 'S', 1, 17, NULL, 1, 'male/Blazers/Blazers.jpg', 'Coolest on the market', 'Cool Blazers', 668, 1, '2020-03-11 11:12:24'),
(19, 1, 'white', NULL, 'male', 44, 'XXL', 1, 5, NULL, 2, 'male/Socks/Socks.jpg', 'Coolest on the market', 'Cool Socks', 3435, 1, '2020-03-11 11:12:24'),
(20, 1, 'pink', NULL, 'female', 8, 'S', 1, 16, NULL, 3, 'female/Suits/Suits.jpg', 'Coolest on the market', 'Cool Suits', 954, 1, '2020-03-11 11:12:24'),
(21, 0, 'pink', NULL, 'unisex', 22, '\'XL\',\'XXL\'', 2, 4, NULL, 3, 'male/Trousers/Trousers.jpg', 'Coolest on the market', 'Cool Trousers', 4608, 1, '2020-03-11 11:12:24'),
(22, 1, '\'green\',\'pink\'', NULL, 'female', 25, '\'X\', \'XL\'', 2, 1, NULL, 2, 'female/Shirts/Shirts.jpg', 'Coolest on the market', 'Cool Shirts', 2067, 1, '2020-03-11 11:12:25'),
(23, 1, '\'white\', \'black\'', NULL, 'female', 23, 'S', 1, 2, NULL, 3, 'female/Shorts/Shorts.jpg', 'Coolest on the market', 'Cool Shorts', 7138, 1, '2020-03-11 11:12:25'),
(24, 1, 'yellow', NULL, 'unisex', 39, '\'XL\',\'XXL\'', 2, 5, NULL, 1, 'male/Socks/Socks.jpg', 'Coolest on the market', 'Cool Socks', 1814, 1, '2020-03-11 11:12:25'),
(25, 1, '\'red\', \'green\'', NULL, 'unisex', 39, 'XL', 3, 3, NULL, 3, 'male/T-Shirts/T-Shirts.jpg', 'Coolest on the market', 'Cool T-Shirts', 3423, 1, '2020-03-11 11:12:25'),
(26, 0, 'pink', NULL, 'male', 42, 'S', 1, 16, NULL, 2, 'male/Suits/Suits.jpg', 'Coolest on the market', 'Cool Suits', 1719, 1, '2020-03-11 11:12:25'),
(27, 0, 'green', NULL, 'unisex', 47, 'X', 2, 3, NULL, 2, 'male/T-Shirts/T-Shirts.jpg', 'Coolest on the market', 'Cool T-Shirts', 1628, 1, '2020-03-11 11:12:25'),
(28, 1, '\'green\',\'pink\'', NULL, 'female', 15, 'S', 1, 13, NULL, 3, 'female/Jackets/Jackets.jpg', 'Coolest on the market', 'Cool Jackets', 6055, 1, '2020-03-11 11:12:25'),
(29, 0, 'yellow', NULL, 'unisex', 27, '\'X\', \'XL\'', 2, 8, NULL, 3, 'male/Sandals/Sandals.jpg', 'Coolest on the market', 'Cool Sandals', 3834, 1, '2020-03-11 11:12:25'),
(30, 1, 'white', NULL, 'unisex', 12, 'XXL', 3, 4, NULL, 3, 'male/Trousers/Trousers.jpg', 'Coolest on the market', 'Cool Trousers', 234, 1, '2020-03-11 11:12:26'),
(31, 1, 'red', NULL, 'unisex', 28, 'XXL', 1, 2, NULL, 3, 'male/Shorts/Shorts.jpg', 'Coolest on the market', 'Cool Shorts', 2294, 1, '2020-03-11 11:12:26'),
(32, 0, 'yellow', NULL, 'unisex', 14, '\'S\',\'X\'', 1, 15, NULL, 1, 'male/Watches/Watches.jpg', 'Coolest on the market', 'Cool Watches', 6836, 1, '2020-03-11 11:12:26'),
(33, 1, 'blue', NULL, 'male', 23, 'XL', 2, 9, NULL, 1, 'male/Jeans/Jeans.jpg', 'Coolest on the market', 'Cool Jeans', 5724, 1, '2020-03-11 11:12:26'),
(34, 1, 'yellow', NULL, 'female', 15, 'XL', 1, 19, NULL, 1, 'female/Underwears/Underwears.jpg', 'Coolest on the market', 'Cool Underwears', 1077, 1, '2020-03-11 11:12:26'),
(35, 0, 'black', NULL, 'male', 36, 'S', 2, 7, NULL, 3, 'male/Shoes/Shoes.jpg', 'Coolest on the market', 'Cool Shoes', 156, 1, '2020-03-11 11:12:26'),
(36, 0, '\'green\',\'pink\'', NULL, 'female', 11, '\'S\',\'X\'', 3, 4, NULL, 1, 'female/Trousers/Trousers.jpg', 'Coolest on the market', 'Cool Trousers', 6619, 1, '2020-03-11 11:12:26'),
(37, 1, '\'red\', \'green\'', NULL, 'unisex', 40, 'X', 3, 9, NULL, 3, 'male/Jeans/Jeans.jpg', 'Coolest on the market', 'Cool Jeans', 4754, 1, '2020-03-11 11:12:26'),
(38, 0, 'yellow', NULL, 'male', 27, 'S', 3, 1, NULL, 1, 'male/Shirts/Shirts.jpg', 'Coolest on the market', 'Cool Shirts', 2336, 1, '2020-03-11 11:12:26'),
(39, 1, 'pink', NULL, 'female', 21, '\'S\',\'X\'', 1, 11, NULL, 2, 'female/Gloves/Gloves.jpg', 'Coolest on the market', 'Cool Gloves', 5371, 1, '2020-03-11 11:12:27'),
(40, 0, 'black', NULL, 'unisex', 36, 'XXL', 2, 11, NULL, 3, 'male/Gloves/Gloves.jpg', 'Coolest on the market', 'Cool Gloves', 3975, 1, '2020-03-11 11:12:27'),
(41, 0, 'yellow', NULL, 'female', 43, 'XL', 2, 18, NULL, 1, 'female/Kanzu/Kanzu.jpg', 'Coolest on the market', 'Cool Kanzu', 3629, 1, '2020-03-11 11:12:27'),
(42, 0, 'black', NULL, 'unisex', 5, 'XXL', 2, 13, NULL, 2, 'male/Jackets/Jackets.jpg', 'Coolest on the market', 'Cool Jackets', 4093, 1, '2020-03-11 11:12:27'),
(43, 1, 'pink', NULL, 'male', 12, 'X', 3, 14, NULL, 1, 'male/Sweaters/Sweaters.jpg', 'Coolest on the market', 'Cool Sweaters', 275, 1, '2020-03-11 11:12:27'),
(44, 0, '\'red\', \'green\'', NULL, 'female', 35, 'S', 2, 9, NULL, 3, 'female/Jeans/Jeans.jpg', 'Coolest on the market', 'Cool Jeans', 5938, 1, '2020-03-11 11:12:27'),
(45, 1, 'pink', NULL, 'unisex', 6, 'S', 1, 18, NULL, 2, 'male/Kanzu/Kanzu.jpg', 'Coolest on the market', 'Cool Kanzu', 1627, 1, '2020-03-11 11:12:27'),
(46, 1, 'blue', NULL, 'female', 25, '\'S\',\'X\'', 3, 11, NULL, 3, 'female/Gloves/Gloves.jpg', 'Coolest on the market', 'Cool Gloves', 282, 1, '2020-03-11 11:12:27'),
(47, 1, 'white', NULL, 'male', 37, 'XL', 2, 1, NULL, 3, 'male/Shirts/Shirts.jpg', 'Coolest on the market', 'Cool Shirts', 1106, 1, '2020-03-11 11:12:28'),
(48, 1, 'yellow', NULL, 'male', 43, 'XL', 1, 14, NULL, 2, 'male/Sweaters/Sweaters.jpg', 'Coolest on the market', 'Cool Sweaters', 2619, 1, '2020-03-11 11:12:28'),
(49, 0, 'red', NULL, 'male', 32, 'X', 1, 16, NULL, 1, 'male/Suits/Suits.jpg', 'Coolest on the market', 'Cool Suits', 1274, 1, '2020-03-11 11:12:28'),
(50, 0, 'blue', NULL, 'male', 9, 'XL', 3, 16, NULL, 2, 'male/Suits/Suits.jpg', 'Coolest on the market', 'Cool Suits', 3324, 1, '2020-03-11 11:12:28'),
(51, 0, 'yellow', NULL, 'female', 3, 'S', 2, 4, NULL, 3, 'female/Trousers/Trousers.jpg', 'Coolest on the market', 'Cool Trousers', 1902, 1, '2020-03-11 11:12:28'),
(52, 1, 'yellow', NULL, 'unisex', 43, 'X', 1, 7, NULL, 1, 'male/Shoes/Shoes.jpg', 'Coolest on the market', 'Cool Shoes', 5113, 1, '2020-03-11 11:12:28'),
(53, 1, 'black', NULL, 'female', 29, '\'X\', \'XL\'', 3, 7, NULL, 2, 'female/Shoes/Shoes.jpg', 'Coolest on the market', 'Cool Shoes', 1118, 1, '2020-03-11 11:12:28'),
(54, 1, 'yellow', NULL, 'male', 48, 'XL', 3, 18, NULL, 3, 'male/Kanzu/Kanzu.jpg', 'Coolest on the market', 'Cool Kanzu', 7374, 1, '2020-03-11 11:12:28'),
(55, 1, 'black', NULL, 'male', 18, 'XXL', 2, 15, NULL, 3, 'male/Watches/Watches.jpg', 'Coolest on the market', 'Cool Watches', 331, 1, '2020-03-11 11:12:28'),
(56, 0, 'black', NULL, 'unisex', 34, 'X', 3, 17, NULL, 2, 'male/Blazers/Blazers.jpg', 'Coolest on the market', 'Cool Blazers', 78, 1, '2020-03-11 11:12:29'),
(57, 0, 'blue', NULL, 'male', 26, 'XXL', 3, 3, NULL, 2, 'male/T-Shirts/T-Shirts.jpg', 'Coolest on the market', 'Cool T-Shirts', 3501, 1, '2020-03-11 11:12:29'),
(58, 0, '\'red\', \'green\'', NULL, 'unisex', 27, '\'S\',\'X\'', 3, 8, NULL, 1, 'male/Sandals/Sandals.jpg', 'Coolest on the market', 'Cool Sandals', 3531, 1, '2020-03-11 11:12:29'),
(59, 0, '\'white\', \'black\'', NULL, 'male', 10, 'XL', 3, 20, NULL, 1, 'male/Sweatpants/Sweatpants.jpg', 'Coolest on the market', 'Cool Sweatpants', 6107, 1, '2020-03-11 11:12:29'),
(60, 0, '\'green\',\'pink\'', NULL, 'female', 41, 'XXL', 3, 16, NULL, 3, 'female/Suits/Suits.jpg', 'Coolest on the market', 'Cool Suits', 2098, 1, '2020-03-11 11:12:29'),
(61, 0, 'blue', NULL, 'unisex', 38, 'XXL', 1, 5, NULL, 3, 'male/Socks/Socks.jpg', 'Coolest on the market', 'Cool Socks', 2950, 1, '2020-03-11 11:12:29'),
(62, 1, 'yellow', NULL, 'male', 12, 'S', 2, 10, NULL, 3, 'male/Scarfs/Scarfs.jpg', 'Coolest on the market', 'Cool Scarfs', 7111, 1, '2020-03-11 11:12:30'),
(63, 1, 'red', NULL, 'male', 2, 'XL', 3, 2, NULL, 2, 'male/Shorts/Shorts.jpg', 'Coolest on the market', 'Cool Shorts', 3430, 1, '2020-03-11 11:12:30'),
(64, 0, 'green', NULL, 'female', 25, '\'X\', \'XL\'', 1, 3, NULL, 1, 'female/T-Shirts/T-Shirts.jpg', 'Coolest on the market', 'Cool T-Shirts', 2209, 1, '2020-03-11 11:12:30'),
(65, 1, 'red', NULL, 'male', 45, '\'S\',\'X\'', 3, 20, NULL, 1, 'male/Sweatpants/Sweatpants.jpg', 'Coolest on the market', 'Cool Sweatpants', 5771, 1, '2020-03-11 11:12:30'),
(66, 0, 'pink', NULL, 'female', 48, 'XL', 2, 5, NULL, 1, 'female/Socks/Socks.jpg', 'Coolest on the market', 'Cool Socks', 7411, 1, '2020-03-11 11:12:30'),
(67, 0, 'yellow', NULL, 'male', 20, 'X', 1, 2, NULL, 2, 'male/Shorts/Shorts.jpg', 'Coolest on the market', 'Cool Shorts', 3727, 1, '2020-03-11 11:12:30'),
(68, 1, '\'red\', \'green\'', NULL, 'unisex', 27, 'XL', 2, 8, NULL, 3, 'male/Sandals/Sandals.jpg', 'Coolest on the market', 'Cool Sandals', 5358, 1, '2020-03-11 11:12:30'),
(69, 1, 'yellow', NULL, 'male', 37, 'X', 3, 14, NULL, 3, 'male/Sweaters/Sweaters.jpg', 'Coolest on the market', 'Cool Sweaters', 4188, 1, '2020-03-11 11:12:30'),
(70, 0, 'red', NULL, 'female', 5, 'XL', 2, 8, NULL, 2, 'female/Sandals/Sandals.jpg', 'Coolest on the market', 'Cool Sandals', 5221, 1, '2020-03-11 11:12:30'),
(71, 1, 'yellow', NULL, 'male', 48, '\'XL\',\'XXL\'', 2, 4, NULL, 3, 'male/Trousers/Trousers.jpg', 'Coolest on the market', 'Cool Trousers', 1829, 1, '2020-03-11 11:12:31'),
(72, 1, 'red', NULL, 'unisex', 22, '\'XL\',\'XXL\'', 1, 16, NULL, 3, 'male/Suits/Suits.jpg', 'Coolest on the market', 'Cool Suits', 552, 1, '2020-03-11 11:12:31'),
(73, 0, '\'green\',\'pink\'', NULL, 'female', 43, 'XXL', 1, 3, NULL, 1, 'female/T-Shirts/T-Shirts.jpg', 'Coolest on the market', 'Cool T-Shirts', 4690, 1, '2020-03-11 11:12:31'),
(74, 1, '\'pink\',\'yellow\',\'black\',\'grey\',\'orange\',\'red\'', NULL, 'male', 49, '\'X\',\'XXL\',\'L\'', 2, 19, NULL, 1, 'male/Underwears/Underwears.jpg', 'Coolest on the market', 'Cool Underwear', 1215, 1, '2020-03-11 11:12:31'),
(75, 0, 'black', NULL, 'unisex', 11, 'S', 2, 12, NULL, 3, 'male/Hats/Hats.jpg', 'Coolest on the market', 'Cool Hats', 1864, 1, '2020-03-11 11:12:31'),
(76, 0, 'blue', NULL, 'female', 34, 'XXL', 2, 4, NULL, 2, 'female/Trousers/Trousers.jpg', 'Coolest on the market', 'Cool Trousers', 3242, 1, '2020-03-11 11:12:31'),
(77, 0, 'green', NULL, 'unisex', 22, '\'X\', \'XL\'', 2, 12, NULL, 3, 'male/Hats/Hats.jpg', 'Coolest on the market', 'Cool Hats', 3713, 1, '2020-03-11 11:12:31'),
(78, 1, '\'white\', \'black\'', NULL, 'male', 29, '\'XL\',\'XXL\'', 3, 7, NULL, 1, 'male/Shoes/Shoes.jpg', 'Coolest on the market', 'Cool Shoes', 2485, 1, '2020-03-11 11:12:31'),
(79, 1, 'white', NULL, 'female', 36, 'S', 3, 14, NULL, 2, 'female/Sweaters/Sweaters.jpg', 'Coolest on the market', 'Cool Sweaters', 1160, 1, '2020-03-11 11:12:31'),
(80, 0, '\'red\', \'green\'', NULL, 'male', 4, 'X', 2, 20, NULL, 3, 'male/Sweatpants/Sweatpants.jpg', 'Coolest on the market', 'Cool Sweatpants', 5027, 1, '2020-03-11 11:12:32'),
(81, 0, 'white', NULL, 'female', 2, 'XXL', 2, 14, NULL, 3, 'female/Sweaters/Sweaters.jpg', 'Coolest on the market', 'Cool Sweaters', 429, 1, '2020-03-11 11:12:32'),
(82, 1, '\'white\', \'black\'', NULL, 'female', 10, 'X', 2, 11, NULL, 2, 'female/Gloves/Gloves.jpg', 'Coolest on the market', 'Cool Gloves', 1168, 1, '2020-03-11 11:12:32'),
(83, 1, 'green', NULL, 'unisex', 32, 'X', 2, 12, NULL, 3, 'male/Hats/Hats.jpg', 'Coolest on the market', 'Cool Hats', 6814, 1, '2020-03-11 11:12:32'),
(84, 0, 'red', NULL, 'female', 45, '\'XL\',\'XXL\'', 3, 11, NULL, 2, 'female/Gloves/Gloves.jpg', 'Coolest on the market', 'Cool Gloves', 488, 1, '2020-03-11 11:12:32'),
(85, 1, 'red', NULL, 'unisex', 9, '\'X\', \'XL\'', 3, 13, NULL, 1, 'male/Jackets/Jackets.jpg', 'Coolest on the market', 'Cool Jackets', 5086, 1, '2020-03-11 11:12:32'),
(86, 1, '\'white\', \'black\'', NULL, 'unisex', 8, '\'X\', \'XL\'', 2, 13, NULL, 3, 'male/Jackets/Jackets.jpg', 'Coolest on the market', 'Cool Jackets', 3407, 1, '2020-03-11 11:12:32'),
(87, 0, 'white', NULL, 'unisex', 47, '\'X\', \'XL\'', 3, 20, NULL, 1, 'male/Sweatpants/Sweatpants.jpg', 'Coolest on the market', 'Cool Sweatpants', 2921, 1, '2020-03-11 11:12:32'),
(88, 0, 'yellow', NULL, 'male', 18, 'X', 2, 4, NULL, 3, 'male/Trousers/Trousers.jpg', 'Coolest on the market', 'Cool Trousers', 2933, 1, '2020-03-11 11:12:33'),
(89, 0, 'green', NULL, 'unisex', 24, 'XL', 3, 8, NULL, 1, 'male/Sandals/Sandals.jpg', 'Coolest on the market', 'Cool Sandals', 3233, 1, '2020-03-11 11:12:33'),
(90, 1, 'black', NULL, 'female', 2, '\'X\', \'XL\'', 2, 13, NULL, 2, 'female/Jackets/Jackets.jpg', 'Coolest on the market', 'Cool Jackets', 5711, 1, '2020-03-11 11:12:33'),
(91, 1, 'yellow', NULL, 'female', 42, 'XL', 2, 5, NULL, 1, 'female/Socks/Socks.jpg', 'Coolest on the market', 'Cool Socks', 7338, 1, '2020-03-11 11:12:33'),
(92, 1, 'red', NULL, 'female', 11, '\'S\',\'X\'', 3, 7, NULL, 1, 'female/Shoes/Shoes.jpg', 'Coolest on the market', 'Cool Shoes', 166, 1, '2020-03-11 11:12:33'),
(93, 1, 'black', NULL, 'female', 13, 'X', 3, 20, NULL, 1, 'female/Sweatpants/Sweatpants.jpg', 'Coolest on the market', 'Cool Sweatpants', 4392, 1, '2020-03-11 11:12:33'),
(94, 0, 'white', NULL, 'male', 45, 'X', 2, 10, NULL, 3, 'male/Scarfs/Scarfs.jpg', 'Coolest on the market', 'Cool Scarfs', 5138, 1, '2020-03-11 11:12:33'),
(95, 1, '\'green\',\'pink\'', NULL, 'male', 6, '\'X\', \'XL\'', 2, 2, NULL, 1, 'male/Shorts/Shorts.jpg', 'Coolest on the market', 'Cool Shorts', 7338, 1, '2020-03-11 11:12:34'),
(96, 0, 'black', NULL, 'unisex', 22, '\'XL\',\'XXL\'', 1, 11, NULL, 3, 'male/Gloves/Gloves.jpg', 'Coolest on the market', 'Cool Gloves', 3872, 1, '2020-03-11 11:12:34'),
(97, 0, 'green', NULL, 'female', 16, 'XL', 1, 4, NULL, 2, 'female/Trousers/Trousers.jpg', 'Coolest on the market', 'Cool Trousers', 4891, 1, '2020-03-11 11:12:34'),
(98, 0, '\'red\', \'green\'', NULL, 'unisex', 21, '\'XL\',\'XXL\'', 2, 6, NULL, 1, 'male/Belts/Belts.jpg', 'Coolest on the market', 'Cool Belts', 6518, 1, '2020-03-11 11:12:34'),
(99, 0, 'green', NULL, 'unisex', 27, 'XL', 3, 13, NULL, 1, 'male/Jackets/Jackets.jpg', 'Coolest on the market', 'Cool Jackets', 1134, 1, '2020-03-11 11:12:34'),
(100, 0, 'pink', NULL, 'female', 18, '\'X\', \'XL\'', 1, 20, NULL, 3, 'female/Sweatpants/Sweatpants.jpg', 'Coolest on the market', 'Cool Sweatpants', 7486, 1, '2020-03-11 11:12:34'),
(101, 0, 'white', NULL, 'male', 46, 'XXL', 3, 11, NULL, 1, 'male/Gloves/Gloves.jpg', 'Coolest on the market', 'Cool Gloves', 7482, 1, '2020-03-11 11:12:34'),
(102, 1, '\'green\',\'pink\'', NULL, 'unisex', 40, 'XXL', 2, 8, NULL, 1, 'male/Sandals/Sandals.jpg', 'Coolest on the market', 'Cool Sandals', 7066, 1, '2020-03-11 11:12:35'),
(103, 1, '\'white\', \'black\'', NULL, 'unisex', 28, '\'XL\',\'XXL\'', 2, 16, NULL, 1, 'male/Suits/Suits.jpg', 'Coolest on the market', 'Cool Suits', 631, 1, '2020-03-11 11:12:35'),
(104, 0, 'white', NULL, 'female', 9, '\'S\',\'X\'', 2, 11, NULL, 1, 'female/Gloves/Gloves.jpg', 'Coolest on the market', 'Cool Gloves', 576, 1, '2020-03-11 11:12:35'),
(105, 1, 'pink', NULL, 'female', 20, '\'X\', \'XL\'', 3, 14, NULL, 1, 'female/Sweaters/Sweaters.jpg', 'Coolest on the market', 'Cool Sweaters', 3601, 1, '2020-03-11 11:12:35'),
(106, 1, 'white', NULL, 'female', 19, 'S', 2, 17, NULL, 2, 'female/Blazers/Blazers.jpg', 'Coolest on the market', 'Cool Blazers', 186, 1, '2020-03-11 11:12:35'),
(107, 0, '\'red\', \'green\'', NULL, 'female', 9, 'X', 1, 13, NULL, 3, 'female/Jackets/Jackets.jpg', 'Coolest on the market', 'Cool Jackets', 6998, 1, '2020-03-11 11:12:35'),
(108, 1, 'black', NULL, 'unisex', 5, 'S', 2, 1, NULL, 3, 'male/Shirts/Shirts.jpg', 'Coolest on the market', 'Cool Shirts', 3472, 1, '2020-03-11 11:12:35'),
(109, 0, 'black', NULL, 'male', 3, '\'X\', \'XL\'', 2, 15, NULL, 1, 'male/Watches/Watches.jpg', 'Coolest on the market', 'Cool Watches', 3785, 1, '2020-03-11 11:12:35'),
(110, 0, 'blue', NULL, 'male', 41, 'X', 3, 11, NULL, 1, 'male/Gloves/Gloves.jpg', 'Coolest on the market', 'Cool Gloves', 6309, 1, '2020-03-11 11:12:35'),
(111, 1, '\'white\', \'black\'', NULL, 'unisex', 1, 'X', 3, 16, NULL, 3, 'male/Suits/Suits.jpg', 'Coolest on the market', 'Cool Suits', 5692, 1, '2020-03-11 11:12:36'),
(112, 0, '\'white\', \'black\'', NULL, 'unisex', 43, 'X', 3, 11, NULL, 3, 'male/Gloves/Gloves.jpg', 'Coolest on the market', 'Cool Gloves', 1586, 1, '2020-03-11 11:12:36'),
(113, 0, '\'white\', \'black\'', NULL, 'unisex', 20, 'XXL', 3, 10, NULL, 3, 'male/Scarfs/Scarfs.jpg', 'Coolest on the market', 'Cool Scarfs', 7049, 1, '2020-03-11 11:12:36'),
(114, 0, 'green', NULL, 'female', 1, 'XXL', 2, 7, NULL, 1, 'female/Shoes/Shoes.jpg', 'Coolest on the market', 'Cool Shoes', 2587, 1, '2020-03-11 11:12:36'),
(115, 1, '\'red\', \'green\'', NULL, 'male', 47, 'XL', 1, 14, NULL, 1, 'male/Sweaters/Sweaters.jpg', 'Coolest on the market', 'Cool Sweaters', 7384, 1, '2020-03-11 11:12:36'),
(116, 1, 'pink', NULL, 'male', 8, '\'S\',\'X\'', 2, 8, NULL, 3, 'male/Sandals/Sandals.jpg', 'Coolest on the market', 'Cool Sandals', 592, 1, '2020-03-11 11:12:36'),
(117, 1, 'green', NULL, 'male', 17, 'XL', 1, 18, NULL, 3, 'male/Kanzu/Kanzu.jpg', 'Coolest on the market', 'Cool Kanzu', 5719, 1, '2020-03-11 11:12:36'),
(118, 1, 'red', NULL, 'female', 5, 'XXL', 2, 14, NULL, 1, 'female/Sweaters/Sweaters.jpg', 'Coolest on the market', 'Cool Sweaters', 4202, 1, '2020-03-11 11:12:36'),
(119, 0, '\'green\',\'pink\'', NULL, 'male', 14, 'X', 2, 7, NULL, 2, 'male/Shoes/Shoes.jpg', 'Coolest on the market', 'Cool Shoes', 2955, 1, '2020-03-11 11:12:36'),
(120, 0, 'blue', NULL, 'male', 42, 'XL', 2, 13, NULL, 3, 'male/Jackets/Jackets.jpg', 'Coolest on the market', 'Cool Jackets', 3303, 1, '2020-03-11 11:12:37'),
(121, 0, 'green', NULL, 'female', 38, '\'XL\',\'XXL\'', 3, 11, NULL, 3, 'female/Gloves/Gloves.jpg', 'Coolest on the market', 'Cool Gloves', 2680, 1, '2020-03-11 11:12:37'),
(122, 1, '\'green\',\'pink\'', NULL, 'male', 17, 'XXL', 3, 14, NULL, 3, 'male/Sweaters/Sweaters.jpg', 'Coolest on the market', 'Cool Sweaters', 7394, 1, '2020-03-11 11:12:37'),
(123, 0, 'green', NULL, 'female', 17, 'X', 2, 1, NULL, 2, 'female/Shirts/Shirts.jpg', 'Coolest on the market', 'Cool Shirts', 3158, 1, '2020-03-11 11:12:37'),
(124, 0, '\'white\', \'black\'', NULL, 'unisex', 45, 'S', 1, 18, NULL, 2, 'male/Kanzu/Kanzu.jpg', 'Coolest on the market', 'Cool Kanzu', 1237, 1, '2020-03-11 11:12:37'),
(125, 0, 'blue', NULL, 'unisex', 1, 'S', 1, 13, NULL, 3, 'male/Jackets/Jackets.jpg', 'Coolest on the market', 'Cool Jackets', 1809, 1, '2020-03-11 11:12:37'),
(126, 0, 'blue', NULL, 'unisex', 41, 'XXL', 1, 20, NULL, 2, 'male/Sweatpants/Sweatpants.jpg', 'Coolest on the market', 'Cool Sweatpants', 770, 1, '2020-03-11 11:12:37'),
(127, 1, 'pink', NULL, 'unisex', 20, 'XXL', 1, 7, NULL, 3, 'male/Shoes/Shoes.jpg', 'Coolest on the market', 'Cool Shoes', 1555, 1, '2020-03-11 11:12:37'),
(128, 1, 'green', NULL, 'male', 18, 'XXL', 1, 11, NULL, 1, 'male/Gloves/Gloves.jpg', 'Coolest on the market', 'Cool Gloves', 7331, 1, '2020-03-11 11:12:38'),
(129, 1, 'red', NULL, 'female', 26, '\'XL\',\'XXL\'', 2, 6, NULL, 3, 'female/Belts/Belts.jpg', 'Coolest on the market', 'Cool Belts', 1948, 1, '2020-03-11 11:12:38'),
(130, 1, 'pink', NULL, 'unisex', 6, 'XXL', 1, 7, NULL, 3, 'male/Shoes/Shoes.jpg', 'Coolest on the market', 'Cool Shoes', 1825, 1, '2020-03-11 11:12:38'),
(131, 0, '\'red\', \'green\'', NULL, 'male', 10, 'S', 3, 10, NULL, 3, 'male/Scarfs/Scarfs.jpg', 'Coolest on the market', 'Cool Scarfs', 983, 1, '2020-03-11 11:12:38'),
(132, 0, '\'white\', \'black\'', NULL, 'male', 19, '\'X\', \'XL\'', 3, 13, NULL, 1, 'male/Jackets/Jackets.jpg', 'Coolest on the market', 'Cool Jackets', 4466, 1, '2020-03-11 11:12:38'),
(133, 1, '\'red\', \'green\'', NULL, 'unisex', 28, 'X', 2, 2, NULL, 3, 'male/Shorts/Shorts.jpg', 'Coolest on the market', 'Cool Shorts', 2971, 1, '2020-03-11 11:12:38'),
(134, 0, 'black', NULL, 'male', 14, '\'XL\',\'XXL\'', 2, 17, NULL, 1, 'male/Blazers/Blazers.jpg', 'Coolest on the market', 'Cool Blazers', 1188, 1, '2020-03-11 11:12:38'),
(135, 1, 'red', NULL, 'female', 17, 'X', 2, 12, NULL, 2, 'female/Hats/Hats.jpg', 'Coolest on the market', 'Cool Hats', 6631, 1, '2020-03-11 11:12:38'),
(136, 1, '\'white\', \'black\'', NULL, 'unisex', 33, 'X', 3, 7, NULL, 3, 'male/Shoes/Shoes.jpg', 'Coolest on the market', 'Cool Shoes', 1491, 1, '2020-03-11 11:12:39'),
(137, 0, 'green', NULL, 'unisex', 42, 'XL', 1, 4, NULL, 1, 'male/Trousers/Trousers.jpg', 'Coolest on the market', 'Cool Trousers', 6804, 1, '2020-03-11 11:12:39'),
(138, 0, '\'red\', \'green\'', NULL, 'unisex', 47, 'XXL', 1, 1, NULL, 3, 'male/Shirts/Shirts.jpg', 'Coolest on the market', 'Cool Shirts', 7384, 1, '2020-03-11 11:12:39'),
(139, 0, 'green', NULL, 'female', 24, '\'S\',\'X\'', 3, 12, NULL, 1, 'female/Hats/Hats.jpg', 'Coolest on the market', 'Cool Hats', 263, 1, '2020-03-11 11:12:39'),
(140, 1, 'black', NULL, 'unisex', 30, 'XL', 2, 1, NULL, 2, 'male/Shirts/Shirts.jpg', 'Coolest on the market', 'Cool Shirts', 4642, 1, '2020-03-11 11:12:39'),
(141, 1, '\'red\', \'green\'', NULL, 'female', 4, 'S', 1, 14, NULL, 3, 'female/Sweaters/Sweaters.jpg', 'Coolest on the market', 'Cool Sweaters', 5230, 1, '2020-03-11 11:12:39'),
(142, 1, 'green', NULL, 'female', 8, 'X', 3, 17, NULL, 2, 'female/Blazers/Blazers.jpg', 'Coolest on the market', 'Cool Blazers', 6885, 1, '2020-03-11 11:12:39'),
(143, 0, 'pink', NULL, 'female', 38, '\'X\', \'XL\'', 1, 17, NULL, 3, 'female/Blazers/Blazers.jpg', 'Coolest on the market', 'Cool Blazers', 5838, 1, '2020-03-11 11:12:39'),
(144, 1, 'red', NULL, 'unisex', 34, '\'XL\',\'XXL\'', 2, 12, NULL, 2, 'male/Hats/Hats.jpg', 'Coolest on the market', 'Cool Hats', 5009, 1, '2020-03-11 11:12:40'),
(145, 0, 'black', NULL, 'male', 37, 'X', 2, 20, NULL, 3, 'male/Sweatpants/Sweatpants.jpg', 'Coolest on the market', 'Cool Sweatpants', 4514, 1, '2020-03-11 11:12:40'),
(146, 1, '\'white\', \'black\'', NULL, 'male', 34, 'S', 3, 16, NULL, 3, 'male/Suits/Suits.jpg', 'Coolest on the market', 'Cool Suits', 6185, 1, '2020-03-11 11:12:40'),
(147, 0, '\'red\', \'green\'', NULL, 'female', 31, 'X', 2, 13, NULL, 3, 'female/Jackets/Jackets.jpg', 'Coolest on the market', 'Cool Jackets', 210, 1, '2020-03-11 11:12:40'),
(148, 1, 'yellow', NULL, 'unisex', 6, 'S', 2, 5, NULL, 1, 'male/Socks/Socks.jpg', 'Coolest on the market', 'Cool Socks', 6992, 1, '2020-03-11 11:12:40'),
(149, 0, 'red', NULL, 'male', 26, '\'X\', \'XL\'', 3, 6, NULL, 2, 'male/Belts/Belts.jpg', 'Coolest on the market', 'Cool Belts', 627, 1, '2020-03-11 11:12:40'),
(150, 0, '\'red\', \'green\'', NULL, 'female', 27, '\'XL\',\'XXL\'', 2, 2, NULL, 2, 'female/Shorts/Shorts.jpg', 'Coolest on the market', 'Cool Shorts', 6458, 1, '2020-03-11 11:12:40'),
(151, 0, '\'red\', \'green\'', NULL, 'male', 8, 'XL', 3, 17, NULL, 1, 'male/Blazers/Blazers.jpg', 'Coolest on the market', 'Cool Blazers', 2797, 1, '2020-03-11 11:12:40'),
(152, 1, 'green', NULL, 'male', 13, '\'X\', \'XL\'', 3, 4, NULL, 3, 'male/Trousers/Trousers.jpg', 'Coolest on the market', 'Cool Trousers', 4277, 1, '2020-03-11 11:12:40'),
(153, 1, '\'green\',\'pink\'', NULL, 'female', 7, 'XL', 3, 18, NULL, 1, 'female/Kanzu/Kanzu.jpg', 'Coolest on the market', 'Cool Kanzu', 4382, 1, '2020-03-11 11:12:41'),
(154, 1, 'pink', NULL, 'female', 3, 'XXL', 2, 12, NULL, 1, 'female/Hats/Hats.jpg', 'Coolest on the market', 'Cool Hats', 3187, 1, '2020-03-11 11:12:41'),
(155, 0, 'blue', NULL, 'male', 30, 'XXL', 3, 15, NULL, 3, 'male/Watches/Watches.jpg', 'Coolest on the market', 'Cool Watches', 3063, 1, '2020-03-11 11:12:41'),
(156, 0, '\'red\', \'green\'', NULL, 'female', 46, '\'S\',\'X\'', 2, 18, NULL, 1, 'female/Kanzu/Kanzu.jpg', 'Coolest on the market', 'Cool Kanzu', 348, 1, '2020-03-11 11:12:41'),
(157, 0, 'white', NULL, 'male', 6, '\'XL\',\'XXL\'', 2, 6, NULL, 1, 'male/Belts/Belts.jpg', 'Coolest on the market', 'Cool Belts', 3452, 1, '2020-03-11 11:12:41'),
(158, 1, 'green', NULL, 'male', 35, 'XL', 1, 8, NULL, 1, 'male/Sandals/Sandals.jpg', 'Coolest on the market', 'Cool Sandals', 6759, 1, '2020-03-11 11:12:41'),
(159, 0, 'white', NULL, 'male', 20, 'S', 2, 10, NULL, 3, 'male/Scarfs/Scarfs.jpg', 'Coolest on the market', 'Cool Scarfs', 423, 1, '2020-03-11 11:12:41'),
(160, 0, 'red', NULL, 'male', 49, 'XXL', 2, 4, NULL, 1, 'male/Trousers/Trousers.jpg', 'Coolest on the market', 'Cool Trousers', 4247, 1, '2020-03-11 11:12:42'),
(161, 0, 'yellow', NULL, 'unisex', 37, 'XL', 1, 19, NULL, 2, 'male/Underwears/Underwears.jpg', 'Coolest on the market', 'Cool Underwears', 6658, 1, '2020-03-11 11:12:42'),
(162, 1, 'green', NULL, 'unisex', 16, 'S', 1, 20, NULL, 1, 'male/Sweatpants/Sweatpants.jpg', 'Coolest on the market', 'Cool Sweatpants', 5475, 1, '2020-03-11 11:12:42'),
(163, 1, 'white', NULL, 'unisex', 41, 'S', 3, 20, NULL, 1, 'male/Sweatpants/Sweatpants.jpg', 'Coolest on the market', 'Cool Sweatpants', 7261, 1, '2020-03-11 11:12:42'),
(164, 0, 'pink', NULL, 'unisex', 44, '\'X\', \'XL\'', 3, 2, NULL, 1, 'male/Shorts/Shorts.jpg', 'Coolest on the market', 'Cool Shorts', 3475, 1, '2020-03-11 11:12:42'),
(165, 1, 'yellow', NULL, 'unisex', 2, '\'XL\',\'XXL\'', 3, 17, NULL, 3, 'male/Blazers/Blazers.jpg', 'Coolest on the market', 'Cool Blazers', 4172, 1, '2020-03-11 11:12:42'),
(166, 1, 'red', NULL, 'female', 38, '\'XL\',\'XXL\'', 2, 17, NULL, 3, 'female/Blazers/Blazers.jpg', 'Coolest on the market', 'Cool Blazers', 671, 1, '2020-03-11 11:12:42'),
(167, 1, '\'green\',\'pink\'', NULL, 'female', 9, '\'S\',\'X\'', 3, 17, NULL, 2, 'female/Blazers/Blazers.jpg', 'Coolest on the market', 'Cool Blazers', 2995, 1, '2020-03-11 11:12:42'),
(168, 1, 'white', NULL, 'female', 11, '\'XL\',\'XXL\'', 2, 4, NULL, 1, 'female/Trousers/Trousers.jpg', 'Coolest on the market', 'Cool Trousers', 5684, 1, '2020-03-11 11:12:43'),
(169, 1, 'red', NULL, 'male', 34, 'XXL', 1, 11, NULL, 2, 'male/Gloves/Gloves.jpg', 'Coolest on the market', 'Cool Gloves', 5391, 1, '2020-03-11 11:12:43'),
(170, 0, 'green', NULL, 'male', 47, 'X', 1, 3, NULL, 3, 'male/T-Shirts/T-Shirts.jpg', 'Coolest on the market', 'Cool T-Shirts', 238, 1, '2020-03-11 11:12:43'),
(171, 1, 'green', NULL, 'unisex', 9, '\'X\', \'XL\'', 3, 9, NULL, 1, 'male/Jeans/Jeans.jpg', 'Coolest on the market', 'Cool Jeans', 6182, 1, '2020-03-11 11:12:43'),
(172, 0, 'pink', NULL, 'male', 49, '\'S\',\'X\'', 1, 11, NULL, 1, 'male/Gloves/Gloves.jpg', 'Coolest on the market', 'Cool Gloves', 4222, 1, '2020-03-11 11:12:43'),
(173, 1, 'blue', NULL, 'female', 9, 'X', 3, 17, NULL, 3, 'female/Blazers/Blazers.jpg', 'Coolest on the market', 'Cool Blazers', 4854, 1, '2020-03-11 11:12:43'),
(174, 0, 'white', NULL, 'unisex', 2, '\'X\', \'XL\'', 1, 6, NULL, 1, 'male/Belts/Belts.jpg', 'Coolest on the market', 'Cool Belts', 3729, 1, '2020-03-11 11:12:44'),
(175, 0, 'red', NULL, 'male', 30, 'XL', 1, 2, NULL, 3, 'male/Shorts/Shorts.jpg', 'Coolest on the market', 'Cool Shorts', 2449, 1, '2020-03-11 11:12:44'),
(176, 0, 'pink', NULL, 'male', 2, 'XXL', 1, 12, NULL, 2, 'male/Hats/Hats.jpg', 'Coolest on the market', 'Cool Hats', 1677, 1, '2020-03-11 11:12:44'),
(177, 0, '\'green\',\'pink\'', NULL, 'female', 24, '\'XL\',\'XXL\'', 1, 13, NULL, 3, 'female/Jackets/Jackets.jpg', 'Coolest on the market', 'Cool Jackets', 3698, 1, '2020-03-11 11:12:44'),
(178, 0, 'black', NULL, 'female', 37, 'S', 1, 18, NULL, 3, 'female/Kanzu/Kanzu.jpg', 'Coolest on the market', 'Cool Kanzu', 6805, 1, '2020-03-11 11:12:44'),
(179, 0, '\'green\',\'pink\'', NULL, 'unisex', 39, '\'XL\',\'XXL\'', 3, 6, NULL, 3, 'male/Belts/Belts.jpg', 'Coolest on the market', 'Cool Belts', 97, 1, '2020-03-11 11:12:44'),
(180, 0, '\'red\', \'green\'', NULL, 'female', 8, '\'XL\',\'XXL\'', 2, 18, NULL, 3, 'female/Kanzu/Kanzu.jpg', 'Coolest on the market', 'Cool Kanzu', 1222, 1, '2020-03-11 11:12:44'),
(181, 1, '\'white\', \'black\'', NULL, 'male', 34, 'XL', 3, 15, NULL, 3, 'male/Watches/Watches.jpg', 'Coolest on the market', 'Cool Watches', 2669, 1, '2020-03-11 11:12:44'),
(182, 1, 'green', NULL, 'unisex', 49, 'X', 3, 15, NULL, 3, 'male/Watches/Watches.jpg', 'Coolest on the market', 'Cool Watches', 4734, 1, '2020-03-11 11:12:44'),
(183, 1, 'red', NULL, 'unisex', 18, '\'X\', \'XL\'', 2, 6, NULL, 3, 'male/Belts/Belts.jpg', 'Coolest on the market', 'Cool Belts', 3979, 1, '2020-03-11 11:12:45'),
(184, 1, 'red', NULL, 'male', 2, '\'X\', \'XL\'', 3, 9, NULL, 3, 'male/Jeans/Jeans.jpg', 'Coolest on the market', 'Cool Jeans', 2741, 1, '2020-03-11 11:12:45'),
(185, 0, '\'green\',\'pink\'', NULL, 'unisex', 41, 'S', 3, 9, NULL, 1, 'male/Jeans/Jeans.jpg', 'Coolest on the market', 'Cool Jeans', 4443, 1, '2020-03-11 11:12:45'),
(186, 1, 'red', NULL, 'male', 39, 'S', 3, 15, NULL, 1, 'male/Watches/Watches.jpg', 'Coolest on the market', 'Cool Watches', 4993, 1, '2020-03-11 11:12:45'),
(187, 1, 'black', NULL, 'male', 14, 'XXL', 2, 6, NULL, 3, 'male/Belts/Belts.jpg', 'Coolest on the market', 'Cool Belts', 528, 1, '2020-03-11 11:12:45'),
(188, 1, '\'white\', \'black\'', NULL, 'unisex', 40, 'X', 3, 4, NULL, 2, 'male/Trousers/Trousers.jpg', 'Coolest on the market', 'Cool Trousers', 6243, 1, '2020-03-11 11:12:45'),
(189, 1, 'pink', NULL, 'unisex', 5, 'S', 2, 19, NULL, 1, 'male/Underwears/Underwears.jpg', 'Coolest on the market', 'Cool Underwears', 3180, 1, '2020-03-11 11:12:45'),
(190, 0, 'black', NULL, 'female', 44, '\'X\', \'XL\'', 1, 12, NULL, 3, 'female/Hats/Hats.jpg', 'Coolest on the market', 'Cool Hats', 5313, 1, '2020-03-11 11:12:46'),
(191, 0, 'blue', NULL, 'unisex', 15, '\'XL\',\'XXL\'', 1, 3, NULL, 1, 'male/T-Shirts/T-Shirts.jpg', 'Coolest on the market', 'Cool T-Shirts', 2347, 1, '2020-03-11 11:12:46'),
(192, 1, '\'red\', \'green\'', NULL, 'male', 44, 'X', 2, 13, NULL, 3, 'male/Jackets/Jackets.jpg', 'Coolest on the market', 'Cool Jackets', 1362, 1, '2020-03-11 11:12:46'),
(193, 0, '\'red\', \'green\'', NULL, 'unisex', 19, '\'S\',\'X\'', 1, 9, NULL, 3, 'male/Jeans/Jeans.jpg', 'Coolest on the market', 'Cool Jeans', 3980, 1, '2020-03-11 11:12:46'),
(194, 0, 'yellow', NULL, 'female', 13, '\'X\', \'XL\'', 3, 2, NULL, 2, 'female/Shorts/Shorts.jpg', 'Coolest on the market', 'Cool Shorts', 4789, 1, '2020-03-11 11:12:46'),
(195, 0, 'yellow', NULL, 'male', 38, 'XXL', 1, 8, NULL, 1, 'male/Sandals/Sandals.jpg', 'Coolest on the market', 'Cool Sandals', 451, 1, '2020-03-11 11:12:46'),
(196, 1, 'green', NULL, 'unisex', 34, '\'XL\',\'XXL\'', 2, 13, NULL, 3, 'male/Jackets/Jackets.jpg', 'Coolest on the market', 'Cool Jackets', 198, 1, '2020-03-11 11:12:46'),
(197, 1, 'pink', NULL, 'unisex', 15, 'S', 1, 11, NULL, 2, 'male/Gloves/Gloves.jpg', 'Coolest on the market', 'Cool Gloves', 4599, 1, '2020-03-11 11:12:47'),
(198, 1, 'black', NULL, 'unisex', 34, '\'XL\',\'XXL\'', 1, 2, NULL, 2, 'male/Shorts/Shorts.jpg', 'Coolest on the market', 'Cool Shorts', 2780, 1, '2020-03-11 11:12:47'),
(199, 0, 'white', NULL, 'female', 42, 'XXL', 3, 12, NULL, 2, 'female/Hats/Hats.jpg', 'Coolest on the market', 'Cool Hats', 2352, 1, '2020-03-11 11:12:47'),
(200, 1, '\'green\',\'pink\'', NULL, 'female', 10, 'XXL', 1, 6, NULL, 3, 'female/Belts/Belts.jpg', 'Coolest on the market', 'Cool Belts', 6269, 1, '2020-03-11 11:12:47'),
(201, 1, '\'green\',\'pink\'', NULL, 'female', 45, 'X', 2, 13, NULL, 3, 'female/Jackets/Jackets.jpg', 'Coolest on the market', 'Cool Jackets', 2533, 1, '2020-03-11 11:12:47'),
(202, 1, 'white', NULL, 'female', 14, 'X', 2, 12, NULL, 2, 'female/Hats/Hats.jpg', 'Coolest on the market', 'Cool Hats', 3929, 1, '2020-03-11 11:12:47'),
(203, 0, 'black', NULL, 'unisex', 29, '\'XL\',\'XXL\'', 3, 4, NULL, 2, 'male/Trousers/Trousers.jpg', 'Coolest on the market', 'Cool Trousers', 4335, 1, '2020-03-11 11:12:47'),
(204, 1, 'red', NULL, 'male', 47, 'X', 1, 11, NULL, 2, 'male/Gloves/Gloves.jpg', 'Coolest on the market', 'Cool Gloves', 3825, 1, '2020-03-11 11:12:47'),
(205, 0, '\'red\', \'green\'', NULL, 'unisex', 21, 'XXL', 3, 17, NULL, 1, 'male/Blazers/Blazers.jpg', 'Coolest on the market', 'Cool Blazers', 6761, 1, '2020-03-11 11:12:47');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `r` int(11) NOT NULL,
  `review` varchar(100) DEFAULT NULL,
  `timeStamp` datetime DEFAULT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `r`, `review`, `timeStamp`, `product_id`) VALUES
(1, 5, 'Good Product', '2020-03-13 11:00:29', 1),
(2, 4, 'Good Product', '2020-03-13 11:10:43', 1),
(3, 1, 'Bad Product', '2020-03-13 11:13:26', 1),
(4, 4, 'Hated it', '2020-03-13 11:37:51', 79),
(5, 5, 'Bad Product', '2020-03-13 11:37:52', 89),
(6, 2, 'Hated it', '2020-03-13 11:37:52', 59),
(7, 2, 'Good Product', '2020-03-13 11:37:52', 144),
(8, 3, 'Bad Product', '2020-03-13 11:37:52', 184),
(9, 3, 'Hated it', '2020-03-13 11:41:29', 177),
(10, 3, 'Good Product', '2020-03-13 11:41:29', 134),
(11, 2, 'Hated it', '2020-03-13 11:41:29', 80),
(12, 5, 'Bad Product', '2020-03-13 11:41:30', 49),
(13, 5, 'Reliable seller', '2020-03-13 11:41:30', 24),
(14, 1, 'Hated it', '2020-03-13 11:41:30', 143),
(15, 3, 'Reliable seller', '2020-03-13 11:41:30', 129),
(16, 5, 'Bad Product', '2020-03-13 11:41:31', 149),
(17, 1, 'Loved it', '2020-03-13 11:41:31', 166),
(18, 2, 'Good Product', '2020-03-13 11:41:31', 175),
(19, 3, 'Loved it', '2020-03-13 11:41:31', 120),
(20, 3, 'Reliable seller', '2020-03-13 11:41:32', 191),
(21, 1, 'Good Product', '2020-03-13 11:41:32', 71),
(22, 1, 'Good Product', '2020-03-13 11:41:32', 171),
(23, 3, 'Hated it', '2020-03-13 11:41:32', 144),
(24, 2, 'Loved it', '2020-03-13 11:41:32', 162),
(25, 2, 'Bad Product', '2020-03-13 11:41:33', 166),
(26, 5, 'Hated it', '2020-03-13 11:41:33', 12),
(27, 1, 'Bad Product', '2020-03-13 11:41:33', 4),
(28, 5, 'Loved it', '2020-03-13 11:41:33', 68),
(29, 1, 'Bad Product', '2020-03-13 11:41:34', 72),
(30, 3, 'Bad Product', '2020-03-13 11:41:34', 203),
(31, 3, 'Reliable seller', '2020-03-13 11:41:34', 43),
(32, 2, 'Hated it', '2020-03-13 11:41:34', 171),
(33, 5, 'Bad Product', '2020-03-13 11:41:35', 56),
(34, 2, 'Hated it', '2020-03-13 11:41:35', 57),
(35, 1, 'Good Product', '2020-03-13 11:41:35', 99),
(36, 4, 'Bad Product', '2020-03-13 11:41:35', 128),
(37, 2, 'Hated it', '2020-03-13 11:41:36', 85),
(38, 4, 'Good Product', '2020-03-13 11:41:36', 64),
(39, 1, 'Bad Product', '2020-03-13 11:41:36', 45),
(40, 5, 'Hated it', '2020-03-13 11:41:36', 188),
(41, 4, 'Loved it', '2020-03-13 11:41:36', 167),
(42, 3, 'Good Product', '2020-03-13 11:41:37', 84),
(43, 4, 'Loved it', '2020-03-13 11:41:37', 110),
(44, 5, 'Good Product', '2020-03-13 11:41:37', 205),
(45, 2, 'Bad Product', '2020-03-13 11:41:37', 78),
(46, 4, 'Reliable seller', '2020-03-13 11:41:38', 29),
(47, 4, 'Good Product', '2020-03-13 11:41:38', 135),
(48, 3, 'Good Product', '2020-03-13 11:41:38', 71),
(49, 1, 'Loved it', '2020-03-13 11:41:38', 127),
(50, 3, 'Bad Product', '2020-03-13 11:41:39', 195),
(51, 5, 'Hated it', '2020-03-13 11:41:39', 181),
(52, 1, 'Bad Product', '2020-03-13 11:41:39', 80),
(53, 3, 'Bad Product', '2020-03-13 11:41:39', 41),
(54, 3, 'Hated it', '2020-03-13 11:41:40', 196),
(55, 5, 'Hated it', '2020-03-13 11:41:40', 57),
(56, 4, 'Loved it', '2020-03-13 11:41:40', 11),
(57, 5, 'Good Product', '2020-03-13 11:41:40', 102),
(58, 5, 'Bad Product', '2020-03-13 11:41:41', 38),
(59, 5, 'Reliable seller', '2020-03-13 11:41:41', 76),
(60, 1, 'Hated it', '2020-03-13 11:41:41', 19),
(61, 3, 'Loved it', '2020-03-13 11:41:42', 88),
(62, 2, 'Loved it', '2020-03-13 11:41:42', 69),
(63, 1, 'Hated it', '2020-03-13 11:41:42', 98),
(64, 3, 'Good Product', '2020-03-13 11:41:42', 57),
(65, 1, 'Hated it', '2020-03-13 11:41:42', 81),
(66, 5, 'Reliable seller', '2020-03-13 11:41:43', 156),
(67, 3, 'Hated it', '2020-03-13 11:41:43', 185),
(68, 4, 'Reliable seller', '2020-03-13 11:41:43', 96),
(69, 5, 'Hated it', '2020-03-13 11:41:43', 72),
(70, 4, 'Good Product', '2020-03-13 11:41:43', 38),
(71, 3, 'Loved it', '2020-03-13 11:41:44', 133),
(72, 2, 'Good Product', '2020-03-13 11:41:44', 9),
(73, 5, 'Good Product', '2020-03-13 11:41:44', 177),
(74, 3, 'Loved it', '2020-03-13 11:41:44', 43),
(75, 3, 'Good Product', '2020-03-13 11:41:45', 28),
(76, 2, 'Loved it', '2020-03-13 11:41:45', 55),
(77, 5, 'Good Product', '2020-03-13 11:41:45', 41),
(78, 1, 'Reliable seller', '2020-03-13 11:41:45', 47),
(79, 4, 'Bad Product', '2020-03-13 11:41:45', 112),
(80, 5, 'Good Product', '2020-03-13 11:41:46', 101),
(81, 2, 'Reliable seller', '2020-03-13 11:41:46', 149),
(82, 5, 'Bad Product', '2020-03-13 11:41:46', 104),
(83, 5, 'Bad Product', '2020-03-13 11:41:46', 28),
(84, 5, 'Bad Product', '2020-03-13 11:41:46', 127),
(85, 4, 'Bad Product', '2020-03-13 11:41:47', 115),
(86, 1, 'Reliable seller', '2020-03-13 11:41:47', 161),
(87, 2, 'Reliable seller', '2020-03-13 11:41:47', 204),
(88, 5, 'Bad Product', '2020-03-13 11:41:47', 99),
(89, 4, 'Good Product', '2020-03-13 11:41:48', 95),
(90, 2, 'Bad Product', '2020-03-13 11:41:48', 145),
(91, 3, 'Good Product', '2020-03-13 11:41:48', 157),
(92, 1, 'Loved it', '2020-03-13 11:41:48', 199),
(93, 5, 'Good Product', '2020-03-13 11:41:48', 169),
(94, 3, 'Bad Product', '2020-03-13 11:41:49', 170),
(95, 5, 'Reliable seller', '2020-03-13 11:41:49', 36),
(96, 3, 'Hated it', '2020-03-13 11:41:49', 50),
(97, 3, 'Bad Product', '2020-03-13 11:41:49', 111),
(98, 5, 'Reliable seller', '2020-03-13 11:41:49', 18),
(99, 5, 'Reliable seller', '2020-03-13 11:41:50', 15),
(100, 1, 'Reliable seller', '2020-03-13 11:41:50', 93),
(101, 1, 'Loved it', '2020-03-13 11:41:50', 86),
(102, 3, 'Bad Product', '2020-03-13 11:41:50', 199),
(103, 3, 'Hated it', '2020-03-13 11:41:51', 63),
(104, 4, 'Good Product', '2020-03-13 11:41:51', 180),
(105, 1, 'Reliable seller', '2020-03-13 11:41:51', 112),
(106, 4, 'Reliable seller', '2020-03-13 11:41:51', 109),
(107, 2, 'Loved it', '2020-03-13 11:41:51', 203),
(108, 3, 'Loved it', '2020-03-13 11:41:52', 168),
(109, 3, 'Good Product', '2020-03-13 11:41:52', 8),
(110, 2, 'Hated it', '2020-03-13 11:41:52', 46),
(111, 1, 'Hated it', '2020-03-13 11:41:52', 189),
(112, 3, 'Loved it', '2020-03-13 11:41:52', 54),
(113, 3, 'Loved it', '2020-03-13 11:41:53', 18),
(114, 5, 'Bad Product', '2020-03-13 11:41:53', 38),
(115, 4, 'Reliable seller', '2020-03-13 11:41:53', 200),
(116, 2, 'Hated it', '2020-03-13 11:41:53', 148),
(117, 4, 'Reliable seller', '2020-03-13 11:41:54', 164),
(118, 3, 'Bad Product', '2020-03-13 11:41:54', 176),
(119, 1, 'Bad Product', '2020-03-13 11:41:54', 77),
(120, 4, 'Hated it', '2020-03-13 11:41:54', 81),
(121, 2, 'Bad Product', '2020-03-13 11:41:54', 78),
(122, 5, 'Reliable seller', '2020-03-13 11:41:55', 46),
(123, 5, 'Reliable seller', '2020-03-13 11:41:55', 70),
(124, 4, 'Loved it', '2020-03-13 11:41:55', 162),
(125, 2, 'Bad Product', '2020-03-13 11:41:55', 184),
(126, 2, 'Good Product', '2020-03-13 11:41:55', 173),
(127, 5, 'Hated it', '2020-03-13 11:41:56', 151),
(128, 3, 'Bad Product', '2020-03-13 11:41:56', 202),
(129, 5, 'Good Product', '2020-03-13 11:41:56', 66),
(130, 4, 'Good Product', '2020-03-13 11:41:56', 85),
(131, 5, 'Bad Product', '2020-03-13 11:41:57', 38),
(132, 2, 'Loved it', '2020-03-13 11:41:57', 15),
(133, 2, 'Bad Product', '2020-03-13 11:41:57', 84),
(134, 3, 'Reliable seller', '2020-03-13 11:41:57', 142),
(135, 1, 'Hated it', '2020-03-13 11:41:58', 125),
(136, 5, 'Good Product', '2020-03-13 11:41:58', 169),
(137, 4, 'Reliable seller', '2020-03-13 11:41:58', 7),
(138, 3, 'Reliable seller', '2020-03-13 11:41:58', 197),
(139, 1, 'Good Product', '2020-03-13 11:41:58', 188),
(140, 1, 'Hated it', '2020-03-13 11:41:59', 61),
(141, 2, 'Loved it', '2020-03-13 11:41:59', 26),
(142, 2, 'Loved it', '2020-03-13 11:41:59', 184),
(143, 4, 'Bad Product', '2020-03-13 11:41:59', 145),
(144, 4, 'Reliable seller', '2020-03-13 11:41:59', 124),
(145, 3, 'Loved it', '2020-03-13 11:42:00', 6),
(146, 3, 'Loved it', '2020-03-13 11:42:00', 35),
(147, 5, 'Reliable seller', '2020-03-13 11:42:00', 153),
(148, 4, 'Bad Product', '2020-03-13 11:42:00', 148),
(149, 3, 'Bad Product', '2020-03-13 11:42:01', 168),
(150, 4, 'Reliable seller', '2020-03-13 11:42:01', 69),
(151, 2, 'Hated it', '2020-03-13 11:42:01', 21),
(152, 3, 'Good Product', '2020-03-13 11:42:01', 78),
(153, 5, 'Reliable seller', '2020-03-13 11:42:01', 108),
(154, 5, 'Good Product', '2020-03-13 11:42:02', 72),
(155, 3, 'Loved it', '2020-03-13 11:42:02', 50),
(156, 3, 'Good Product', '2020-03-13 11:42:02', 116),
(157, 2, 'Bad Product', '2020-03-13 11:42:02', 111),
(158, 5, 'Reliable seller', '2020-03-13 11:42:02', 161),
(159, 4, 'Loved it', '2020-03-13 11:42:03', 79),
(160, 4, 'Bad Product', '2020-03-13 11:42:03', 134),
(161, 1, 'Bad Product', '2020-03-13 11:42:03', 170),
(162, 5, 'Good Product', '2020-03-13 11:42:03', 196),
(163, 2, 'Good Product', '2020-03-13 11:42:03', 123),
(164, 4, 'Reliable seller', '2020-03-13 11:42:04', 124),
(165, 4, 'Hated it', '2020-03-13 11:42:04', 144),
(166, 2, 'Bad Product', '2020-03-13 11:42:04', 202),
(167, 5, 'Bad Product', '2020-03-13 11:42:04', 147),
(168, 1, 'Good Product', '2020-03-13 11:42:05', 134),
(169, 3, 'Hated it', '2020-03-13 11:42:05', 158),
(170, 4, 'Hated it', '2020-03-13 11:42:05', 175),
(171, 4, 'Bad Product', '2020-03-13 11:42:05', 141),
(172, 4, 'Good Product', '2020-03-13 11:42:05', 6),
(173, 2, 'Good Product', '2020-03-13 11:42:06', 129),
(174, 1, 'Reliable seller', '2020-03-13 11:42:06', 205),
(175, 4, 'Reliable seller', '2020-03-13 11:42:06', 19),
(176, 5, 'Hated it', '2020-03-13 11:42:06', 117),
(177, 4, 'Loved it', '2020-03-13 11:42:07', 96),
(178, 4, 'Good Product', '2020-03-13 11:42:07', 21),
(179, 1, 'Good Product', '2020-03-13 11:42:07', 94),
(180, 2, 'Hated it', '2020-03-13 11:42:07', 23),
(181, 3, 'Loved it', '2020-03-13 11:42:08', 115),
(182, 4, 'Loved it', '2020-03-13 11:42:08', 136),
(183, 4, 'Reliable seller', '2020-03-13 11:42:08', 169),
(184, 1, 'Bad Product', '2020-03-13 11:42:08', 146),
(185, 4, 'Bad Product', '2020-03-13 11:42:08', 132),
(186, 2, 'Reliable seller', '2020-03-13 11:42:09', 68),
(187, 1, 'Reliable seller', '2020-03-13 11:42:09', 158),
(188, 5, 'Loved it', '2020-03-13 11:42:09', 40),
(189, 2, 'Bad Product', '2020-03-13 11:42:09', 3),
(190, 5, 'Bad Product', '2020-03-13 11:42:09', 34),
(191, 1, 'Loved it', '2020-03-13 11:42:10', 130),
(192, 4, 'Good Product', '2020-03-13 11:42:10', 82),
(193, 1, 'Reliable seller', '2020-03-13 11:42:10', 58),
(194, 3, 'Loved it', '2020-03-13 11:42:10', 7),
(195, 1, 'Bad Product', '2020-03-13 11:42:10', 53),
(196, 2, 'Reliable seller', '2020-03-13 11:42:11', 184),
(197, 3, 'Bad Product', '2020-03-13 11:42:11', 188),
(198, 4, 'Reliable seller', '2020-03-13 11:42:11', 66),
(199, 2, 'Reliable seller', '2020-03-13 11:42:11', 56),
(200, 4, 'Reliable seller', '2020-03-13 11:42:12', 204),
(201, 2, 'Hated it', '2020-03-13 11:42:12', 79),
(202, 5, 'Reliable seller', '2020-03-13 11:42:12', 60),
(203, 5, 'Bad Product', '2020-03-13 11:42:12', 159),
(204, 5, 'Reliable seller', '2020-03-13 11:42:12', 13),
(205, 2, 'Reliable seller', '2020-03-13 11:42:13', 164),
(206, 4, 'Hated it', '2020-03-13 11:42:13', 116),
(207, 1, 'Reliable seller', '2020-03-13 11:42:13', 92),
(208, 5, 'Loved it', '2020-03-13 11:42:13', 158),
(209, 4, 'Hated it', '2020-03-13 11:42:13', 30),
(210, 3, 'Good Product', '2020-03-13 11:42:14', 140),
(211, 4, 'Reliable seller', '2020-03-13 11:42:14', 50),
(212, 3, 'Reliable seller', '2020-03-13 11:42:14', 169),
(213, 3, 'Reliable seller', '2020-03-13 11:42:14', 99),
(214, 4, 'Bad Product', '2020-03-13 11:42:14', 159),
(215, 5, 'Bad Product', '2020-03-13 11:42:15', 1),
(216, 4, 'Bad Product', '2020-03-13 11:42:15', 63),
(217, 4, 'Reliable seller', '2020-03-13 11:42:15', 31),
(218, 3, 'Hated it', '2020-03-13 11:42:15', 203),
(219, 3, 'Good Product', '2020-03-13 11:42:16', 197),
(220, 5, 'Loved it', '2020-03-13 11:42:16', 179),
(221, 1, 'Reliable seller', '2020-03-13 11:42:16', 62),
(222, 4, 'Reliable seller', '2020-03-13 11:42:16', 93),
(223, 4, 'Loved it', '2020-03-13 11:42:16', 150),
(224, 2, 'Loved it', '2020-03-13 11:42:17', 90),
(225, 2, 'Loved it', '2020-03-13 11:42:17', 73),
(226, 4, 'Reliable seller', '2020-03-13 11:42:17', 105),
(227, 3, 'Bad Product', '2020-03-13 11:42:17', 24),
(228, 1, 'Hated it', '2020-03-13 11:42:18', 20),
(229, 3, 'Loved it', '2020-03-13 11:42:18', 84),
(230, 5, 'Good Product', '2020-03-13 11:42:18', 97),
(231, 3, 'Hated it', '2020-03-13 11:42:18', 57),
(232, 4, 'Hated it', '2020-03-13 11:42:19', 130),
(233, 2, 'Reliable seller', '2020-03-13 11:42:19', 30),
(234, 4, 'Reliable seller', '2020-03-13 11:42:19', 17),
(235, 3, 'Good Product', '2020-03-13 11:42:19', 120),
(236, 4, 'Hated it', '2020-03-13 11:42:20', 14),
(237, 5, 'Bad Product', '2020-03-13 11:42:20', 129),
(238, 5, 'Reliable seller', '2020-03-13 11:42:20', 144),
(239, 5, 'Hated it', '2020-03-13 11:42:20', 118),
(240, 4, 'Reliable seller', '2020-03-13 11:42:20', 43),
(241, 2, 'Loved it', '2020-03-13 11:42:21', 126),
(242, 3, 'Loved it', '2020-03-13 11:42:21', 69),
(243, 3, 'Loved it', '2020-03-13 11:42:21', 152),
(244, 3, 'Loved it', '2020-03-13 11:42:22', 65),
(245, 5, 'Bad Product', '2020-03-13 11:42:22', 113),
(246, 1, 'Good Product', '2020-03-13 11:42:22', 132),
(247, 5, 'Loved it', '2020-03-13 11:42:22', 121),
(248, 5, 'Bad Product', '2020-03-13 11:42:22', 106),
(249, 1, 'Loved it', '2020-03-13 11:42:23', 96),
(250, 2, 'Bad Product', '2020-03-13 11:42:23', 97),
(251, 5, 'Loved it', '2020-03-13 11:42:23', 159),
(252, 1, 'Reliable seller', '2020-03-13 11:42:23', 41),
(253, 2, 'Hated it', '2020-03-13 11:42:24', 182),
(254, 4, 'Loved it', '2020-03-13 11:42:24', 99),
(255, 5, 'Bad Product', '2020-03-13 11:42:24', 54),
(256, 5, 'Hated it', '2020-03-13 11:42:24', 21),
(257, 1, 'Reliable seller', '2020-03-13 11:42:25', 13),
(258, 4, 'Good Product', '2020-03-13 11:42:25', 182),
(259, 2, 'Bad Product', '2020-03-13 11:42:25', 21),
(260, 5, 'Loved it', '2020-03-13 11:42:25', 204),
(261, 3, 'Bad Product', '2020-03-13 11:42:25', 121),
(262, 1, 'Hated it', '2020-03-13 11:42:26', 86),
(263, 3, 'Bad Product', '2020-03-13 11:42:26', 105),
(264, 3, 'Bad Product', '2020-03-13 11:42:26', 101),
(265, 2, 'Loved it', '2020-03-13 11:42:26', 158),
(266, 5, 'Loved it', '2020-03-13 11:42:27', 42),
(267, 4, 'Loved it', '2020-03-13 11:42:27', 52),
(268, 2, 'Reliable seller', '2020-03-13 11:42:27', 91),
(269, 4, 'Loved it', '2020-03-13 11:42:27', 30),
(270, 4, 'Loved it', '2020-03-13 11:42:27', 48),
(271, 4, 'Loved it', '2020-03-13 11:42:28', 138),
(272, 3, 'Reliable seller', '2020-03-13 11:42:28', 137),
(273, 4, 'Loved it', '2020-03-13 11:42:28', 130),
(274, 2, 'Loved it', '2020-03-13 11:42:28', 199),
(275, 1, 'Hated it', '2020-03-13 11:42:29', 197),
(276, 4, 'Loved it', '2020-03-13 11:42:29', 106),
(277, 3, 'Reliable seller', '2020-03-13 11:42:29', 39),
(278, 3, 'Good Product', '2020-03-13 11:42:29', 145),
(279, 1, 'Hated it', '2020-03-13 11:42:29', 83),
(280, 2, 'Loved it', '2020-03-13 11:42:30', 8),
(281, 5, 'Hated it', '2020-03-13 11:42:30', 63),
(282, 3, 'Reliable seller', '2020-03-13 11:42:30', 192),
(283, 2, 'Good Product', '2020-03-13 11:42:30', 44),
(284, 2, 'Bad Product', '2020-03-13 11:42:30', 140),
(285, 5, 'Hated it', '2020-03-13 11:42:31', 177),
(286, 2, 'Loved it', '2020-03-13 11:42:31', 85),
(287, 5, 'Reliable seller', '2020-03-13 11:42:31', 179),
(288, 3, 'Reliable seller', '2020-03-13 11:42:32', 49),
(289, 5, 'Good Product', '2020-03-13 11:42:32', 22),
(290, 4, 'Loved it', '2020-03-13 11:42:32', 153),
(291, 3, 'Good Product', '2020-03-13 11:42:32', 119),
(292, 2, 'Good Product', '2020-03-13 11:42:32', 10),
(293, 3, 'Good Product', '2020-03-13 11:42:33', 65),
(294, 5, 'Bad Product', '2020-03-13 11:42:33', 103),
(295, 1, 'Bad Product', '2020-03-13 11:42:33', 153),
(296, 1, 'Good Product', '2020-03-13 11:42:33', 33),
(297, 2, 'Hated it', '2020-03-13 11:42:33', 174),
(298, 3, 'Bad Product', '2020-03-13 11:42:34', 181),
(299, 4, 'Hated it', '2020-03-13 11:42:34', 107),
(300, 2, 'Loved it', '2020-03-13 11:42:34', 144),
(301, 5, 'Bad Product', '2020-03-13 11:42:34', 15),
(302, 5, 'Loved it', '2020-03-13 11:42:35', 200),
(303, 3, 'Good Product', '2020-03-13 11:42:35', 14),
(304, 3, 'Loved it', '2020-03-13 11:42:35', 11),
(305, 1, 'Reliable seller', '2020-03-13 11:42:35', 53),
(306, 5, 'Hated it', '2020-03-13 11:42:35', 109),
(307, 1, 'Good Product', '2020-03-13 11:42:36', 84),
(308, 3, 'Bad Product', '2020-03-13 11:42:36', 93),
(309, 3, 'Reliable seller', '2020-03-13 11:42:36', 177),
(310, 2, 'Loved it', '2020-03-13 11:42:36', 132),
(311, 5, 'Reliable seller', '2020-03-13 11:42:37', 154),
(312, 5, 'Reliable seller', '2020-03-13 11:42:37', 40),
(313, 3, 'Hated it', '2020-03-13 11:42:37', 108),
(314, 4, 'Reliable seller', '2020-03-13 11:42:37', 5),
(315, 1, 'Bad Product', '2020-03-13 11:42:38', 53),
(316, 1, 'Bad Product', '2020-03-13 11:42:38', 11),
(317, 1, 'Hated it', '2020-03-13 11:42:38', 104),
(318, 4, 'Reliable seller', '2020-03-13 11:42:38', 181),
(319, 2, 'Good Product', '2020-03-13 11:42:38', 8),
(320, 4, 'Loved it', '2020-03-13 11:42:39', 56),
(321, 4, 'Reliable seller', '2020-03-13 11:42:39', 142),
(322, 5, 'Hated it', '2020-03-13 11:42:39', 195),
(323, 3, 'Reliable seller', '2020-03-13 11:42:39', 32),
(324, 2, 'Reliable seller', '2020-03-13 11:42:39', 31),
(325, 1, 'Loved it', '2020-03-13 11:42:40', 87),
(326, 1, 'Reliable seller', '2020-03-13 11:42:40', 23),
(327, 3, 'Reliable seller', '2020-03-13 11:42:40', 86),
(328, 2, 'Hated it', '2020-03-13 11:42:40', 83),
(329, 5, 'Hated it', '2020-03-13 11:42:41', 32),
(330, 4, 'Reliable seller', '2020-03-13 11:42:41', 157),
(331, 1, 'Bad Product', '2020-03-13 11:42:41', 94),
(332, 5, 'Bad Product', '2020-03-13 11:42:41', 200),
(333, 5, 'Loved it', '2020-03-13 11:42:41', 101),
(334, 4, 'Bad Product', '2020-03-13 11:42:42', 152),
(335, 4, 'Good Product', '2020-03-13 11:42:42', 117),
(336, 5, 'Bad Product', '2020-03-13 11:42:42', 30),
(337, 4, 'Loved it', '2020-03-13 11:42:42', 204),
(338, 3, 'Good Product', '2020-03-13 11:42:43', 68),
(339, 1, 'Reliable seller', '2020-03-13 11:42:43', 140),
(340, 4, 'Hated it', '2020-03-13 11:42:43', 52),
(341, 5, 'Bad Product', '2020-03-13 11:42:43', 48),
(342, 3, 'Reliable seller', '2020-03-13 11:42:43', 87),
(343, 1, 'Good Product', '2020-03-13 11:42:44', 76),
(344, 1, 'Hated it', '2020-03-13 11:42:44', 150),
(345, 4, 'Loved it', '2020-03-13 11:42:44', 177),
(346, 5, 'Hated it', '2020-03-13 11:42:44', 59),
(347, 1, 'Reliable seller', '2020-03-13 11:42:44', 180),
(348, 5, 'Bad Product', '2020-03-13 11:42:45', 68),
(349, 4, 'Reliable seller', '2020-03-13 11:42:45', 100),
(350, 1, 'Loved it', '2020-03-13 11:42:45', 164),
(351, 5, 'Loved it', '2020-03-13 11:42:45', 138),
(352, 5, 'Reliable seller', '2020-03-13 11:42:46', 121),
(353, 2, 'Bad Product', '2020-03-13 11:42:46', 181),
(354, 2, 'Good Product', '2020-03-13 11:42:46', 22),
(355, 4, 'Bad Product', '2020-03-13 11:42:46', 115),
(356, 1, 'Reliable seller', '2020-03-13 11:42:46', 45),
(357, 1, 'Reliable seller', '2020-03-13 11:42:47', 31),
(358, 3, 'Hated it', '2020-03-13 11:42:47', 171),
(359, 4, 'Reliable seller', '2020-03-13 11:42:47', 100),
(360, 5, 'Hated it', '2020-03-13 11:42:47', 5),
(361, 5, 'Bad Product', '2020-03-13 11:42:48', 120),
(362, 2, 'Good Product', '2020-03-13 11:42:48', 50),
(363, 4, 'Reliable seller', '2020-03-13 11:42:48', 3),
(364, 1, 'Reliable seller', '2020-03-13 11:42:48', 72),
(365, 5, 'Good Product', '2020-03-13 11:42:48', 142),
(366, 4, 'Reliable seller', '2020-03-13 11:42:49', 6),
(367, 2, 'Hated it', '2020-03-13 11:42:49', 107),
(368, 5, 'Loved it', '2020-03-13 11:42:49', 151),
(369, 1, 'Reliable seller', '2020-03-13 11:42:49', 71),
(370, 3, 'Bad Product', '2020-03-13 11:42:49', 66),
(371, 5, 'Reliable seller', '2020-03-13 11:42:50', 74),
(372, 2, 'Loved it', '2020-03-13 11:42:50', 63),
(373, 3, 'Hated it', '2020-03-13 11:42:50', 96),
(374, 5, 'Bad Product', '2020-03-13 11:42:50', 135),
(375, 5, 'Good Product', '2020-03-13 11:42:50', 43),
(376, 2, 'Hated it', '2020-03-13 11:42:51', 58),
(377, 5, 'Bad Product', '2020-03-13 11:42:51', 93),
(378, 5, 'Good Product', '2020-03-13 11:42:51', 47),
(379, 2, 'Loved it', '2020-03-13 11:42:51', 38),
(380, 4, 'Loved it', '2020-03-13 11:42:52', 135),
(381, 3, 'Loved it', '2020-03-13 11:42:52', 171),
(382, 5, 'Loved it', '2020-03-13 11:42:52', 101),
(383, 2, 'Bad Product', '2020-03-13 11:42:52', 9),
(384, 2, 'Bad Product', '2020-03-13 11:42:52', 204),
(385, 5, 'Good Product', '2020-03-13 11:42:53', 86),
(386, 2, 'Hated it', '2020-03-13 11:42:53', 10),
(387, 4, 'Bad Product', '2020-03-13 11:42:53', 120),
(388, 5, 'Bad Product', '2020-03-13 11:42:53', 185),
(389, 3, 'Reliable seller', '2020-03-13 11:42:53', 49),
(390, 2, 'Good Product', '2020-03-13 11:42:54', 12),
(391, 4, 'Bad Product', '2020-03-13 11:42:54', 13),
(392, 1, 'Bad Product', '2020-03-13 11:42:54', 15),
(393, 3, 'Hated it', '2020-03-13 11:42:54', 14),
(394, 1, 'Reliable seller', '2020-03-13 11:42:55', 181),
(395, 4, 'Reliable seller', '2020-03-13 11:42:55', 32),
(396, 1, 'Bad Product', '2020-03-13 11:42:55', 53),
(397, 3, 'Bad Product', '2020-03-13 11:42:55', 132),
(398, 2, 'Good Product', '2020-03-13 11:42:56', 27),
(399, 4, 'Hated it', '2020-03-13 11:42:56', 31),
(400, 5, 'Loved it', '2020-03-13 11:42:56', 132),
(401, 2, 'Loved it', '2020-03-13 11:42:56', 172),
(402, 1, 'Good Product', '2020-03-13 11:42:57', 111),
(403, 2, 'Hated it', '2020-03-13 11:42:57', 93),
(404, 4, 'Loved it', '2020-03-13 11:42:57', 28),
(405, 2, 'Hated it', '2020-03-13 11:42:57', 149),
(406, 2, 'Hated it', '2020-03-13 11:42:57', 186),
(407, 1, 'Reliable seller', '2020-03-13 11:42:58', 23),
(408, 3, 'Hated it', '2020-03-13 11:42:58', 158),
(409, 1, 'Hated it', '2020-03-13 11:42:58', 157),
(410, 4, 'Bad Product', '2020-03-13 11:42:58', 140),
(411, 1, 'Loved it', '2020-03-13 11:42:58', 17),
(412, 4, 'Loved it', '2020-03-13 11:42:59', 195),
(413, 1, 'Loved it', '2020-03-13 11:42:59', 100),
(414, 4, 'Loved it', '2020-03-13 11:42:59', 165),
(415, 3, 'Reliable seller', '2020-03-13 11:42:59', 197),
(416, 2, 'Hated it', '2020-03-13 11:43:00', 154),
(417, 1, 'Loved it', '2020-03-13 11:43:00', 30),
(418, 4, 'Good Product', '2020-03-13 11:43:00', 106),
(419, 1, 'Loved it', '2020-03-13 11:43:00', 149),
(420, 4, 'Reliable seller', '2020-03-13 11:43:00', 163),
(421, 1, 'Loved it', '2020-03-13 11:43:01', 159),
(422, 1, 'Loved it', '2020-03-13 11:43:01', 2),
(423, 5, 'Bad Product', '2020-03-13 11:43:01', 28),
(424, 4, 'Good Product', '2020-03-13 11:43:01', 80),
(425, 2, 'Hated it', '2020-03-13 11:43:01', 93),
(426, 1, 'Reliable seller', '2020-03-13 11:43:02', 77),
(427, 4, 'Reliable seller', '2020-03-13 11:43:02', 30),
(428, 2, 'Reliable seller', '2020-03-13 11:43:02', 19),
(429, 5, 'Loved it', '2020-03-13 11:43:02', 61),
(430, 1, 'Bad Product', '2020-03-13 11:43:02', 66),
(431, 4, 'Reliable seller', '2020-03-13 11:43:03', 153),
(432, 3, 'Hated it', '2020-03-13 11:43:03', 13),
(433, 2, 'Loved it', '2020-03-13 11:43:03', 89),
(434, 5, 'Loved it', '2020-03-13 11:43:03', 64),
(435, 3, 'Hated it', '2020-03-13 11:43:04', 169),
(436, 2, 'Reliable seller', '2020-03-13 11:43:04', 146),
(437, 5, 'Reliable seller', '2020-03-13 11:43:04', 17),
(438, 2, 'Reliable seller', '2020-03-13 11:43:04', 189),
(439, 4, 'Bad Product', '2020-03-13 11:43:04', 153),
(440, 2, 'Hated it', '2020-03-13 11:43:05', 13),
(441, 2, 'Good Product', '2020-03-13 11:43:05', 134),
(442, 5, 'Reliable seller', '2020-03-13 11:43:05', 29),
(443, 4, 'Bad Product', '2020-03-13 11:43:05', 41),
(444, 5, 'Reliable seller', '2020-03-13 11:43:05', 126),
(445, 1, 'Loved it', '2020-03-13 11:43:06', 137),
(446, 4, 'Good Product', '2020-03-13 11:43:06', 3),
(447, 2, 'Bad Product', '2020-03-13 11:43:06', 82),
(448, 1, 'Hated it', '2020-03-13 11:43:06', 78),
(449, 2, 'Reliable seller', '2020-03-13 11:43:07', 26),
(450, 1, 'Bad Product', '2020-03-13 11:43:07', 125),
(451, 5, 'Bad Product', '2020-03-13 11:43:07', 159),
(452, 4, 'Bad Product', '2020-03-13 11:43:07', 123),
(453, 5, 'Loved it', '2020-03-13 11:43:08', 183),
(454, 2, 'Hated it', '2020-03-13 11:43:08', 142),
(455, 3, 'Loved it', '2020-03-13 11:43:08', 144),
(456, 4, 'Reliable seller', '2020-03-13 11:43:08', 179),
(457, 1, 'Reliable seller', '2020-03-13 11:43:08', 159),
(458, 2, 'Good Product', '2020-03-13 11:43:09', 105),
(459, 3, 'Bad Product', '2020-03-13 11:43:09', 81),
(460, 3, 'Hated it', '2020-03-13 11:43:09', 185),
(461, 3, 'Loved it', '2020-03-13 11:43:09', 12),
(462, 4, 'Loved it', '2020-03-13 11:43:09', 118),
(463, 3, 'Loved it', '2020-03-13 11:43:10', 3),
(464, 5, 'Good Product', '2020-03-13 11:43:10', 168),
(465, 1, 'Reliable seller', '2020-03-13 11:43:10', 21),
(466, 1, 'Hated it', '2020-03-13 11:43:10', 70),
(467, 2, 'Loved it', '2020-03-13 11:43:11', 175),
(468, 2, 'Hated it', '2020-03-13 11:43:11', 204),
(469, 1, 'Hated it', '2020-03-13 11:43:11', 98),
(470, 5, 'Hated it', '2020-03-13 11:43:11', 31),
(471, 4, 'Loved it', '2020-03-13 11:43:11', 130),
(472, 1, 'Good Product', '2020-03-13 11:43:12', 134),
(473, 1, 'Good Product', '2020-03-13 11:43:12', 27),
(474, 2, 'Hated it', '2020-03-13 11:43:12', 1),
(475, 1, 'Bad Product', '2020-03-13 11:43:12', 97),
(476, 2, 'Hated it', '2020-03-13 11:43:12', 124),
(477, 2, 'Bad Product', '2020-03-13 11:43:13', 128),
(478, 5, 'Good Product', '2020-03-13 11:43:13', 58),
(479, 5, 'Loved it', '2020-03-13 11:43:13', 31),
(480, 3, 'Reliable seller', '2020-03-13 11:43:13', 179),
(481, 2, 'Hated it', '2020-03-13 11:43:14', 152),
(482, 5, 'Reliable seller', '2020-03-13 11:43:14', 203),
(483, 3, 'Bad Product', '2020-03-13 11:43:14', 118),
(484, 4, 'Hated it', '2020-03-13 11:43:14', 8),
(485, 1, 'Reliable seller', '2020-03-13 11:43:14', 179),
(486, 5, 'Loved it', '2020-03-13 11:43:15', 113),
(487, 2, 'Hated it', '2020-03-13 11:43:15', 94),
(488, 1, 'Bad Product', '2020-03-13 11:43:15', 56),
(489, 4, 'Loved it', '2020-03-13 11:43:15', 197),
(490, 3, 'Good Product', '2020-03-13 11:43:15', 34),
(491, 1, 'Good Product', '2020-03-13 11:43:16', 174),
(492, 2, 'Good Product', '2020-03-13 11:43:16', 61),
(493, 5, 'Bad Product', '2020-03-13 11:43:16', 160),
(494, 1, 'Loved it', '2020-03-13 11:43:16', 180),
(495, 3, 'Bad Product', '2020-03-13 11:43:16', 69),
(496, 1, 'Good Product', '2020-03-13 11:43:17', 124),
(497, 4, 'Bad Product', '2020-03-13 11:43:17', 133),
(498, 1, 'Bad Product', '2020-03-13 11:43:17', 130),
(499, 1, 'Loved it', '2020-03-13 11:43:17', 155),
(500, 4, 'Bad Product', '2020-03-13 11:43:18', 173),
(501, 4, 'Hated it', '2020-03-13 11:43:18', 52),
(502, 2, 'Good Product', '2020-03-13 11:43:18', 72),
(503, 2, 'Good Product', '2020-03-13 11:43:18', 132),
(504, 4, 'Bad Product', '2020-03-13 11:43:18', 172),
(505, 1, 'Good Product', '2020-03-13 11:43:19', 73),
(506, 5, 'Good Product', '2020-03-13 11:43:19', 83),
(507, 3, 'Loved it', '2020-03-13 11:43:19', 146),
(508, 1, 'Reliable seller', '2020-03-13 11:43:19', 178),
(509, 1, 'Hated it', '2020-03-13 11:43:19', 61),
(510, 2, 'Reliable seller', '2020-03-13 11:43:20', 192),
(511, 5, 'Hated it', '2020-03-13 11:43:20', 2),
(512, 2, 'Good Product', '2020-03-13 11:43:20', 119),
(513, 4, 'Good Product', '2020-03-13 11:43:21', 110),
(514, 4, 'Reliable seller', '2020-03-13 11:43:21', 64),
(515, 3, 'Reliable seller', '2020-03-13 11:43:21', 156),
(516, 3, 'Hated it', '2020-03-13 11:43:21', 69),
(517, 2, 'Hated it', '2020-03-13 11:43:21', 121),
(518, 5, 'Good Product', '2020-03-13 11:43:22', 200),
(519, 4, 'Bad Product', '2020-03-13 11:43:22', 123),
(520, 2, 'Reliable seller', '2020-03-13 11:43:22', 193),
(521, 2, 'Bad Product', '2020-03-13 11:43:22', 24),
(522, 2, 'Hated it', '2020-03-13 11:43:22', 199),
(523, 5, 'Good Product', '2020-03-13 11:43:23', 122),
(524, 2, 'Reliable seller', '2020-03-13 11:43:23', 26),
(525, 1, 'Reliable seller', '2020-03-13 11:43:23', 84),
(526, 2, 'Reliable seller', '2020-03-13 11:43:23', 106),
(527, 2, 'Reliable seller', '2020-03-13 11:43:24', 121),
(528, 5, 'Reliable seller', '2020-03-13 11:43:24', 181),
(529, 2, 'Bad Product', '2020-03-13 11:43:24', 108),
(530, 4, 'Hated it', '2020-03-13 11:43:24', 67),
(531, 5, 'Reliable seller', '2020-03-13 11:43:24', 153),
(532, 2, 'Reliable seller', '2020-03-13 11:43:25', 67),
(533, 5, 'Bad Product', '2020-03-13 11:43:25', 22),
(534, 2, 'Loved it', '2020-03-13 11:43:25', 103),
(535, 5, 'Reliable seller', '2020-03-13 11:43:25', 173),
(536, 3, 'Good Product', '2020-03-13 11:43:26', 71),
(537, 3, 'Loved it', '2020-03-13 11:43:26', 77),
(538, 3, 'Good Product', '2020-03-13 11:43:26', 166),
(539, 2, 'Reliable seller', '2020-03-13 11:43:26', 178),
(540, 2, 'Reliable seller', '2020-03-13 11:43:26', 122),
(541, 3, 'Bad Product', '2020-03-13 11:43:27', 117),
(542, 3, 'Bad Product', '2020-03-13 11:43:27', 142),
(543, 3, 'Reliable seller', '2020-03-13 11:43:27', 124),
(544, 2, 'Hated it', '2020-03-13 11:43:27', 89),
(545, 2, 'Hated it', '2020-03-13 11:43:28', 191),
(546, 5, 'Bad Product', '2020-03-13 11:43:28', 125),
(547, 5, 'Bad Product', '2020-03-13 11:43:28', 114),
(548, 1, 'Loved it', '2020-03-13 11:43:28', 184),
(549, 4, 'Reliable seller', '2020-03-13 11:43:28', 32),
(550, 3, 'Bad Product', '2020-03-13 11:43:29', 62),
(551, 3, 'Hated it', '2020-03-13 11:43:29', 139),
(552, 4, 'Bad Product', '2020-03-13 11:43:29', 142),
(553, 5, 'Bad Product', '2020-03-13 11:43:29', 116),
(554, 1, 'Loved it', '2020-03-13 11:43:30', 93),
(555, 2, 'Loved it', '2020-03-13 11:43:30', 93),
(556, 5, 'Good Product', '2020-03-13 11:43:30', 204),
(557, 3, 'Hated it', '2020-03-13 11:43:30', 189),
(558, 2, 'Loved it', '2020-03-13 11:43:30', 11),
(559, 1, 'Bad Product', '2020-03-13 11:43:31', 5),
(560, 5, 'Good Product', '2020-03-13 11:43:31', 12),
(561, 1, 'Reliable seller', '2020-03-13 11:43:31', 44),
(562, 2, 'Bad Product', '2020-03-13 11:43:31', 108),
(563, 5, 'Bad Product', '2020-03-13 11:43:32', 158),
(564, 5, 'Good Product', '2020-03-13 11:43:32', 123),
(565, 2, 'Good Product', '2020-03-13 11:43:32', 106),
(566, 3, 'Good Product', '2020-03-13 11:43:32', 186),
(567, 5, 'Loved it', '2020-03-13 11:43:32', 91),
(568, 1, 'Reliable seller', '2020-03-13 11:43:33', 99),
(569, 5, 'Loved it', '2020-03-13 11:43:33', 112),
(570, 5, 'Reliable seller', '2020-03-13 11:43:33', 163),
(571, 5, 'Loved it', '2020-03-13 11:43:33', 140),
(572, 1, 'Loved it', '2020-03-13 11:43:33', 88),
(573, 4, 'Reliable seller', '2020-03-13 11:43:34', 57),
(574, 4, 'Loved it', '2020-03-13 11:43:34', 71),
(575, 1, 'Reliable seller', '2020-03-13 11:43:34', 170),
(576, 1, 'Loved it', '2020-03-13 11:43:34', 68),
(577, 5, 'Hated it', '2020-03-13 11:43:34', 173),
(578, 1, 'Bad Product', '2020-03-13 11:43:35', 186),
(579, 4, 'Hated it', '2020-03-13 11:43:35', 127),
(580, 3, 'Hated it', '2020-03-13 11:43:35', 169),
(581, 2, 'Good Product', '2020-03-13 11:43:35', 184),
(582, 1, 'Loved it', '2020-03-13 11:43:36', 133),
(583, 4, 'Loved it', '2020-03-13 11:43:36', 108),
(584, 3, 'Good Product', '2020-03-13 11:43:36', 159),
(585, 2, 'Good Product', '2020-03-13 11:43:36', 36),
(586, 1, 'Loved it', '2020-03-13 11:43:36', 146),
(587, 4, 'Bad Product', '2020-03-13 11:43:37', 19),
(588, 2, 'Hated it', '2020-03-13 11:43:37', 89),
(589, 4, 'Hated it', '2020-03-13 11:43:37', 169),
(590, 3, 'Hated it', '2020-03-13 11:43:37', 48),
(591, 5, 'Loved it', '2020-03-13 11:43:38', 156),
(592, 1, 'Loved it', '2020-03-13 11:43:38', 190),
(593, 3, 'Hated it', '2020-03-13 11:43:38', 40),
(594, 2, 'Loved it', '2020-03-13 11:43:38', 173),
(595, 1, 'Reliable seller', '2020-03-13 11:43:38', 31),
(596, 1, 'Bad Product', '2020-03-13 11:43:39', 81),
(597, 4, 'Loved it', '2020-03-13 11:43:39', 7),
(598, 3, 'Loved it', '2020-03-13 11:43:39', 7),
(599, 2, 'Loved it', '2020-03-13 11:43:39', 60),
(600, 3, 'Bad Product', '2020-03-13 11:43:40', 99),
(601, 3, 'Good Product', '2020-03-13 11:43:40', 46),
(602, 5, 'Hated it', '2020-03-13 11:43:40', 79),
(603, 2, 'Reliable seller', '2020-03-13 11:43:40', 78),
(604, 5, 'Loved it', '2020-03-13 11:43:41', 97),
(605, 2, 'Bad Product', '2020-03-13 11:43:41', 75),
(606, 5, 'Good Product', '2020-03-13 11:43:41', 100),
(607, 3, 'Bad Product', '2020-03-13 11:43:41', 204),
(608, 4, 'Loved it', '2020-03-13 11:43:41', 154),
(609, 4, 'Hated it', '2020-03-13 11:43:42', 1),
(610, 5, 'Bad Product', '2020-03-13 11:43:42', 28),
(611, 5, 'Loved it', '2020-03-13 11:43:42', 10),
(612, 3, 'Hated it', '2020-03-13 11:43:42', 132),
(613, 3, 'Good Product', '2020-03-13 11:43:42', 36),
(614, 1, 'Hated it', '2020-03-13 11:43:43', 7),
(615, 4, 'Loved it', '2020-03-13 11:43:43', 45),
(616, 1, 'Hated it', '2020-03-13 11:43:43', 23),
(617, 5, 'Good Product', '2020-03-13 11:43:43', 8),
(618, 4, 'Bad Product', '2020-03-13 11:43:44', 135),
(619, 2, 'Good Product', '2020-03-13 11:43:44', 196),
(620, 3, 'Reliable seller', '2020-03-13 11:43:44', 95),
(621, 2, 'Good Product', '2020-03-13 11:43:44', 160),
(622, 3, 'Loved it', '2020-03-13 11:43:44', 59),
(623, 4, 'Reliable seller', '2020-03-13 11:43:45', 113),
(624, 4, 'Hated it', '2020-03-13 11:43:45', 175),
(625, 1, 'Hated it', '2020-03-13 11:43:45', 196),
(626, 4, 'Good Product', '2020-03-13 11:43:45', 112),
(627, 2, 'Good Product', '2020-03-13 11:43:46', 133),
(628, 2, 'Bad Product', '2020-03-13 11:43:46', 157),
(629, 3, 'Bad Product', '2020-03-13 11:43:46', 28),
(630, 5, 'Loved it', '2020-03-13 11:43:46', 201),
(631, 2, 'Hated it', '2020-03-13 11:43:46', 95),
(632, 3, 'Loved it', '2020-03-13 11:43:47', 116),
(633, 3, 'Loved it', '2020-03-13 11:43:47', 62),
(634, 3, 'Hated it', '2020-03-13 11:43:47', 61),
(635, 1, 'Bad Product', '2020-03-13 11:43:47', 48),
(636, 4, 'Good Product', '2020-03-13 11:43:48', 17),
(637, 5, 'Hated it', '2020-03-13 11:43:48', 69),
(638, 2, 'Loved it', '2020-03-13 11:43:48', 53),
(639, 1, 'Bad Product', '2020-03-13 11:43:48', 134),
(640, 2, 'Loved it', '2020-03-13 11:43:48', 5),
(641, 5, 'Good Product', '2020-03-13 11:43:49', 200),
(642, 1, 'Hated it', '2020-03-13 11:43:49', 126),
(643, 5, 'Reliable seller', '2020-03-13 11:43:49', 188),
(644, 2, 'Bad Product', '2020-03-13 11:43:49', 30),
(645, 4, 'Good Product', '2020-03-13 11:43:49', 63),
(646, 3, 'Reliable seller', '2020-03-13 11:43:50', 23),
(647, 2, 'Good Product', '2020-03-13 11:43:50', 85),
(648, 1, 'Hated it', '2020-03-13 11:43:50', 146),
(649, 2, 'Loved it', '2020-03-13 11:43:50', 197),
(650, 2, 'Hated it', '2020-03-13 11:43:51', 27),
(651, 1, 'Loved it', '2020-03-13 11:43:51', 37),
(652, 3, 'Loved it', '2020-03-13 11:43:51', 95),
(653, 4, 'Hated it', '2020-03-13 11:43:51', 70),
(654, 5, 'Good Product', '2020-03-13 11:43:52', 77),
(655, 2, 'Good Product', '2020-03-13 11:43:52', 56),
(656, 3, 'Bad Product', '2020-03-13 11:43:52', 88),
(657, 1, 'Hated it', '2020-03-13 11:43:52', 183),
(658, 1, 'Loved it', '2020-03-13 11:43:53', 51),
(659, 2, 'Loved it', '2020-03-13 11:43:53', 130),
(660, 2, 'Loved it', '2020-03-13 11:43:53', 34),
(661, 5, 'Good Product', '2020-03-13 11:43:53', 82),
(662, 2, 'Loved it', '2020-03-13 11:43:53', 66),
(663, 4, 'Bad Product', '2020-03-13 11:43:54', 192),
(664, 2, 'Bad Product', '2020-03-13 11:43:54', 189),
(665, 1, 'Good Product', '2020-03-13 11:43:54', 186),
(666, 1, 'Reliable seller', '2020-03-13 11:43:54', 49),
(667, 3, 'Loved it', '2020-03-13 11:43:54', 190),
(668, 4, 'Hated it', '2020-03-13 11:43:55', 152),
(669, 1, 'Bad Product', '2020-03-13 11:43:55', 190),
(670, 4, 'Reliable seller', '2020-03-13 11:43:55', 184),
(671, 4, 'Good Product', '2020-03-13 11:43:55', 71),
(672, 3, 'Reliable seller', '2020-03-13 11:43:56', 150),
(673, 1, 'Good Product', '2020-03-13 11:43:56', 190),
(674, 2, 'Good Product', '2020-03-13 11:43:56', 196),
(675, 2, 'Reliable seller', '2020-03-13 11:43:56', 53),
(676, 4, 'Good Product', '2020-03-13 11:43:56', 115),
(677, 2, 'Loved it', '2020-03-13 11:43:57', 171),
(678, 5, 'Hated it', '2020-03-13 11:43:57', 31),
(679, 2, 'Loved it', '2020-03-13 11:43:57', 30),
(680, 2, 'Good Product', '2020-03-13 11:43:57', 99),
(681, 4, 'Hated it', '2020-03-13 11:43:58', 189),
(682, 1, 'Reliable seller', '2020-03-13 11:43:58', 112),
(683, 3, 'Hated it', '2020-03-13 11:43:58', 122),
(684, 1, 'Bad Product', '2020-03-13 11:43:58', 5),
(685, 2, 'Reliable seller', '2020-03-13 11:43:59', 168),
(686, 5, 'Bad Product', '2020-03-13 11:43:59', 97),
(687, 4, 'Hated it', '2020-03-13 11:43:59', 163),
(688, 5, 'Loved it', '2020-03-13 11:43:59', 46),
(689, 5, 'Bad Product', '2020-03-13 11:44:00', 107),
(690, 3, 'Bad Product', '2020-03-13 11:44:00', 48),
(691, 3, 'Good Product', '2020-03-13 11:44:00', 175),
(692, 3, 'Bad Product', '2020-03-13 11:44:00', 164),
(693, 5, 'Good Product', '2020-03-13 11:44:00', 180),
(694, 3, 'Hated it', '2020-03-13 11:44:01', 85),
(695, 5, 'Bad Product', '2020-03-13 11:44:01', 8),
(696, 2, 'Loved it', '2020-03-13 11:44:01', 116),
(697, 3, 'Reliable seller', '2020-03-13 11:44:01', 38),
(698, 5, 'Loved it', '2020-03-13 11:44:02', 186),
(699, 1, 'Reliable seller', '2020-03-13 11:44:02', 34),
(700, 1, 'Bad Product', '2020-03-13 11:44:02', 5),
(701, 1, 'Reliable seller', '2020-03-13 11:44:02', 191),
(702, 2, 'Bad Product', '2020-03-13 11:44:02', 127),
(703, 1, 'Reliable seller', '2020-03-13 11:44:03', 44),
(704, 2, 'Hated it', '2020-03-13 11:44:03', 94),
(705, 5, 'Hated it', '2020-03-13 11:44:03', 125),
(706, 2, 'Good Product', '2020-03-13 11:44:03', 12),
(707, 1, 'Hated it', '2020-03-13 11:44:04', 133),
(708, 5, 'Hated it', '2020-03-13 11:44:04', 197),
(709, 5, 'Loved it', '2020-03-13 11:44:04', 115),
(710, 3, 'Loved it', '2020-03-13 11:44:04', 3),
(711, 4, 'Reliable seller', '2020-03-13 11:44:04', 202),
(712, 1, 'Loved it', '2020-03-13 11:44:05', 138),
(713, 5, 'Bad Product', '2020-03-13 11:44:05', 184),
(714, 2, 'Reliable seller', '2020-03-13 11:44:05', 44),
(715, 3, 'Hated it', '2020-03-13 11:44:05', 23),
(716, 4, 'Reliable seller', '2020-03-13 11:44:05', 57),
(717, 5, 'Reliable seller', '2020-03-13 11:44:06', 55),
(718, 5, 'Bad Product', '2020-03-13 11:44:06', 115),
(719, 4, 'Reliable seller', '2020-03-13 11:44:06', 115),
(720, 2, 'Bad Product', '2020-03-13 11:44:06', 118),
(721, 3, 'Bad Product', '2020-03-13 11:44:07', 65),
(722, 3, 'Loved it', '2020-03-13 11:44:07', 115),
(723, 5, 'Reliable seller', '2020-03-13 11:44:07', 45),
(724, 1, 'Bad Product', '2020-03-13 11:44:07', 112),
(725, 5, 'Reliable seller', '2020-03-13 11:44:07', 132),
(726, 5, 'Reliable seller', '2020-03-13 11:44:08', 31),
(727, 1, 'Hated it', '2020-03-13 11:44:08', 191),
(728, 3, 'Reliable seller', '2020-03-13 11:44:08', 51),
(729, 5, 'Loved it', '2020-03-13 11:44:08', 192),
(730, 2, 'Good Product', '2020-03-13 11:44:09', 82),
(731, 5, 'Hated it', '2020-03-13 11:44:09', 195),
(732, 1, 'Hated it', '2020-03-13 11:44:09', 102),
(733, 2, 'Reliable seller', '2020-03-13 11:44:09', 205),
(734, 1, 'Good Product', '2020-03-13 11:44:09', 123),
(735, 4, 'Reliable seller', '2020-03-13 11:44:10', 151),
(736, 5, 'Hated it', '2020-03-13 11:44:10', 90),
(737, 3, 'Bad Product', '2020-03-13 11:44:10', 49),
(738, 5, 'Reliable seller', '2020-03-13 11:44:10', 5),
(739, 3, 'Reliable seller', '2020-03-13 11:44:11', 204),
(740, 5, 'Reliable seller', '2020-03-13 11:44:11', 178),
(741, 1, 'Good Product', '2020-03-13 11:44:11', 182),
(742, 3, 'Reliable seller', '2020-03-13 11:44:11', 95),
(743, 3, 'Reliable seller', '2020-03-13 11:44:11', 160),
(744, 4, 'Good Product', '2020-03-13 11:44:12', 170),
(745, 3, 'Loved it', '2020-03-13 11:44:12', 107),
(746, 1, 'Reliable seller', '2020-03-13 11:44:12', 16),
(747, 1, 'Reliable seller', '2020-03-13 11:44:12', 4),
(748, 2, 'Good Product', '2020-03-13 11:44:12', 173),
(749, 1, 'Good Product', '2020-03-13 11:44:13', 60),
(750, 4, 'Bad Product', '2020-03-13 11:44:13', 165),
(751, 3, 'Bad Product', '2020-03-13 11:44:13', 203),
(752, 1, 'Reliable seller', '2020-03-13 11:44:13', 75),
(753, 4, 'Loved it', '2020-03-13 11:44:14', 119),
(754, 1, 'Hated it', '2020-03-13 11:44:14', 79),
(755, 5, 'Hated it', '2020-03-13 11:44:14', 180),
(756, 2, 'Bad Product', '2020-03-13 11:44:14', 47),
(757, 1, 'Hated it', '2020-03-13 11:44:14', 184),
(758, 3, 'Loved it', '2020-03-13 11:44:15', 57),
(759, 3, 'Reliable seller', '2020-03-13 11:44:15', 87),
(760, 5, 'Loved it', '2020-03-13 11:44:15', 83),
(761, 3, 'Loved it', '2020-03-13 11:44:15', 37),
(762, 1, 'Loved it', '2020-03-13 11:44:15', 112),
(763, 2, 'Hated it', '2020-03-13 11:44:16', 112),
(764, 1, 'Bad Product', '2020-03-13 11:44:16', 190),
(765, 1, 'Loved it', '2020-03-13 11:44:16', 47),
(766, 2, 'Loved it', '2020-03-13 11:44:16', 196),
(767, 4, 'Bad Product', '2020-03-13 11:44:17', 66),
(768, 1, 'Reliable seller', '2020-03-13 11:44:17', 67),
(769, 2, 'Reliable seller', '2020-03-13 11:44:17', 175),
(770, 5, 'Good Product', '2020-03-13 11:44:17', 32),
(771, 4, 'Good Product', '2020-03-13 11:44:17', 119),
(772, 4, 'Bad Product', '2020-03-13 11:44:18', 42),
(773, 5, 'Reliable seller', '2020-03-13 11:44:18', 49),
(774, 4, 'Reliable seller', '2020-03-13 11:44:18', 87),
(775, 4, 'Bad Product', '2020-03-13 11:44:18', 11),
(776, 2, 'Bad Product', '2020-03-13 11:44:18', 144),
(777, 3, 'Bad Product', '2020-03-13 11:44:19', 26),
(778, 4, 'Good Product', '2020-03-13 11:44:19', 140),
(779, 5, 'Good Product', '2020-03-13 11:44:19', 56),
(780, 5, 'Bad Product', '2020-03-13 11:44:19', 110),
(781, 5, 'Bad Product', '2020-03-13 11:44:20', 166),
(782, 2, 'Good Product', '2020-03-13 11:44:20', 78),
(783, 1, 'Bad Product', '2020-03-13 11:44:20', 24),
(784, 4, 'Loved it', '2020-03-13 11:44:20', 162),
(785, 3, 'Reliable seller', '2020-03-13 11:44:21', 75),
(786, 1, 'Good Product', '2020-03-13 11:44:21', 11),
(787, 4, 'Good Product', '2020-03-13 11:44:21', 96),
(788, 4, 'Loved it', '2020-03-13 11:44:21', 130),
(789, 2, 'Good Product', '2020-03-13 11:44:21', 143),
(790, 2, 'Reliable seller', '2020-03-13 11:44:22', 194),
(791, 5, 'Loved it', '2020-03-13 11:44:22', 92),
(792, 1, 'Good Product', '2020-03-13 11:44:22', 120),
(793, 4, 'Good Product', '2020-03-13 11:44:22', 118),
(794, 4, 'Bad Product', '2020-03-13 11:44:22', 69),
(795, 2, 'Reliable seller', '2020-03-13 11:44:23', 125),
(796, 1, 'Hated it', '2020-03-13 11:44:23', 38),
(797, 3, 'Good Product', '2020-03-13 11:44:23', 150),
(798, 3, 'Good Product', '2020-03-13 11:44:23', 204),
(799, 1, 'Good Product', '2020-03-13 11:44:24', 128),
(800, 1, 'Loved it', '2020-03-13 11:44:24', 10),
(801, 4, 'Good Product', '2020-03-13 11:44:24', 78),
(802, 5, 'Good Product', '2020-03-13 11:44:24', 200),
(803, 3, 'Good Product', '2020-03-13 11:44:25', 173),
(804, 1, 'Loved it', '2020-03-13 11:44:25', 4),
(805, 3, 'Reliable seller', '2020-03-13 11:44:25', 131),
(806, 1, 'Good Product', '2020-03-13 11:44:25', 65),
(807, 2, 'Reliable seller', '2020-03-13 11:44:25', 21),
(808, 5, 'Reliable seller', '2020-03-13 11:44:26', 89),
(809, 5, 'Good Product', '2020-03-13 11:44:26', 27),
(810, 1, 'Good Product', '2020-03-13 11:44:26', 4),
(811, 4, 'Reliable seller', '2020-03-13 11:44:26', 120),
(812, 3, 'Loved it', '2020-03-13 11:44:26', 202),
(813, 5, 'Good Product', '2020-03-13 11:44:27', 63),
(814, 5, 'Loved it', '2020-03-13 11:44:27', 155),
(815, 4, 'Hated it', '2020-03-13 11:44:27', 41),
(816, 5, 'Bad Product', '2020-03-13 11:44:27', 175),
(817, 4, 'Loved it', '2020-03-13 11:44:28', 186),
(818, 3, 'Loved it', '2020-03-13 11:44:28', 191),
(819, 1, 'Hated it', '2020-03-13 11:44:28', 111),
(820, 5, 'Good Product', '2020-03-13 11:44:28', 22),
(821, 3, 'Bad Product', '2020-03-13 11:44:28', 26),
(822, 4, 'Reliable seller', '2020-03-13 11:44:29', 161),
(823, 5, 'Bad Product', '2020-03-13 11:44:29', 160),
(824, 2, 'Loved it', '2020-03-13 11:44:29', 145),
(825, 3, 'Good Product', '2020-03-13 11:44:29', 25),
(826, 4, 'Hated it', '2020-03-13 11:44:29', 14),
(827, 3, 'Loved it', '2020-03-13 11:44:30', 91),
(828, 1, 'Bad Product', '2020-03-13 11:44:30', 184),
(829, 5, 'Bad Product', '2020-03-13 11:44:30', 75),
(830, 4, 'Bad Product', '2020-03-13 11:44:30', 148),
(831, 1, 'Bad Product', '2020-03-13 11:44:31', 90),
(832, 4, 'Good Product', '2020-03-13 11:44:31', 22),
(833, 2, 'Loved it', '2020-03-13 11:44:31', 137),
(834, 4, 'Loved it', '2020-03-13 11:44:31', 173),
(835, 1, 'Reliable seller', '2020-03-13 11:44:31', 205),
(836, 5, 'Bad Product', '2020-03-13 11:44:32', 176),
(837, 3, 'Bad Product', '2020-03-13 11:44:32', 193),
(838, 3, 'Hated it', '2020-03-13 11:44:32', 14),
(839, 1, 'Reliable seller', '2020-03-13 11:44:32', 95),
(840, 1, 'Hated it', '2020-03-13 11:44:33', 40),
(841, 2, 'Good Product', '2020-03-13 11:44:33', 94),
(842, 5, 'Loved it', '2020-03-13 11:44:33', 119),
(843, 3, 'Bad Product', '2020-03-13 11:44:33', 205),
(844, 2, 'Bad Product', '2020-03-13 11:44:34', 48),
(845, 1, 'Hated it', '2020-03-13 11:44:34', 27),
(846, 3, 'Bad Product', '2020-03-13 11:44:34', 200),
(847, 1, 'Reliable seller', '2020-03-13 11:44:34', 42),
(848, 5, 'Loved it', '2020-03-13 11:44:35', 200),
(849, 4, 'Loved it', '2020-03-13 11:44:35', 169),
(850, 4, 'Loved it', '2020-03-13 11:44:35', 37),
(851, 1, 'Bad Product', '2020-03-13 11:44:35', 106),
(852, 3, 'Reliable seller', '2020-03-13 11:44:35', 154),
(853, 1, 'Reliable seller', '2020-03-13 11:44:36', 81),
(854, 1, 'Reliable seller', '2020-03-13 11:44:36', 90),
(855, 3, 'Hated it', '2020-03-13 11:44:36', 106),
(856, 1, 'Good Product', '2020-03-13 11:44:36', 73),
(857, 2, 'Hated it', '2020-03-13 11:44:37', 145),
(858, 4, 'Reliable seller', '2020-03-13 11:44:37', 194),
(859, 3, 'Reliable seller', '2020-03-13 11:44:37', 179),
(860, 1, 'Reliable seller', '2020-03-13 11:44:37', 77),
(861, 3, 'Loved it', '2020-03-13 11:44:37', 34),
(862, 2, 'Hated it', '2020-03-13 11:44:38', 71),
(863, 1, 'Good Product', '2020-03-13 11:44:38', 50),
(864, 3, 'Hated it', '2020-03-13 11:44:38', 63),
(865, 4, 'Reliable seller', '2020-03-13 11:44:38', 107),
(866, 5, 'Loved it', '2020-03-13 11:44:38', 84),
(867, 2, 'Good Product', '2020-03-13 11:44:39', 196),
(868, 1, 'Loved it', '2020-03-13 11:44:39', 205),
(869, 1, 'Hated it', '2020-03-13 11:44:39', 42),
(870, 4, 'Reliable seller', '2020-03-13 11:44:39', 63),
(871, 3, 'Good Product', '2020-03-13 11:44:40', 200),
(872, 2, 'Bad Product', '2020-03-13 11:44:40', 126),
(873, 1, 'Bad Product', '2020-03-13 11:44:40', 73),
(874, 2, 'Reliable seller', '2020-03-13 11:44:40', 17),
(875, 1, 'Reliable seller', '2020-03-13 11:44:41', 15),
(876, 4, 'Good Product', '2020-03-13 11:44:41', 44),
(877, 5, 'Loved it', '2020-03-13 11:44:41', 97),
(878, 5, 'Loved it', '2020-03-13 11:44:41', 119),
(879, 5, 'Good Product', '2020-03-13 11:44:41', 34),
(880, 3, 'Loved it', '2020-03-13 11:44:42', 103),
(881, 4, 'Reliable seller', '2020-03-13 11:44:42', 55),
(882, 3, 'Good Product', '2020-03-13 11:44:42', 41),
(883, 5, 'Bad Product', '2020-03-13 11:44:42', 90),
(884, 4, 'Hated it', '2020-03-13 11:44:42', 185),
(885, 5, 'Bad Product', '2020-03-13 11:44:43', 64),
(886, 3, 'Good Product', '2020-03-13 11:44:43', 154),
(887, 5, 'Good Product', '2020-03-13 11:44:43', 90),
(888, 3, 'Reliable seller', '2020-03-13 11:44:43', 149),
(889, 3, 'Reliable seller', '2020-03-13 11:44:44', 22),
(890, 4, 'Bad Product', '2020-03-13 11:44:44', 78),
(891, 3, 'Good Product', '2020-03-13 11:44:44', 92),
(892, 4, 'Loved it', '2020-03-13 11:44:44', 125),
(893, 5, 'Bad Product', '2020-03-13 11:44:44', 110),
(894, 2, 'Good Product', '2020-03-13 11:44:45', 184),
(895, 2, 'Reliable seller', '2020-03-13 11:44:45', 172),
(896, 4, 'Good Product', '2020-03-13 11:44:45', 15),
(897, 5, 'Loved it', '2020-03-13 11:44:45', 175),
(898, 4, 'Bad Product', '2020-03-13 11:44:46', 112),
(899, 2, 'Bad Product', '2020-03-13 11:44:46', 156),
(900, 4, 'Reliable seller', '2020-03-13 11:44:46', 130),
(901, 1, 'Hated it', '2020-03-13 11:44:46', 133),
(902, 4, 'Good Product', '2020-03-13 11:44:47', 65),
(903, 3, 'Bad Product', '2020-03-13 11:44:47', 25),
(904, 4, 'Reliable seller', '2020-03-13 11:44:47', 26),
(905, 4, 'Good Product', '2020-03-13 11:44:47', 152),
(906, 5, 'Good Product', '2020-03-13 11:44:47', 129),
(907, 4, 'Bad Product', '2020-03-13 11:44:48', 8),
(908, 1, 'Bad Product', '2020-03-13 11:44:48', 36),
(909, 1, 'Reliable seller', '2020-03-13 11:44:48', 21),
(910, 4, 'Good Product', '2020-03-13 11:44:48', 178),
(911, 2, 'Hated it', '2020-03-13 11:44:49', 114),
(912, 4, 'Hated it', '2020-03-13 11:44:49', 50),
(913, 2, 'Bad Product', '2020-03-13 11:44:49', 38),
(914, 5, 'Bad Product', '2020-03-13 11:44:49', 117),
(915, 5, 'Reliable seller', '2020-03-13 11:44:49', 117),
(916, 4, 'Reliable seller', '2020-03-13 11:44:50', 84),
(917, 3, 'Hated it', '2020-03-13 11:44:50', 74),
(918, 2, 'Hated it', '2020-03-13 11:44:50', 137),
(919, 1, 'Loved it', '2020-03-13 11:44:50', 156),
(920, 5, 'Loved it', '2020-03-13 11:44:51', 199),
(921, 5, 'Good Product', '2020-03-13 11:44:51', 46),
(922, 2, 'Hated it', '2020-03-13 11:44:51', 67),
(923, 4, 'Bad Product', '2020-03-13 11:44:51', 1),
(924, 4, 'Hated it', '2020-03-13 11:44:51', 53),
(925, 2, 'Hated it', '2020-03-13 11:44:52', 150),
(926, 1, 'Bad Product', '2020-03-13 11:44:52', 86),
(927, 3, 'Loved it', '2020-03-13 11:44:52', 65),
(928, 1, 'Reliable seller', '2020-03-13 11:44:52', 161),
(929, 3, 'Loved it', '2020-03-13 11:44:53', 131),
(930, 3, 'Hated it', '2020-03-13 11:44:53', 97),
(931, 2, 'Loved it', '2020-03-13 11:44:53', 191),
(932, 4, 'Good Product', '2020-03-13 11:44:53', 51),
(933, 2, 'Loved it', '2020-03-13 11:44:53', 78),
(934, 1, 'Loved it', '2020-03-13 11:44:54', 201),
(935, 2, 'Reliable seller', '2020-03-13 11:44:54', 52),
(936, 2, 'Bad Product', '2020-03-13 11:44:54', 28),
(937, 2, 'Hated it', '2020-03-13 11:44:54', 99),
(938, 1, 'Loved it', '2020-03-13 11:44:54', 205),
(939, 1, 'Reliable seller', '2020-03-13 11:44:55', 160),
(940, 5, 'Bad Product', '2020-03-13 11:44:55', 59),
(941, 4, 'Hated it', '2020-03-13 11:44:55', 132),
(942, 1, 'Hated it', '2020-03-13 11:44:55', 135),
(943, 4, 'Bad Product', '2020-03-13 11:44:56', 179),
(944, 2, 'Hated it', '2020-03-13 11:44:56', 45),
(945, 3, 'Hated it', '2020-03-13 11:44:56', 30),
(946, 5, 'Reliable seller', '2020-03-13 11:44:56', 61),
(947, 5, 'Good Product', '2020-03-13 11:44:57', 104),
(948, 4, 'Reliable seller', '2020-03-13 11:44:57', 86),
(949, 2, 'Good Product', '2020-03-13 11:44:57', 138),
(950, 4, 'Hated it', '2020-03-13 11:44:57', 191),
(951, 2, 'Reliable seller', '2020-03-13 11:44:57', 107),
(952, 4, 'Hated it', '2020-03-13 11:44:58', 102),
(953, 2, 'Bad Product', '2020-03-13 11:44:58', 200),
(954, 3, 'Reliable seller', '2020-03-13 11:44:58', 73),
(955, 1, 'Good Product', '2020-03-13 11:44:58', 49),
(956, 5, 'Hated it', '2020-03-13 11:44:59', 123),
(957, 1, 'Bad Product', '2020-03-13 11:44:59', 202),
(958, 4, 'Bad Product', '2020-03-13 11:44:59', 18),
(959, 5, 'Good Product', '2020-03-13 11:44:59', 149),
(960, 4, 'Hated it', '2020-03-13 11:44:59', 139),
(961, 1, 'Reliable seller', '2020-03-13 11:45:00', 50),
(962, 2, 'Hated it', '2020-03-13 11:45:00', 164),
(963, 4, 'Loved it', '2020-03-13 11:45:00', 81),
(964, 1, 'Good Product', '2020-03-13 11:45:00', 199),
(965, 5, 'Loved it', '2020-03-13 11:45:01', 32),
(966, 3, 'Hated it', '2020-03-13 11:45:01', 174),
(967, 5, 'Loved it', '2020-03-13 11:45:01', 80),
(968, 4, 'Reliable seller', '2020-03-13 11:45:01', 177),
(969, 2, 'Good Product', '2020-03-13 11:45:01', 139),
(970, 5, 'Loved it', '2020-03-13 11:45:02', 146),
(971, 4, 'Bad Product', '2020-03-13 11:45:02', 13),
(972, 1, 'Good Product', '2020-03-13 11:45:02', 149),
(973, 5, 'Bad Product', '2020-03-13 11:45:02', 6),
(974, 1, 'Bad Product', '2020-03-13 11:45:03', 201),
(975, 1, 'Hated it', '2020-03-13 11:45:03', 146),
(976, 4, 'Reliable seller', '2020-03-13 11:45:03', 162),
(977, 4, 'Bad Product', '2020-03-13 11:45:03', 58),
(978, 3, 'Loved it', '2020-03-13 11:45:03', 158),
(979, 3, 'Loved it', '2020-03-13 11:45:04', 124),
(980, 1, 'Good Product', '2020-03-13 11:45:04', 126),
(981, 5, 'Bad Product', '2020-03-13 11:45:04', 28),
(982, 5, 'Loved it', '2020-03-13 11:45:04', 65),
(983, 5, 'Loved it', '2020-03-13 11:45:04', 107),
(984, 4, 'Bad Product', '2020-03-13 11:45:05', 167),
(985, 2, 'Reliable seller', '2020-03-13 11:45:05', 98),
(986, 4, 'Good Product', '2020-03-13 11:45:05', 145),
(987, 2, 'Reliable seller', '2020-03-13 11:45:05', 25),
(988, 1, 'Hated it', '2020-03-13 11:45:05', 163),
(989, 2, 'Loved it', '2020-03-13 11:45:06', 25),
(990, 3, 'Good Product', '2020-03-13 11:45:06', 58),
(991, 4, 'Loved it', '2020-03-13 11:45:06', 202),
(992, 3, 'Loved it', '2020-03-13 11:45:06', 191),
(993, 2, 'Reliable seller', '2020-03-13 11:45:07', 159);
INSERT INTO `rating` (`id`, `r`, `review`, `timeStamp`, `product_id`) VALUES
(994, 4, 'Hated it', '2020-03-13 11:45:07', 68),
(995, 4, 'Hated it', '2020-03-13 11:45:07', 78),
(996, 3, 'Reliable seller', '2020-03-13 11:45:07', 18),
(997, 2, 'Bad Product', '2020-03-13 11:45:08', 22),
(998, 3, 'Reliable seller', '2020-03-13 11:45:08', 109),
(999, 4, 'Hated it', '2020-03-13 11:45:08', 104),
(1000, 4, 'Bad Product', '2020-03-13 11:45:08', 68),
(1001, 3, 'Bad Product', '2020-03-13 11:45:08', 36),
(1002, 3, 'Bad Product', '2020-03-13 11:45:09', 53),
(1003, 2, 'Hated it', '2020-03-13 11:45:09', 100),
(1004, 5, 'Bad Product', '2020-03-13 11:45:09', 62),
(1005, 4, 'Bad Product', '2020-03-13 11:45:09', 200),
(1006, 3, 'Good Product', '2020-03-13 11:45:10', 4),
(1007, 2, 'Bad Product', '2020-03-13 11:45:10', 179),
(1008, 1, 'Loved it', '2020-03-13 11:45:10', 91),
(1009, 5, 'Bad Product', '2020-03-13 11:45:10', 183),
(1010, 1, 'Good Product', '2020-03-13 11:45:10', 202),
(1011, 4, 'Bad Product', '2020-03-13 11:45:11', 201),
(1012, 1, 'Loved it', '2020-03-13 11:45:11', 107),
(1013, 5, 'Hated it', '2020-03-13 11:45:11', 35),
(1014, 1, 'Good Product', '2020-03-13 11:45:11', 158),
(1015, 2, 'Reliable seller', '2020-03-13 11:45:12', 205),
(1016, 4, 'Good Product', '2020-03-13 11:45:12', 6),
(1017, 5, 'Good Product', '2020-03-13 11:45:12', 122),
(1018, 5, 'Hated it', '2020-03-13 11:45:12', 65),
(1019, 5, 'Hated it', '2020-03-13 11:45:12', 82),
(1020, 3, 'Loved it', '2020-03-13 11:45:13', 97),
(1021, 2, 'Hated it', '2020-03-13 11:45:13', 111),
(1022, 2, 'Reliable seller', '2020-03-13 11:45:13', 176),
(1023, 5, 'Reliable seller', '2020-03-13 11:45:13', 186),
(1024, 5, 'Bad Product', '2020-03-13 11:45:14', 153),
(1025, 1, 'Loved it', '2020-03-13 11:45:14', 109),
(1026, 1, 'Reliable seller', '2020-03-13 11:45:14', 179),
(1027, 2, 'Reliable seller', '2020-03-13 11:45:14', 98),
(1028, 3, 'Loved it', '2020-03-13 11:45:14', 98),
(1029, 5, 'Bad Product', '2020-03-13 11:45:15', 78),
(1030, 1, 'Bad Product', '2020-03-13 11:45:15', 46),
(1031, 1, 'Reliable seller', '2020-03-13 11:45:15', 193),
(1032, 4, 'Bad Product', '2020-03-13 11:45:15', 90),
(1033, 2, 'Good Product', '2020-03-13 11:45:16', 169),
(1034, 5, 'Good Product', '2020-03-14 13:37:34', 187),
(1035, 5, 'Good Product', '2020-03-14 13:38:34', 198);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` int(11) NOT NULL,
  `custID` int(11) NOT NULL,
  `companyName` varchar(60) NOT NULL,
  `specialty` varchar(60) NOT NULL,
  `companyLogo` varchar(60) NOT NULL,
  `approved` varchar(10) NOT NULL,
  `address` varchar(60) NOT NULL,
  `additionalInfo` varchar(60) NOT NULL,
  `city` varchar(60) NOT NULL,
  `region` varchar(60) NOT NULL,
  `timeStamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `custID`, `companyName`, `specialty`, `companyLogo`, `approved`, `address`, `additionalInfo`, `city`, `region`, `timeStamp`) VALUES
(1, 1, 'Khalid', 'Suits', 'companies/default.png', 'Y', 'Rongai', 'Phase 22', 'Nairobi', 'Rongai', '2020-03-02 10:44:26'),
(2, 2, 'Lennylen', 'Shirts', 'companies/default.png', 'N', 'Langata', 'Phase 2A', 'Nairobi', 'Langata', '2020-03-02 10:44:27');

-- --------------------------------------------------------

--
-- Table structure for table `shippers`
--

CREATE TABLE `shippers` (
  `id` int(11) NOT NULL,
  `companyName` varchar(60) NOT NULL,
  `companyLogo` varchar(60) NOT NULL,
  `phone1` varchar(60) NOT NULL,
  `phone2` varchar(60) DEFAULT NULL,
  `email1` varchar(60) NOT NULL,
  `email2` varchar(60) DEFAULT NULL,
  `address` varchar(60) NOT NULL,
  `additionalInfo` varchar(60) NOT NULL,
  `city` varchar(60) NOT NULL,
  `region` varchar(60) NOT NULL,
  `timeStamp` datetime DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_admin_email` (`email`),
  ADD KEY `ix_admin_fname` (`fname`),
  ADD KEY `ix_admin_lname` (`lname`),
  ADD KEY `ix_admin_phone1` (`phone1`),
  ADD KEY `ix_admin_phone2` (`phone2`),
  ADD KEY `ix_admin_pword` (`pword`),
  ADD KEY `ix_admin_timeStamp` (`timeStamp`);

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_brand_brandLogo` (`brandLogo`),
  ADD KEY `ix_brand_brandName` (`brandName`),
  ADD KEY `ix_brand_timeStamp` (`timeStamp`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_category_categoryName` (`categoryName`),
  ADD KEY `ix_category_picPath` (`picPath`),
  ADD KEY `ix_category_timeStamp` (`timeStamp`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_customers_additionalInfo` (`additionalInfo`),
  ADD KEY `ix_customers_address` (`address`),
  ADD KEY `ix_customers_city` (`city`),
  ADD KEY `ix_customers_email` (`email`),
  ADD KEY `ix_customers_fname` (`fname`),
  ADD KEY `ix_customers_lname` (`lname`),
  ADD KEY `ix_customers_phone1` (`phone1`),
  ADD KEY `ix_customers_pword` (`pword`),
  ADD KEY `ix_customers_region` (`region`),
  ADD KEY `ix_customers_timeStamp` (`timeStamp`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_material_materialName` (`materialName`),
  ADD KEY `ix_material_timeStamp` (`timeStamp`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_orderdetails_color` (`color`),
  ADD KEY `ix_orderdetails_discount` (`discount`),
  ADD KEY `ix_orderdetails_fulfilledDate` (`fulfilledDate`),
  ADD KEY `ix_orderdetails_price` (`price`),
  ADD KEY `ix_orderdetails_quantity` (`quantity`),
  ADD KEY `ix_orderdetails_size` (`size`),
  ADD KEY `ix_orderdetails_timeStamp` (`timeStamp`),
  ADD KEY `ix_orderdetails_total` (`total`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_orders_timeStamp` (`timeStamp`),
  ADD KEY `ix_orders_transactionCode` (`transactionCode`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_payment_dripQuota` (`dripQuota`),
  ADD KEY `ix_payment_dripQuotaTotal` (`dripQuotaTotal`),
  ADD KEY `ix_payment_paidTotal` (`paidTotal`),
  ADD KEY `ix_payment_sellerReturns` (`sellerReturns`),
  ADD KEY `ix_payment_shipperPrice` (`shipperPrice`),
  ADD KEY `ix_payment_timeStamp` (`timeStamp`),
  ADD KEY `ix_payment_total` (`total`),
  ADD KEY `ix_payment_transactionCode` (`transactionCode`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_products_adultOrNot` (`adultOrNot`),
  ADD KEY `ix_products_availableColor` (`availableColor`),
  ADD KEY `ix_products_availableDiscount` (`availableDiscount`),
  ADD KEY `ix_products_availableGender` (`availableGender`),
  ADD KEY `ix_products_availableQuantity` (`availableQuantity`),
  ADD KEY `ix_products_availableSize` (`availableSize`),
  ADD KEY `ix_products_brandid` (`brandid`),
  ADD KEY `ix_products_categoryid` (`categoryid`),
  ADD KEY `ix_products_discount` (`discount`),
  ADD KEY `ix_products_id` (`id`),
  ADD KEY `ix_products_materialid` (`materialid`),
  ADD KEY `ix_products_picturePath` (`picturePath`),
  ADD KEY `ix_products_productDescription` (`productDescription`),
  ADD KEY `ix_products_productName` (`productName`),
  ADD KEY `ix_products_sellerid` (`sellerid`),
  ADD KEY `ix_products_timeStamp` (`timeStamp`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_rating_r` (`r`),
  ADD KEY `ix_rating_review` (`review`),
  ADD KEY `ix_rating_timeStamp` (`timeStamp`),
  ADD KEY `ix_rating_product_id` (`product_id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_sellers_additionalInfo` (`additionalInfo`),
  ADD KEY `ix_sellers_address` (`address`),
  ADD KEY `ix_sellers_approved` (`approved`),
  ADD KEY `ix_sellers_city` (`city`),
  ADD KEY `ix_sellers_companyLogo` (`companyLogo`),
  ADD KEY `ix_sellers_companyName` (`companyName`),
  ADD KEY `ix_sellers_region` (`region`),
  ADD KEY `ix_sellers_specialty` (`specialty`),
  ADD KEY `ix_sellers_timeStamp` (`timeStamp`);

--
-- Indexes for table `shippers`
--
ALTER TABLE `shippers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `ix_shippers_additionalInfo` (`additionalInfo`),
  ADD KEY `ix_shippers_address` (`address`),
  ADD KEY `ix_shippers_city` (`city`),
  ADD KEY `ix_shippers_companyLogo` (`companyLogo`),
  ADD KEY `ix_shippers_companyName` (`companyName`),
  ADD KEY `ix_shippers_email1` (`email1`),
  ADD KEY `ix_shippers_email2` (`email2`),
  ADD KEY `ix_shippers_phone1` (`phone1`),
  ADD KEY `ix_shippers_phone2` (`phone2`),
  ADD KEY `ix_shippers_region` (`region`),
  ADD KEY `ix_shippers_timeStamp` (`timeStamp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1036;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shippers`
--
ALTER TABLE `shippers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `shippers`
--
ALTER TABLE `shippers`
  ADD CONSTRAINT `shippers_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
