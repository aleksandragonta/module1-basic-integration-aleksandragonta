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