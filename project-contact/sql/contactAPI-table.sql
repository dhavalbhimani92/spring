CREATE TABLE `contactapi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(250) NOT NULL,
  `lastName` varchar(250) DEFAULT NULL,
  `middleName` varchar(250) DEFAULT NULL,
  `gender` varchar(20) NOT NULL,
  `mobileNumber` bigint(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `pinCode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;