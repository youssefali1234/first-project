import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;

  static init()
  {
  dio=Dio(
BaseOptions(
  baseUrl: 'http://abdo1572001-003-site13.atempurl.com/api/',
  receiveDataWhenStatusError: true
)
  );
  }
 static Future<Response> getdata({
  required String url,
   Map<String,dynamic>?query,
   String? token,
   String? lang='en',
})async{
    dio.options.headers={
      'lang':lang,
      'Content-Type': 'application/json',
      'Authorization':token,
    };
return await dio.get(
  url,
  queryParameters: query,
    );
 }

  static Future<Response> postdata({
    required String url,
    Map<String,dynamic>?query,
   required Map<String,dynamic>data,
    String? token,
    String lang='en'
  })async{
    dio.options.headers={
      'lang':lang,
      'Content-Type': 'application/json',
      'Authorization':token,
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
  static Future<Response> putdata({
    required String url,
    Map<String,dynamic>?query,
    required Map<String,dynamic>data,
    String? token,
    String lang='en'
  })async{
    dio.options.headers={};
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

}