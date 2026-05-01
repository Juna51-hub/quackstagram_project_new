CREATE DATABASE IF NOT EXISTS quackstagram;
USE quackstagram;

DROP TABLE IF EXISTS Notification;
DROP TABLE IF EXISTS Follows;
DROP TABLE IF EXISTS Likes;
DROP TABLE IF EXISTS Comments;
DROP TABLE IF EXISTS Posts;
DROP TABLE IF EXISTS Users;

-- Users
CREATE TABLE Users (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    bio TEXT
);

-- Posts
CREATE TABLE Posts (
    postID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT NOT NULL,
    imagePath VARCHAR(255),
    caption TEXT,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (userID) REFERENCES Users(userID)
);

-- Comments
CREATE TABLE Comments (
    commentID INT AUTO_INCREMENT PRIMARY KEY,
    postID INT NOT NULL,
    userID INT NOT NULL,
    content TEXT,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (postID) REFERENCES Posts(postID),
    FOREIGN KEY (userID) REFERENCES Users(userID)
);

-- Likes (Composite PK)
CREATE TABLE Likes (
    userID INT,
    postID INT,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (userID, postID),

    FOREIGN KEY (userID) REFERENCES Users(userID),
    FOREIGN KEY (postID) REFERENCES Posts(postID)
);

-- Follows (Composite PK)
CREATE TABLE Follows (
    followerID INT,
    followedID INT,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (followerID, followedID),

    FOREIGN KEY (followerID) REFERENCES Users(userID),
    FOREIGN KEY (followedID) REFERENCES Users(userID)
);

-- Notifications
CREATE TABLE Notification (
    notificationID INT AUTO_INCREMENT PRIMARY KEY,
    receiverID INT NOT NULL,
    senderID INT NOT NULL,
    type VARCHAR(50),
    postID INT,
    message TEXT,
    isRead BOOLEAN DEFAULT FALSE,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (receiverID) REFERENCES Users(userID),
    FOREIGN KEY (senderID) REFERENCES Users(userID),
    FOREIGN KEY (postID) REFERENCES Posts(postID)
);