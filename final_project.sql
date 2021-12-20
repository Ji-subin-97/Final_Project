CREATE TABLE `board` (
  `board_id` int NOT NULL AUTO_INCREMENT,
  `board_ctg_id` int NOT NULL,
  `board_title` varchar(255) NOT NULL,
  `board_writer` varchar(255) NOT NULL,
  `board_content` longtext NOT NULL,
  `board_regdate` date NOT NULL,
  `board_hit` int NOT NULL,
  `board_start_date` date DEFAULT NULL COMMENT 'only event',
  `board_end_date` date DEFAULT NULL COMMENT 'only event',
  PRIMARY KEY (`board_id`),
  KEY `BOARD_CTG_FK_idx` (`board_ctg_id`),
  CONSTRAINT `BOARD_CTG_FK` FOREIGN KEY (`board_ctg_id`) REFERENCES `board_category` (`board_ctg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `board_category` (
  `board_ctg_id` int NOT NULL AUTO_INCREMENT,
  `board_ctg` varchar(255) NOT NULL,
  `board_type` varchar(255) NOT NULL,
  `board_type_k` varchar(255) NOT NULL,
  PRIMARY KEY (`board_ctg_id`),
  UNIQUE KEY `board_type_UNIQUE` (`board_type`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `board_files` (
  `board_files_id` int NOT NULL AUTO_INCREMENT,
  `board_id` int NOT NULL,
  `fileName` varchar(255) NOT NULL,
  `fileOriName` varchar(255) NOT NULL,
  PRIMARY KEY (`board_files_id`),
  KEY `BOARD_FILE_FK_idx` (`board_id`),
  CONSTRAINT `BOARD_FILE_FK` FOREIGN KEY (`board_id`) REFERENCES `board` (`board_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `pdNum` int NOT NULL,
  `pdName` varchar(255) NOT NULL,
  `pdPrice` int NOT NULL,
  `pdCnt` int NOT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `coupon` (
  `couponNum` int NOT NULL AUTO_INCREMENT,
  `couponName` varchar(255) NOT NULL,
  `validity` date DEFAULT NULL,
  `couponPercent` int DEFAULT NULL,
  PRIMARY KEY (`couponNum`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `member` (
  `userName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nickName` varchar(255) NOT NULL,
  `sex` int NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `member_coupon` (
  `couponNum` int NOT NULL,
  `userName` varchar(255) NOT NULL,
  `used` int NOT NULL,
  KEY `mc_mcN_FK_idx` (`couponNum`),
  KEY `mc_mcU_FK_idx` (`userName`),
  CONSTRAINT `mc_mcN_FK` FOREIGN KEY (`couponNum`) REFERENCES `coupon` (`couponNum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mc_mcU_FK` FOREIGN KEY (`userName`) REFERENCES `member` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `member_role` (
  `userName` varchar(255) NOT NULL,
  `num` int NOT NULL,
  PRIMARY KEY (`userName`,`num`),
  KEY `role_num_FK_idx` (`num`),
  CONSTRAINT `member_un_FK` FOREIGN KEY (`userName`) REFERENCES `member` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_num_FK` FOREIGN KEY (`num`) REFERENCES `role` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `productbread` (
  `pdNum` int NOT NULL,
  `rule` int DEFAULT NULL,
  `pdNameK` varchar(255) DEFAULT NULL,
  `pdNameE` varchar(255) DEFAULT NULL,
  `pdInfo` varchar(255) DEFAULT NULL,
  `pdC` int DEFAULT NULL,
  `pdS` int DEFAULT NULL,
  `pdP` int DEFAULT NULL,
  `pdF` int DEFAULT NULL,
  `pdN` int DEFAULT NULL,
  `pdImg` varchar(255) DEFAULT NULL,
  `pdPrice` int DEFAULT NULL,
  PRIMARY KEY (`pdNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `role` (
  `num` int NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `stamp` (
  `userName` varchar(255) NOT NULL,
  `stampDate` date NOT NULL,
  `validity` date NOT NULL,
  KEY `stamp_userName_FK_idx` (`userName`),
  CONSTRAINT `stamp_userName_FK` FOREIGN KEY (`userName`) REFERENCES `member` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `starbread` (
  `pdNum` int NOT NULL,
  `pdNameK` varchar(255) DEFAULT NULL,
  `pdNameE` varchar(255) DEFAULT NULL,
  `pdInfo` varchar(255) DEFAULT NULL,
  `pdC` int DEFAULT NULL,
  `pdS` int DEFAULT NULL,
  `pdP` int DEFAULT NULL,
  `pdF` int DEFAULT NULL,
  `pdN` int DEFAULT NULL,
  `pdImg` varchar(255) DEFAULT NULL,
  `pdAllergy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pdNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;







