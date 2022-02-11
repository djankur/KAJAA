import 'dart:convert';
import 'package:dio/dio.dart';

class ApiService{
  
  final dio = Dio();


  Future<dynamic> postRequest(String url,Map<String,dynamic> data)async{
    var response = await dio.post(url,data: FormData.fromMap(data));
    return jsonDecode(response.data);
  }

  Future<dynamic> getRequest(String url)async{
    var response = await dio.get(url);
    return jsonDecode(response.data);
  }


}