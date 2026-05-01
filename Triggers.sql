USE quackstagram;

DELIMITER $$

-- Trigger 1: like notification
CREATE TRIGGER like_notification
AFTER INSERT ON Likes
FOR EACH ROW
BEGIN

INSERT INTO Notification (
    receiverID,
    senderID,
    type,
    postID,
    message
)
SELECT 
    p.userID,
    NEW.userID,
    'like',
    NEW.postID,
    'Someone liked your post'
FROM Posts p
WHERE p.postID = NEW.postID;

END$$


-- Trigger 2: comment notification
CREATE TRIGGER comment_notification
AFTER INSERT ON Comments
FOR EACH ROW
BEGIN

INSERT INTO Notification (
    receiverID,
    senderID,
    type,
    postID,
    message
)
SELECT 
    p.userID,
    NEW.userID,
    'comment',
    NEW.postID,
    'Someone commented on your post'
FROM Posts p
WHERE p.postID = NEW.postID;

END$$

DELIMITER ;