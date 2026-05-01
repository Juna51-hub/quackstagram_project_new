USE quackstagram;

-- 清空数据
DELETE FROM Notification;
DELETE FROM Likes;
DELETE FROM Comments;
DELETE FROM Follows;
DELETE FROM Posts;
DELETE FROM Users;

-- Users
INSERT INTO Users (username,password,bio) VALUES
('checkpointmember','test123','System test user'),
('user2','123','Travel lover'),
('alice','123','Love photography'),
('bob','123','Travel addict'),
('charlie','123','Food blogger'),
('david','123','Nature explorer'),
('emma','123','Coffee lover'),
('frank','123','Gym enthusiast'),
('grace','123','Book reader'),
('henry','123','Tech geek');


-- Posts
INSERT INTO Posts (userID,imagePath,caption) VALUES
(1,'img1.jpg','Beautiful sunset'),
(1,'img2.jpg','Morning coffee'),

(2,'img3.jpg','Trip to Paris'),
(2,'img4.jpg','Eiffel Tower'),

(3,'img5.jpg','Photography walk'),
(3,'img6.jpg','Golden hour'),

(4,'img7.jpg','Mountain hiking'),
(4,'img8.jpg','Lake view'),

(5,'img9.jpg','Best burger ever'),
(5,'img10.jpg','Street food night'),

(6,'img11.jpg','Forest adventure'),
(6,'img12.jpg','Nature vibes'),

(7,'img13.jpg','Morning latte'),
(7,'img14.jpg','Coffee art'),

(8,'img15.jpg','Gym workout'),
(8,'img16.jpg','Leg day'),

(9,'img17.jpg','Reading night'),
(9,'img18.jpg','Library mood'),

(10,'img19.jpg','New laptop'),
(10,'img20.jpg','Coding session');


-- Follows
INSERT INTO Follows (followerID,followedID) VALUES
(1,2),
(1,3),
(2,3),
(2,4),
(3,4),
(3,5),
(4,5),
(5,6),
(6,7),
(7,8),
(8,9),
(9,10);


-- Likes
INSERT INTO Likes (userID,postID) VALUES
(1,3),
(1,4),
(2,5),
(2,6),
(3,7),
(4,9),
(5,11),
(6,13),
(7,15),
(8,17),
(9,19);


-- Comments
INSERT INTO Comments (postID,userID,content) VALUES
(1,2,'Amazing view!'),
(3,1,'Paris is beautiful'),
(5,4,'Great photo'),
(7,3,'Looks fun'),
(9,6,'Now I am hungry'),
(11,5,'Nature is the best'),
(13,8,'Love coffee'),
(15,7,'Great workout'),
(17,10,'Nice book'),
(19,9,'Cool setup');


-- Notifications
INSERT INTO Notification (receiverID,senderID,type,postID,message) VALUES
(1,2,'like',1,'user2 liked your post'),
(3,1,'comment',3,'checkpointmember commented on your post'),
(5,4,'follow',NULL,'bob started following you'),
(7,6,'like',13,'david liked your post'),
(9,8,'comment',17,'frank commented on your post');


-- 查看数据
SELECT * FROM Users;
SELECT * FROM Posts;
SELECT * FROM Comments;
SELECT * FROM Likes;
SELECT * FROM Follows;
SELECT * FROM Notification;