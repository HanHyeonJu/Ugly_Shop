CREATE DATABASE IF NOT EXISTS shop
DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

use shop;

DROP TABLE IF EXISTS user;
CREATE TABLE user( 
    userID  VARCHAR(20) default '' NOT NULL, 
    userPassword VARCHAR(20) default '' NOT NULL,
    userName VARCHAR(20)default '' NOT NULL,
    userAdd VARCHAR(50),
    userTel VARCHAR(20) DEFAULT '' NOT NULL,
    primary key(userID)
);

DROP TABLE IF EXISTS farmer;
CREATE TABLE farmer( 
    farmID  VARCHAR(20) DEFAULT '' NOT NULL, 
    farmPassword VARCHAR(20) default '' NOT NULL,
    farmName VARCHAR(20) default '' NOT NULL,
    farmAdd VARCHAR(50),
    farmTel VARCHAR(20) default '' NOT NULL,
    primary key(farmID)
);

DROP TABLE IF EXISTS manager;
CREATE TABLE manager(
    manID  VARCHAR(20) default '' NOT NULL, 
    manPassword VARCHAR(20) default '' NOT NULL,
    primary key(manID)
);

DROP TABLE IF EXISTS product;
CREATE TABLE product(
    prodID INT NOT NULL auto_increment, 
    farmID VARCHAR(20) default '' NOT NULL,
    farmTel VARCHAR(20) default '' NOT NULL,
    prodName VARCHAR(20) default '' NOT NULL,
    prodPrice int,
    prodImg varchar(2048),
    prodInfo varchar(1028),
    primary key(prodID),
    foreign key(farmID) references farmer(farmID) on update cascade on delete cascade
);

DROP TABLE IF EXISTS review;
CREATE TABLE review(
    reviewID INT NOT NULL auto_increment, 
    userID VARCHAR(20) default '' NOT NULL,
    reviewDate datetime,
    reviewTitle varchar(50),
    reviewContent varchar(2048),
    prodID INT,
    farmID VARCHAR(20),
    orderID int,
    primary key(reviewID),
    foreign key(prodID) references product(prodID)  on update cascade on delete cascade,
    foreign key(farmID) references farmer(farmID)  on update cascade on delete cascade
);

DROP TABLE IF EXISTS reply;
CREATE TABLE reply(
    replyID INT NOT NULL auto_increment, 
    farmID VARCHAR(20) default '' NOT NULL,
    replyContent varchar(2048),
    reviewID INT,
    prodID INT,
    primary key(replyID),
   foreign key(reviewID) references review(reviewID)  on update cascade on delete cascade
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
    orderID INT NOT NULL auto_increment, 
    orderNum INT,
    userID VARCHAR(20),
    userName VARCHAR(20) default '' NOT NULL,
    userAdd VARCHAR(50),
    userTel VARCHAR(20) default '' NOT NULL,
    prodID INT,
    prodPrice INT,
    prodName VARCHAR(20) default '' NOT NULL,
    orderQuantity INT,
    farmID  VARCHAR(20) default '' NOT NULL, 
    farmTel VARCHAR(20) default '' NOT NULL,
    farmCheck VARCHAR(20) default '' NOT NULL,
    trackNum VARCHAR(20),
    is_status VARCHAR(20),
    primary key(orderID)
);
