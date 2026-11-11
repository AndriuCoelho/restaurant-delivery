import 'package:dio/dio.dart';

class Requester {

  // criação da variável que vai nos dar acesso ao Dio (para configurar a requisição)
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api-restaurantes-8qhh.onrender.com/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'}
    )
  );

  Future<dynamic> get(String path) async {
    try {
      final response = await _dio.get(path);
      return response.data;
    } on DioException catch (e) {
      throw RequestException(_messageFor(e));
    }
  }

  Future<dynamic> post(String path, Map<String, dynamic> body) async {
    try {
      final response = await _dio.post(path, data: body);
      return response.data;
    } on DioException catch (e) {
      // tratar o erro, caso existe
      throw RequestException(_messageFor(e));
    }
  }

  String _messageFor(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'O servidor demorou para responder.';

      case DioExceptionType.connectionError:
        return 'Não foi possível conectar ao servidor.';

      case DioExceptionType.badResponse:
        return _messageFromBody(e.response) ??
            'O servidor recusou o pedido '
                '(código ${e.response?.statusCode}).';

      default:
        return 'Erro inesperado na requisição.';
    }
  }

  String? _messageFromBody(Response? response) {
    final data = response?.data;

    if (data is Map && data['message'] is String) {
      return data['message'] as String;
    }

    return null;
  }
}

class RequestException implements Exception {
  final String message;

  RequestException(this.message);

  @override
  String toString() => message;
}