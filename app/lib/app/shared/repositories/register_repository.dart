import 'package:app/app/shared/core/app_core.dart';
import 'package:app/app/shared/interfaces/register_interface.dart';
import 'package:dio/dio.dart';

class RegisterRepository implements IRegister {
  final Dio _client;

  RegisterRepository(this._client) {
    _init();
  }

  _init() {
    _client.options = BaseOptions(
      baseUrl: AppCore.apiUrl,
      receiveTimeout: 60000,
      connectTimeout: 60000,
    );
  }

  @override
  Future<String> sendRegisterData({Map<String, dynamic>? registerData}) async {
    try {
      await _client.post(
        '/products',
        data: registerData,
      );

      return ("Sucesso");
    } on DioError {
      return ('Register Failed');
    }
  }
}
