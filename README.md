# Cloud Code Academy - Integration Developer Program
## Lesson 1: HTTP Integration Basics with JSONPlaceholder

Welcome to the first lesson of the Integration Developer program! In this lesson, you'll learn the fundamentals of making HTTP callouts in Salesforce using a free, public API called JSONPlaceholder.

## 🎯 Learning Objectives

By the end of this lesson, you will be able to:
- Understand and implement all major HTTP methods (GET, POST, PUT, PATCH, DELETE)
- Make HTTP callouts from Salesforce Apex
- Work with JSON request and response bodies
- Write proper test classes for HTTP callouts
- Use mock responses in your tests

## 📋 Exercise Overview

This exercise contains three main components:

1. **JSONPlaceholderExercise.cls**
   - Contains skeleton methods for each HTTP operation
   - Includes detailed TODO comments to guide your implementation
   - Located in `force-app/main/default/classes/`

2. **JSONPlaceholderMock.cls**
   - Provides mock responses for testing
   - Demonstrates proper test data structure
   - Located in `force-app/main/default/classes/`

3. **JSONPlaceholderExerciseTest.cls**
   - Contains test methods to validate your implementation
   - Shows proper test method structure
   - Located in `force-app/main/default/classes/`

## 🔨 Installation

1. Clone this repository to your local machine
2. Deploy the code to your Salesforce org using:
   ```bash
   sfdx force:source:deploy -p force-app/main/default
   ```

## ✍️ Exercise Instructions

1. Open `JSONPlaceholderExercise.cls`
2. Implement each method following the TODO comments
3. Use the JSONPlaceholder API (https://jsonplaceholder.typicode.com/)
4. Run the test class to verify your implementation

## 🎯 Success Criteria

Your implementation should:
- Pass all test methods in `JSONPlaceholderExerciseTest`
- Handle JSON properly
- Include proper error handling
- Follow Salesforce best practices

## 💡 Tips

- Test your implementation against the actual JSONPlaceholder API first
- Use the Developer Console debug logs to troubleshoot
- Reference the solution in `solutions/classes/` if you get stuck
- Pay attention to the HTTP response status codes

## 📚 Resources

- [JSONPlaceholder Guide](https://jsonplaceholder.typicode.com/guide/)
- [Apex HTTP Methods](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_restful_http.htm)
- [Apex Testing Best Practices](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_testing_best_practices.htm)

## 🏆 Challenge

Once you've completed the basic implementation, try these challenges:
1. Add error handling for non-200 status codes
2. Implement request timeouts
3. Add bulk operations for multiple posts
4. Create custom exception classes

## ❓ Support

If you need help:
- Review the solution code in the `solutions` directory
- Check the test class for expected behavior
- Reach out to your instructor

---
Happy coding! 🚀

*This is part of the Cloud Code Academy Integration Developer certification program.*
