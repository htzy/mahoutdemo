DROP TABLE IF EXISTS `t_movie`;
CREATE TABLE `t_movie` (
  `id` int(4) PRIMARY KEY AUTO_INCREMENT,
  `title` text,
  `genres` varchar(64) default NULL,
  `url` VARCHAR(64) DEFAULT NULL,
  `year` INT(5) default 1990
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(4) PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(32) not NULL,
  `password` varchar(32) not NULL,
  `gender` varchar(4) default NULL,
  `age` int(4) default NULL,
  `occupation` int(4) default NULL,
  `zip_code` varchar(16) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index idx_t_user_username on t_user(username);