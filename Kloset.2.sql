-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 16, 2013 at 10:22 PM
-- Server version: 5.5.32
-- PHP Version: 5.3.10-1ubuntu3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Kloset`
--

-- --------------------------------------------------------

--
-- Table structure for table `clothes`
--

CREATE TABLE IF NOT EXISTS `clothes` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `style` varchar(255) NOT NULL,
  `id_user` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `clothes`
--

INSERT INTO `clothes` (`id`, `name`, `link`, `color`, `style`, `id_user`) VALUES
(1, 'Pull Noir', 'clothes/1.png', 'black', 'ambiance', 16),
(2, 'Chemisette blanche', 'clothes/2.png', 'white', 'disco', 16),
(3, 'Chemise Noir', 'clothes/3.png', 'black', 'classic', 15);

INSERT INTO `clothes` (`id`, `name`, `link`, `color`, `style`, `id_user`) VALUES
(4, 'Chemise Noir', 'clothes/3.png', 'black', 'classic', 16);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`) VALUES
(1, 'normandjulian@gmail.com', 'ttys0tuxs', 'Julian'),
(13, 'normandjulian@gmail.com', 'a6daf756f27396e115bb3d26fa5d1c60', 'Juju'),
(14, 'maelle@maelle.com', 'maelle', 'Maelle'),
(15, 'test@test.fr', 'e6cdc66571b14cc49c399b0a6340109a', 'test'),
(16, 'ju@ju.fr', 'e41cc2f10f2b966607df63978ea3d186', 'ju');

-- --------------------------------------------------------

--
-- Table structure for table `wearing`
--

CREATE TABLE IF NOT EXISTS `wearing` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `id_user` int(255) NOT NULL,
  `id_cloth` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `wearing`
--

INSERT INTO `wearing` (`id`, `id_user`, `id_cloth`) VALUES
(1, 16, 1),
(2, 16, 2),
(3, 15, 3);

INSERT INTO `wearing` (`id`, `id_user`, `id_cloth`) VALUES
(4, 16, 3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
