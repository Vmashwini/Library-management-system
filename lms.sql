-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 21, 2019 at 08:53 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `bookBorrowedByUser` (IN `user` VARCHAR(100))  BEGIN
SELECT first_name, last_name, title
FROM user
INNER JOIN reservation
ON user.user_id = reservation.user_id
INNER JOIN book
ON reservation.book_id=book.book_id
WHERE first_name = user;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `bookByAuthor` (IN `firstName` VARCHAR(100), `lastName` VARCHAR(100))  BEGIN
SELECT first_name, last_name, title 
from book 
INNER JOIN book_author 
ON book.book_id= book_author.book_id 
INNER JOIN author 
ON book_author.author_id = author.author_id
WHERE first_name= firstName AND last_name = lastName;
End$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `book_abc` ()  BEGIN
SELECT * FROM book
ORDER BY title;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `specGenre` (IN `spec_genre` VARCHAR(100))  BEGIN
SELECT *
FROM genre
INNER JOIN book_genre
ON genre.genre_id = book_genre.genre_id
INNER JOIN book 
ON book_genre.book_id = book.book_id
WHERE genre_type = spec_genre ;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `first_name`, `last_name`) VALUES
(1, 'Jaideva', 'Goswami'),
(2, 'John', 'Foreman'),
(3, 'Stephen', 'Hawking'),
(4, 'Stephen', 'Dubner'),
(5, 'Edward', 'Said'),
(6, 'Vladimir', 'Vapnik');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `availability` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `title`, `availability`) VALUES
(1, 'Fundamentals of Wavelets', 0),
(2, 'Data Smart', 1),
(3, 'God Created the Integers', 0),
(4, 'Superfreakonomics', 1),
(5, 'Orientalism', 0),
(6, 'Nature of Statistical Learning Theory', 0);

-- --------------------------------------------------------

--
-- Table structure for table `book_author`
--

CREATE TABLE `book_author` (
  `book_author_id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book_author`
--

INSERT INTO `book_author` (`book_author_id`, `book_id`, `author_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `book_genre`
--

CREATE TABLE `book_genre` (
  `book_genre_id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book_genre`
--

INSERT INTO `book_genre` (`book_genre_id`, `book_id`, `genre_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `first_line` varchar(100) NOT NULL,
  `second_line` varchar(100) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `email_address` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `first_line`, `second_line`, `city`, `postcode`, `email_address`, `phone_number`) VALUES
(1, '14 Taylor St', 'St. Stephens Ward', 'Kent', 'CT2 7PP', 'atomkiewicz@hotmail.com', '1835703597'),
(2, '5 Binney St', 'Abbey Ward', 'Buckinghamshire', 'HP11 2AX', 'abbey_ward@gmail.com', '1937864715'),
(3, 'John W Esq', '8 Moor Place', 'Bournemouth', 'BH6 3BE', 'france.andrade@hotmail.com', '1347368222'),
(4, 'Mcmahan Ben L', '505 Exeter Rd', 'Lincolnshire', 'DN36 5RP', 'ulysses@hotmail.com', '1912771311'),
(5, 'Champagne Room', '5396 Forth Street', 'West Midlands', 'B70 9DT', 'tyisha.veness@hotmail.com', '1547429341'),
(6, '9472 lind street', 'lower earley', 'Kent', 'DA2 7PP', 'femanda@writer.co.uk', '01687879391');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL,
  `genre_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genre_id`, `genre_type`) VALUES
(1, 'signal_processing'),
(2, 'data_science'),
(3, 'mathematics'),
(4, 'economics'),
(5, 'history');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `user_id`, `book_id`) VALUES
(1, 1, 1),
(2, 2, 5),
(4, 1, 6),
(6, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `contact_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `contact_id`) VALUES
(1, 'Aleshia', 'Tomkiewicz', 1),
(2, 'Evan', 'Zigomalas', 2),
(3, 'France', 'Andrade', 3),
(4, 'Ulysses', 'Mcwalters', 4),
(5, 'Tyisha', 'Veness', 5),
(6, 'Eric', 'Rampy', 6);

-- --------------------------------------------------------

--
-- Table structure for table `user_contact`
--

CREATE TABLE `user_contact` (
  `user_contact_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_contact`
--

INSERT INTO `user_contact` (`user_contact_id`, `user_id`, `contact_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `book_author`
--
ALTER TABLE `book_author`
  ADD PRIMARY KEY (`book_author_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `book_genre`
--
ALTER TABLE `book_genre`
  ADD PRIMARY KEY (`book_genre_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_contact`
--
ALTER TABLE `user_contact`
  ADD PRIMARY KEY (`user_contact_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `contact_id` (`contact_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `book_author`
--
ALTER TABLE `book_author`
  MODIFY `book_author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `book_genre`
--
ALTER TABLE `book_genre`
  MODIFY `book_genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_contact`
--
ALTER TABLE `user_contact`
  MODIFY `user_contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_author`
--
ALTER TABLE `book_author`
  ADD CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  ADD CONSTRAINT `book_author_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`);

--
-- Constraints for table `book_genre`
--
ALTER TABLE `book_genre`
  ADD CONSTRAINT `book_genre_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  ADD CONSTRAINT `book_genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`);

--
-- Constraints for table `user_contact`
--
ALTER TABLE `user_contact`
  ADD CONSTRAINT `user_contact_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `user_contact_ibfk_2` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`contact_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
