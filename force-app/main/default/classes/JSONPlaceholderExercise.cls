public class JSONPlaceholderExercise {
    private static final String BASE_URL = 'https://jsonplaceholder.typicode.com';
    
    /**
     * Exercise 1: Implement a GET request to fetch a post by ID
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to fetch
     * @return String - The JSON response from the API
     */
    public static String getPostById(Integer postId) {
        final String endpoint = BASE_URL +'/posts/' + postId;
        String responseBody = '';
        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        request.setTimeout(120000);

        try {
            HttpResponse response = http.send(request);

            if (response.getStatusCode() >= 200 && response.getStatusCode() < 300) {
                responseBody = response.getBody();
            } else {
                throw new JSONPlaceholderException(
                    'Error: Received status code: ' + response.getStatusCode() + ' - ' + response.getBody()
                );
            }
        } catch (Exception e) {
            throw new JSONPlaceholderException(
                'Error: ' + e.getMessage()
            );
        }

        return responseBody;
    }
       
    
    /**
     * Exercise 2: Implement a POST request to create a new post
     * Endpoint: /posts
     * @param title - The title of the post
     * @param body - The body content of the post
     * @param userId - The user ID creating the post
     * @return String - The JSON response from the API
     */
    public static String createPost(String title, String body, Integer userId) {
        final String endpoint = BASE_URL +'/posts/';
        String responseBody = '';
        String jsonBody = JSON.serialize(new Map<String, Object>{
            'title' => title,
            'body' => body,
            'userId' => userId
        });
        
        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(jsonBody);

        try {
            HttpResponse response = http.send(request);

            if (response.getStatusCode() >= 200 && response.getStatusCode() < 300) {
                responseBody = response.getBody();
            } else {
                throw new JSONPlaceholderException(
                    'Error: Received status code: ' + response.getStatusCode() + ' - ' + response.getBody()
                );
            }
        } catch (Exception e) {
            throw new JSONPlaceholderException(
                'Error: ' + e.getMessage()
            );
        }

        return responseBody;
    }
       
    
    /**
     * Exercise 3: Implement a PUT request to update a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to update
     * @param title - The new title
     * @param body - The new body content
     * @param userId - The user ID
     * @return String - The JSON response from the API
     */
    public static String updatePost(Integer postId, String title, String body, Integer userId) {
        final String endpoint = BASE_URL +'/posts/'+ postId;
        String responseBody = '';
        String jsonBody = JSON.serialize(new Map<String, Object>{
            'title' => title,
            'body' => body,
            'userId' => userId
        });
        
        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('PUT');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(jsonBody);
        request.setTimeout(120000);

        try {
            HttpResponse response = http.send(request);

            if (response.getStatusCode() >= 200 && response.getStatusCode() < 300) {
                responseBody = response.getBody();
            } else {
                throw new JSONPlaceholderException(
                    'Error: Received status code: ' + response.getStatusCode() + ' - ' + response.getBody()
                );
            }
        } catch (Exception e) {
            throw new JSONPlaceholderException(
                'Error: ' + e.getMessage()
            );
        }

        return responseBody;
    }
    
    /**
     * Exercise 4: Implement a PATCH request to partially update a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to patch
     * @param title - The new title (can be null)
     * @return String - The JSON response from the API
     */
    public static String patchPostTitle(Integer postId, String title) {
        final String endpoint = BASE_URL +'/posts/'+ postId;
        String responseBody = '';
        String jsonBody = JSON.serialize(new Map<String, Object>{
            'title' => title
        });
        
        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('PATCH');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(jsonBody);
        request.setTimeout(120000);

        try {
            HttpResponse response = http.send(request);

            if (response.getStatusCode() >= 200 && response.getStatusCode() < 300) {
                responseBody = response.getBody();
            } else {
                throw new JSONPlaceholderException(
                    'Error: Received status code: ' + response.getStatusCode() + ' - ' + response.getBody()
                );
            }
        } catch (Exception e) {
            throw new JSONPlaceholderException(
                'Error: ' + e.getMessage()
            );
        }
        
        return responseBody;
    }
    
    /**
     * Exercise 5: Implement a DELETE request to remove a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to delete
     * @return Integer - The HTTP status code from the response
     */
    public static Integer deletePost(Integer postId) {
        final String endpoint = BASE_URL +'/posts/'+ postId;
        Integer responseCode = 0;

        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('DELETE');
        request.setTimeout(120000);

        try {
            HttpResponse response = http.send(request);

            if (response.getStatusCode() >= 200 && response.getStatusCode() < 300) {
                responseCode = response.getStatusCode();
            } else {
                throw new JSONPlaceholderException(
                    'Error: Received status code: ' + response.getStatusCode() + ' - ' + response.getBody()
                );
            }
        } catch (Exception e) {
            throw new JSONPlaceholderException(
                'Error: ' + e.getMessage()
            );
        }

        return responseCode;
    }
} 