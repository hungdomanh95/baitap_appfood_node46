-- -------------------------------------------------------------
-- TablePlus 6.2.0(576)
--
-- https://tableplus.com/
--
-- Database: db_app_food
-- Generation Time: 2024-12-09 23:33:48.9060
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `foods` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` date DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `codes` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `foods` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` date DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurants` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `foods` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pass_word` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Bình Định'),
(2, 'Quảng Ngãi'),
(3, 'Bình Thuận'),
(4, 'Huế');

INSERT INTO `foods` (`food_id`, `food_name`, `image`, `price`, `des`, `type_id`) VALUES
(1, 'Bánh cuốn', '123', 20000, 'Đặc sản bình định', 1),
(2, 'Bánh mì nướng lu', '123', 30000, 'Đặc sản bình định', 1),
(3, 'Bánh đập', '123', 10000, 'Đặc sản Quảng Ngãi', 2),
(4, 'Bánh canh chả cá', '123', 45000, 'Đặc sản bình thuận', 3),
(5, 'Bún bò Huế', '123', 55000, 'Đặc sản Huế', 4);

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 1, '2024-11-09'),
(2, 1, '2024-11-09'),
(3, 1, '2024-11-09'),
(4, 1, '2024-11-09'),
(1, 2, '2024-11-09'),
(2, 2, '2024-11-09'),
(3, 4, '2024-11-09'),
(5, 3, '2024-11-09'),
(1, 3, '2024-11-09');

INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `codes`, `arr_sub_id`) VALUES
(1, 2, 30000, 'ABC1', 'ABC1234'),
(3, 1, 40000, 'ABC2', 'ABC1235'),
(2, 5, 50000, 'ABC3', 'ABC1236'),
(1, 3, 60000, 'ABC4', 'ABC1237'),
(3, 2, 70000, 'ABC5', 'ABC1238'),
(1, 2, 30000, 'ABC1', 'ABC1234');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 10000, '2024-11-09'),
(2, 1, 10000, '2024-11-09'),
(3, 1, 10000, '2024-11-09'),
(4, 1, 10000, '2024-11-09'),
(1, 2, 10000, '2024-11-09'),
(2, 2, 10000, '2024-11-09'),
(3, 4, 10000, '2024-11-09'),
(5, 3, 10000, '2024-11-09'),
(1, 3, 10000, '2024-11-09');

INSERT INTO `restaurants` (`res_id`, `res_name`, `image`, `des`) VALUES
(1, 'A MÀ', 'image1', 'Nhà Hàng món Trung'),
(2, 'GoGi', 'image2', 'Nhà Hàng thịt nướng Hàn Quốc'),
(3, 'SaSin', 'image3', 'Nhà Hàng mì cay Hàn Quốc'),
(4, 'Chang', 'image4', 'Nhà Hàng Thái Lan');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Bánh cuốn 1', 20000, 1),
(2, 'Bánh cuốn 2', 20000, 1),
(3, 'Bánh cuốn 3', 20000, 1),
(4, 'Bánh đập 1', 10000, 3),
(5, 'Bánh đập 2', 10000, 3);

INSERT INTO `users` (`user_id`, `full_name`, `email`, `pass_word`) VALUES
(1, 'Hung 1', 'hung1@gmail.com', '1234'),
(2, 'Hung 1', 'hung2@gmail.com', '1234'),
(3, 'Hung 3', 'hung3@gmail.com', '1234'),
(4, 'Hung 4', 'hung4@gmail.com', '1234'),
(5, 'Hung 5', 'hung5@gmail.com', '1234'),
(6, 'Hung 6', 'hung6@gmail.com', '1234');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;