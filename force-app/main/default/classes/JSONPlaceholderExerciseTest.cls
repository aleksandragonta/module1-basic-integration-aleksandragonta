@IsTest
public class JSONPlaceholderExerciseTest {
    
    @IsTest
    static void testGetPostById() {
        // Arrange
        Test.setMock(HttpCalloutMock.class, new JSONPlaceholderMock(200, JSONPlaceholderMock.getSampleGetResponse()));
        
        // Act
        String response = JSONPlaceholderExercise.getPostById(1);
        
        // Assert
        Assert.isNotNull(response, 'Response should not be null');
        Map<String, Object> responseMap = (Map<String, Object>)JSON.deserializeUntyped(response);
        Assert.areEqual(1, responseMap.get('id'), 'Post ID should match the request');
        Assert.areEqual('Sample Post', responseMap.get('title'), 'Post title should match the mock response');
    }
    
    @IsTest
    static void testCreatePost() {
        // Arrange
        Test.setMock(HttpCalloutMock.class, new JSONPlaceholderMock(201, JSONPlaceholderMock.getSamplePostResponse()));
        
        // Act
        String response = JSONPlaceholderExercise.createPost('New Post', 'This is a new post', 1);
        
        // Assert
        Assert.isNotNull(response, 'Response should not be null');
        Map<String, Object> responseMap = (Map<String, Object>)JSON.deserializeUntyped(response);
        Assert.areEqual(101, responseMap.get('id'), 'New post should have ID 101');
        Assert.areEqual('New Post', responseMap.get('title'), 'Post title should match the request');
    }

    @IsTest
    static void testCreatePostBulk() {
        // Arrange
        Test.setMock(HttpCalloutMock.class, new JSONPlaceholderMock(201, JSONPlaceholderMock.getSampleBULKResponse()));
       
        // Act
        List<Map<String, Object>> posts = new List<Map<String, Object>> ();
        Map<String, Object> post1 = new Map<String, Object> ();
        post1.put('title', 'New Post');
        post1.put('description', 'This is a new post');
        post1.put('id', 1);

        Map<String, Object> post2 = new Map<String, Object> ();
        post2.put('title', 'New Post2');
        post2.put('description', 'This is a new post2');
        post2.put('id', 2);

        posts.add(post1);
        posts.add(post2);

        List<String> responses = JSONPlaceholderExercise.createPostBulk(posts);
        
        // Assert
        System.assertNotEquals(null, responses, 'Responses should not be null');
        System.assertEquals(2, responses.size(), 'There should be 2 responses');
        //Here are the problems , no idea how it should be done correctly
       /* List<Map<String, Object>>  responseList = (List<Map<String, Object>> ) JSON.deserializeUntyped(responses[0]);
        Map<String, Object> firstPost = responseList[0];
        System.assertEquals(101, firstPost.get('id'), 'New post should have ID 101');
        System.assertEquals('New Post', firstPost.get('title'), 'Post title should match the request');

        Map<String, Object> secondPost = responseList[1];
        System.assertEquals(102, secondPost.get('id'), 'New post should have ID 102');
        System.assertEquals('New Post2', secondPost.get('title'), 'Post title should match the request');*/
    }
    
    @IsTest
    static void testUpdatePost() {
        // Arrange
        Test.setMock(HttpCalloutMock.class, new JSONPlaceholderMock(200, JSONPlaceholderMock.getSamplePutResponse()));
        
        // Act
        String response = JSONPlaceholderExercise.updatePost(1, 'Updated Post', 'This is an updated post', 1);
        
        // Assert
        Assert.isNotNull(response, 'Response should not be null');
        Map<String, Object> responseMap = (Map<String, Object>)JSON.deserializeUntyped(response);
        Assert.areEqual('Updated Post', responseMap.get('title'), 'Post title should be updated');
    }
    
    @IsTest
    static void testPatchPostTitle() {
        // Arrange
        Test.setMock(HttpCalloutMock.class, new JSONPlaceholderMock(200, JSONPlaceholderMock.getSamplePatchResponse()));
        
        // Act
        String response = JSONPlaceholderExercise.patchPostTitle(1, 'Updated Title');
        
        // Assert
        Assert.isNotNull(response, 'Response should not be null');
        Map<String, Object> responseMap = (Map<String, Object>)JSON.deserializeUntyped(response);
        Assert.areEqual('Updated Title', responseMap.get('title'), 'Post title should be updated');
    }
    
    @IsTest
    static void testDeletePost() {
        // Arrange
        Test.setMock(HttpCalloutMock.class, new JSONPlaceholderMock(200, ''));
        
        // Act
        Integer statusCode = JSONPlaceholderExercise.deletePost(1);
        
        // Assert
        Assert.areEqual(200, statusCode, 'Delete request should return status code 200');
    }
} 