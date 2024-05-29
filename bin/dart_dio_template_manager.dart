import 'package:dart_dio_template_manager/dart_dio_template_manager.dart';

// Initialize the NetworkService with the base URL of your API.

final networkService = NetworkService(baseUrl: 'https://["your-backend-url"]');
void main() async {
  getUserProfile();
}

//////////////////////////////////////////////////////////////////////////////////////////////
//                        test the NetworkService class
///
getUserProfile() async {
  try {
    // login firt to get user token
    final loginResp = await login();
    networkService.setAuthorizationHeader(loginResp.toString());
    // Making a GET request to the '/users' endpoint.
    final response = await networkService.get('/user');
    print(
        'Status Code: ${response.statusCode}\nStatus Message: ${response.statusMessage}\nData: ${response.data}');

    // Making a POST request to the '/post' endpoint.
    final responseii = await networkService
        .put('/post/65af894c54899c9b425ea9c3/like', data: {});
    print(
        'Status Code: ${responseii.statusCode}\nStatus Message: ${responseii.statusMessage}\nData: ${responseii.data}');
  } catch (e) {
    print('Error: $e');
  }
}

///
Future<String> login() async {
  try {
    // Making a POST request to the '/login' endpoint with data.
    final response = await networkService.post(
      '/auth/login',
      data: {"email": "ope@gmail.com", "password": "ope@gmail.com"},
    );
    print(
        'Status Code: ${response.statusCode}\nStatus Message: ${response.statusMessage}\nData: ${response.data}');
    // depending on how the response structure is
    return response.data["token"];
    // return response.data;
  } catch (e) {
    print('Error: $e');
    return "failed";
  }
}
