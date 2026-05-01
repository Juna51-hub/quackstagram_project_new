-- NEED TO PUT SCEMA IN TABLES !!!

-- Users with more than X followers 

select FollowedID , COUNT(FollowerID) as follower_count
from Follows 
group by FollowedID
having COUNT(FollowerID) > X;

-- Total number of posts made by each user 

select u.username, count(p.postID) as total_posts
from Users u 
left join Posts p on u.userID = p.userID 
group by u.userID, u.username;

-- All comments on a particular user's post 

select c.*
from Comments c 
join Posts p on c.postID = p.postID
where p.userID = [Target_UserID];

-- Top X most liked posts 

select postID, COUNT(userID) as like_count
from Likes 
group by postID
order by like_count desc 
limit X; 

-- Number of posts each user has liked

select userID, COUNT(postID) as likes_given
from Likes
group by userID;

-- Users who haven't made a post yet 

select username 
from Users 
where userID not in (select userID from Posts);

-- Users who follow each other (Mutuals)

select f1.FollowerID ,f1.FollowedID
from Follows f1
join Follows f2 on f1.FollowerID = f2.FollowedID
				and f1.FollowedID = f2.FollowerID
where f1.FollowerID < FollowedID;

-- User with the highest number of posts 

select userID, count(postID) as post_count 
from Posts
group by userID
order by post_count desc
limit 1;

-- Top X users with the most followers 

select FollowedID , count(FollowerID) as followers 
from Follows 
group by FollowedID
order by followers desc 
limit X;

-- Posts liked by all users 

select postID
from Likes 
group by postID
having count(userID) = (select count(*) from Users);

-- Most active user (Posts + Comments + Likes)

select userID, SUM(activity_count) as total_activity
from(
	select userID, count(*) as activity_count from Posts group by userID
	union all 
	select userID, count(*) from Comments group by userID
	union all 
	select userID, count(*) from Likes group by userID
) activity
group by userID
order by total_activity desc 
limit 1;

-- Average number of likes per post for each user
select p.userID, cast(count(l.postID) as float) / count(distinct p.postID) as avg_likes
from Posts p 
left join Likes l on p.postID = l.postID
group by p.userID;

-- Posts with more comments than likes 

select p.postID
from Posts p 
left join(select postID, count(*) as c_count from Comments group by postID) c on p.postID = c.postID
left join (select postID, count(*) as l_count from Likes group by postID) l on p.postID = l.postID 
where coalesce(c.c_count, 0) > coalesce(l.l_count , 0);

-- Users who liked every post of a specific user 

select l.userID
from Likes l 
join Posts p on l.postID = p.postID
where p.userID = [Targer_UserID]
group by l.userID
having count(distinct l.postID) = (select count (*) from Posts where userID = [Target_UserID]);

-- Most popular post of each user(based on likes )

select userID, postID, like_count
from (
	select p.userID, p.postID, count(l.userID) as like_count,
			rank() over()partition by p.userID order by count(l.userID) desc) as rnk
	from Posts p 
	left join Likes l on p.postID = l.postID
	group by p.userID, p.postID
)ranked
where rnk = 1;

-- User(s) with the highest ratio of followers to following 

select u.userID,
	cast((select count(*) from Follows where FollowedID = u.userID) as float) / 
	nullif((select count(*) from Follows where FollowerID = u.userID), 0) as ratio
from Users u
order by ratio desc
limit 1;

-- Month with the highest number of posts made

select extract(month from timeStamp) as post_month, count(*) as post_count
from Posts
group by post_month 
order by post_count desc 
limit 1;

-- Users who have not interacted with a specific user's posts 
-- interaction = like or comment 

select userID from Users 
where userID != [Target_UserID]
	and userID not in (
	select userID from Likes where postID in (select postID from Posts where userID = [Target_UserID])
	union 
	select userID from Comments where postID in (select postID from Posts where userID = [Target_UserID])
);
-- Greatest increase in followers in the last X days 

select FollowedID, count(*) as new_followers
from Follows
where timeStamp >= current_date - interval 'X days'
group by FollowedID
order by new_followers desc 
limit 1;

-- Users followed by more than X 
select FollowedID
from Follows
group by FollowedID
having count(FollowerID) > X;