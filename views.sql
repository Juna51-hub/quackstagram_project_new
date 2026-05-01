USE quackstagram;

-- Post like statistics
CREATE VIEW post_like_stats AS
SELECT 
    p.postID,
    p.caption,
    COUNT(l.userID) AS like_count
FROM Posts p
LEFT JOIN Likes l ON p.postID = l.postID
GROUP BY p.postID;


-- User post count
CREATE VIEW user_post_count AS
SELECT 
    u.userID,
    u.username,
    COUNT(p.postID) AS post_count
FROM Users u
LEFT JOIN Posts p ON u.userID = p.userID
GROUP BY u.userID;


-- User follower count
CREATE VIEW user_follower_count AS
SELECT 
    u.userID,
    u.username,
    COUNT(f.followerID) AS follower_count
FROM Users u
LEFT JOIN Follows f ON u.userID = f.followedID
GROUP BY u.userID;