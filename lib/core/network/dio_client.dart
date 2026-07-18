import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_forecast/core/constants/app_endpoint.dart';

class DioClient {
  static Dio getInstance() {
    return Dio(
        BaseOptions(
          baseUrl: AppEndpoint.endpoint,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      )
      ..interceptors.addAll([
        _apiKeyInterceptor(),
        LogInterceptor(requestBody: true, responseBody: true),
        _erroInterceptor(),
      ]);
  }

  static Interceptor _apiKeyInterceptor() {
    String apiKey = dotenv.get('WEATHER_API_KEY');

    return InterceptorsWrapper(
      onRequest: (options, handler) {
        if (apiKey.isEmpty) {
          throw Exception('API Key não encontrada no arquivo .env');
        }
        options.queryParameters['key'] = apiKey;
        return handler.next(options);
      },
    );
  }

  static DioException _dioException(DioException exception) {
    String errorMessage = 'Error desconhecido';
    switch (exception.error) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        errorMessage =
            'Tempo limite de conexão excedido. Verifique sua internet.';
        break;
      case DioExceptionType.badResponse:
        if (exception.response != null) {
          final statusCode = exception.response?.statusCode;
          final data = exception.response?.data;
          switch (statusCode) {
            case 400:
              errorMessage = _getMessageError(data, 'Requisição inválida');
              break;
            case 401:
              errorMessage = _getMessageError(
                data,
                'Chave de API inválida ou não fornecida',
              );
              break;
            case 403:
              errorMessage = _getMessageError(
                data,
                'Acesso negado. Verifique sua chave de API.',
              );
              break;
            case 404:
              errorMessage = _getMessageError(data, 'Recurso não encontrado.');
              break;
            case 429:
              errorMessage =
                  'Limite de requisições excedido. Aguarde um momento.';
              break;
            case 500:
              errorMessage = _getMessageError(
                data,
                'Erro interno do servidor.',
              );
              break;
            default:
              errorMessage = _getMessageError(
                data,
                'Erro ao processar requisição',
              );
          }
        }
        break;
      case DioExceptionType.cancel:
        errorMessage = 'Requisição cancelada';
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'Sem conexão com a internet. Verifique sua rede.';
        break;
      default:
        errorMessage = 'Ocorreu um erro inesperado. Tente novamente.';
    }
    return DioException(
      requestOptions: exception.requestOptions,
      response: exception.response,
      type: exception.type,
      error: exception.error,
      message: errorMessage,
    );
  }

  static Interceptor _erroInterceptor() {
    return InterceptorsWrapper(
      onError: (error, handler) async {
        if (error.response?.statusCode == 400 ||
            error.response?.statusCode == 401 ||
            error.response?.statusCode == 403) {
          final messageError = _getMessageError(
            error.response?.data,
            'Chave de API inválida ou expirada. Verifique sua chave no arquivo .env',
          );
          return handler.next(
            DioException(
              requestOptions: error.requestOptions,
              response: error.response,
              type: error.type,
              error: messageError,
            ),
          );
        }
        return handler.next(_dioException(error));
      },
    );
  }

  static String _getMessageError(dynamic data, String defaultMessage) {
    try {
      if (data is Map<String, dynamic>) {
        return data['message'] ?? data['code']?.toString() ?? defaultMessage;
      }
      return defaultMessage;
    } catch (e) {
      return defaultMessage;
    }
  }
}
