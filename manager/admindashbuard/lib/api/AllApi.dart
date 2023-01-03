import 'package:dio/dio.dart';

class AllApi {
  static String url = 'https://des-cali.com/pido';
  //static String url = 'https://des-cali.com/franciaweb';
  //https://coredfran.edu.co/franciaweb
  static Dio _dio = new Dio();

  static void configuteDio() {
    // base del url

    _dio.options.baseUrl = url;

    // configurar headers
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      //print(path + '    ' + 'object' + resp.data);
      return resp.data;
    } catch (e) {
      print(e);
      throw ('Error en el get');
    }
  }

  static Future httpPost(String path, Map<String, dynamic> data) async {
    final fromData = FormData.fromMap(data);
    try {
      final resp = await _dio.post(path, data: fromData);
      //print('object --- > ' + resp.data);
      return resp.data;
    } catch (e) {
      //print(e.toString());
      throw ('Error en el POST');
    }
  }
}
