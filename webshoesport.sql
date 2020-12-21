-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 21, 2020 at 02:04 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webshoesport`
--

-- --------------------------------------------------------

--
-- Table structure for table `binhluan`
--

DROP TABLE IF EXISTS `binhluan`;
CREATE TABLE IF NOT EXISTS `binhluan` (
  `Ma_BL` int(11) NOT NULL,
  `NoiDung` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `NgayTaoBL` date NOT NULL,
  `Email` varchar(30) COLLATE utf8_croatian_ci NOT NULL,
  PRIMARY KEY (`Ma_BL`,`Email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chitietsanpham`
--

DROP TABLE IF EXISTS `chitietsanpham`;
CREATE TABLE IF NOT EXISTS `chitietsanpham` (
  `Ma_CTSP` int(11) NOT NULL,
  `SoLuongTon` varchar(30) COLLATE utf8_croatian_ci NOT NULL,
  `Size` varchar(10) COLLATE utf8_croatian_ci NOT NULL,
  `Ma_SP` int(11) NOT NULL,
  `Ma_DH` int(11) NOT NULL,
  PRIMARY KEY (`Ma_CTSP`),
  UNIQUE KEY `Ma_SP` (`Ma_SP`),
  UNIQUE KEY `Ma_DH` (`Ma_DH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
CREATE TABLE IF NOT EXISTS `hoadon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TenNguoiNhan` varchar(255) CHARACTER SET utf8 NOT NULL,
  `phone` int(11) NOT NULL,
  `DiaChiNguoiNhan` varchar(500) CHARACTER SET utf8 NOT NULL,
  `note` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hoadon`
--

INSERT INTO `hoadon` (`id`, `TenNguoiNhan`, `phone`, `DiaChiNguoiNhan`, `note`) VALUES
(1, 'Thái Thanh', 123456789, 'quan 5', 'sfsfa'),
(2, 'Thai ne', 1549852, 'quan 4', 'afs');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `Ma_Hang` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Ten_Hang` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Ma_Hang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`Ma_Hang`, `Ten_Hang`) VALUES
('add', 'Adidas'),
('jm', 'Joma'),
('nk', 'Nike');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(225) COLLATE utf8_croatian_ci NOT NULL,
  `address` varchar(225) CHARACTER SET utf8 NOT NULL,
  `note` text COLLATE utf8_croatian_ci NOT NULL DEFAULT '',
  `total` int(11) NOT NULL,
  `created_time` int(11) DEFAULT NULL,
  `last_updated` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `name`, `phone`, `address`, `note`, `total`, `created_time`, `last_updated`) VALUES
(1, 'Thái Thanh', '0545454', 'dsa', 'dsad', 9000000, 12092020, 12092020),
(2, 'Thái Thanh', '0953534', 'khghhgj', 'dsdasda', 9000000, 12092020, 12092020),
(3, 'Thái Thanh', '0953534', 'khghhgj', 'dsdasda', 9000000, 12092020, 12092020),
(4, 'das', '133131', 'dsds', 'dsada', 9000000, 12092020, 12092020),
(5, 'as', '021542', 'ad', 'ada', 9000000, 12092020, 12092020);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE IF NOT EXISTS `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`,`product_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `image` varchar(225) CHARACTER SET utf8 NOT NULL,
  `price` float NOT NULL,
  `content` varchar(200) COLLATE utf8_croatian_ci NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `price`, `content`, `created_time`, `last_updated`) VALUES
(1, 'Giày Nike Yellow', 'images/1.png', 990000, 'giày nike màu vàng cho sân cỏ nhân tạo', 1552615987, 1552615987),
(2, 'Giày Nike Organe', 'images/2.jpg', 560000, 'giày nike cam cho sân cỏ nhân tạo', 1552615987, 1552615987),
(3, 'Giày Adidas Gray white', 'images/3.jpg', 490000, 'giày adidas trắng xám phù hợp cho sân cỏ và sân cỏ nhân tạo', 1552615987, 1552615987),
(4, 'Giày Adidas Black and white', 'images/4.jpg', 1100000, 'giày adidas đen trắng phù hợp cho sân cỏ và sân cỏ nhân tạo', 1552615987, 1552615987),
(5, 'Giày Joma White', 'images/5.jpg', 2435000, 'giày joma trắng kiểu xì teen. phù hợp cho sân cỏ nhân tạo', 1552615987, 1552615987),
(6, 'Giày Adidas Organe', 'images/6.jpg', 565000, 'giày adidas cam thế hệ mói phù hợp với sân cỏ nhân tạo', 1552615987, 1552615987),
(7, 'Giày Nike Red', 'images/7.jpg', 770000, 'giày nike đỏ. thể hiện tính sát thủ phù hợp cho sân cỏ nhân tạo và sân cỏ', 1552615987, 1552615987),
(8, 'Giày Joma Orange green', 'images/8.jpg', 520000, 'giày joma cam xanh lá. cỏ màu dưới đế rất đẹp. Phù hợp cho sân cỏ nhân tạo', 1552615987, 1552615987);

-- --------------------------------------------------------

--
-- Table structure for table `thuvien_hinhanh`
--

DROP TABLE IF EXISTS `thuvien_hinhanh`;
CREATE TABLE IF NOT EXISTS `thuvien_hinhanh` (
  `id` int(11) NOT NULL,
  `id_sanpham` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `ngay_tao` int(11) NOT NULL,
  `ngay_capnhap` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tintuc`
--

DROP TABLE IF EXISTS `tintuc`;
CREATE TABLE IF NOT EXISTS `tintuc` (
  `Ma_TT` int(11) NOT NULL,
  `Loai_TT` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `Anh_TT` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `TenNoiDung_TT` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `NoiDung_TT` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  PRIMARY KEY (`Ma_TT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `birthday` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `fullname`, `password`, `birthday`, `created_time`, `last_updated`) VALUES
(1, 'admin', 'admin', '25d55ad283aa400af464c76d713c07ad', 123, 123, 16666666);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `Email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `MatKhau_Email` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Ten_KH` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DiaChi_KH` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SDT` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Email`, `MatKhau_Email`, `Ten_KH`, `DiaChi_KH`, `SDT`) VALUES
('kaitoukid0709@gmail.com', '458c4a0d4b9306f48efb5afc0a1227c6', 'Thanh Đẹp Trai - Thái Châu Thanh', 'Quận 5', '01884475616'),
('thinhtpvl69@gmail.com', '87ef067531ad5e77c15a8709c37953ef', 'Hồ Tấn Thịnh', 'Quận Tân Bình', '0123456789');

-- --------------------------------------------------------

--
-- Table structure for table `vanchuyen`
--

DROP TABLE IF EXISTS `vanchuyen`;
CREATE TABLE IF NOT EXISTS `vanchuyen` (
  `Ma_VC` int(11) NOT NULL,
  `Loai_VC` varchar(50) CHARACTER SET utf32 COLLATE utf32_croatian_ci NOT NULL,
  `Email` varchar(30) COLLATE utf8_croatian_ci NOT NULL,
  `DiaChi_KH` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `SDT` varchar(30) COLLATE utf8_croatian_ci NOT NULL,
  `Ten_KH` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `Ma_CTDH` int(11) NOT NULL,
  PRIMARY KEY (`Ma_VC`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `Ma_CTDH` (`Ma_CTDH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
