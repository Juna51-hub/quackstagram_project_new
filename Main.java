public class Main {

    public static void main(String[] args) {

        // register user
        UserService.registerUser("newuser", "123", "hello world");

        // create post
        PostService.createPost(1, "Hello Quackstagram!");

        // follow user
        FollowService.followUser(1, 2);

        // query posts
        CheckPost.getPostsByUser(1);

    }
}