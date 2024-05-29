
# dart-dio-http-request-template

# Dio template for get, post, put and delete request 

## a http request plus response in just 3 lines of code:
// Initialize the NetworkService with the base URL of your API.
// Making a POST request to the '/login' endpoint with data.
// log request response

```
final networkService = NetworkService(baseUrl: 'https://["your-backend-url"]');
final response = await networkService.post('/auth/login',data: {"email": "mail@gmail.com", "password": "mail@gmail.com"});
print('Status Code: ${response.statusCode}\nStatus Message: ${response.statusMessage}\nData: ${response.data}');
```

## we are open for colaboration and new features