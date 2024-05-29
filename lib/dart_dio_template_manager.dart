import 'dart:developer';

import 'package:dio/dio.dart';

/// This class provides a well-structured interface for making network requests using the Dio library in Dart.
/// It supports various types of requests such as GET, POST, PUT, DELETE, and others.
/// The response includes status code, status message, data, and error message (if any).
/// The base URL is provided during initialization, and specific endpoints are passed as parameters for each request.
/// Named parameters are used for methods that require parameters.
/// Professional and elegant naming conventions are followed throughout the code.

class NetworkService {
  // The Dio instance used for making network requests.
  final Dio _dio;

  /// Initializes the NetworkService with the base URL.
  /// [baseUrl] is the base URL for the API endpoints.
  NetworkService({required String baseUrl})
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl, // Set the base URL for the Dio instance.
            connectTimeout: const Duration(
                seconds: 30), // Connection timeout duration in seconds.
            receiveTimeout: const Duration(
                seconds: 30), // Receive timeout duration in seconds.
          ),
        );

  /// Sets the authorization header for all requests.
  /// Before any request is made, call this method and pass in the token, for authorization.
  void setAuthorizationHeader(String token) {
    _dio.options.headers.addAll({
      "content-type": "application/json",
      "Authorization": token // Correct format for Bearer token
    }); // Use 'Bearer' scheme
    log("userToken: ${token.toString()}");
  }

  /// Sends a GET request to the specified [endpoint] with optional [queryParameters].
  /// Returns a [Response] object containing the status code, status message, data, and error message (if any).
  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>?
        queryParameters, // Optional query parameters for the GET request.
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw DioException(
          e); // Throws a custom exception in case of DioException.
    }
  }

  /// Sends a POST request to the specified [endpoint] with optional [data] and [queryParameters].
  /// Returns a [Response] object containing the status code, status message, data, and error message (if any).
  Future<Response> post(
    String endpoint, {
    dynamic data, // Optional data for the POST request.
    Map<String, dynamic>?
        queryParameters, // Optional query parameters for the POST request.
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw DioException(
          e); // Throws a custom exception in case of DioException.
    }
  }

  /// Sends a PUT request to the specified [endpoint] with optional [data] and [queryParameters].
  /// Returns a [Response] object containing the status code, status message, data, and error message (if any).
  Future<Response> put(
    String endpoint, {
    dynamic data, // Optional data for the PUT request.
    Map<String, dynamic>?
        queryParameters, // Optional query parameters for the PUT request.
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw DioException(
          e); // Throws a custom exception in case of DioException.
    }
  }

  /// Sends a DELETE request to the specified [endpoint] with optional [queryParameters].
  /// Returns a [Response] object containing the status code, status message, data, and error message (if any).
  Future<Response> delete(
    String endpoint, {
    Map<String, dynamic>?
        queryParameters, // Optional query parameters for the DELETE request.
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw DioException(
          e); // Throws a custom exception in case of DioException.
    }
  }

  /// Sends a request with the specified [method] to the specified [endpoint] with optional [data] and [queryParameters].
  /// Returns a [Response] object containing the status code, status message, data, and error message (if any).
  Future<Response> request(
    String method,
    String endpoint, {
    dynamic data, // Optional data for the request.
    Map<String, dynamic>?
        queryParameters, // Optional query parameters for the request.
  }) async {
    try {
      final response = await _dio.request(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
            method: method), // Specifies the HTTP method for the request.
      );
      return response;
    } on DioException catch (e) {
      throw DioException(
          e); // Throws a custom exception in case of DioException.
    }
  }
}

/// Custom exception class for handling Dio errors.
class DioException implements Exception {
  final DioException error;

  DioException(this.error);

  @override
  String toString() {
    return 'DioException: $error'; // Returns the error message as a string.
  }
}
