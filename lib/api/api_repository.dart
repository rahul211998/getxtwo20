import 'package:dio/dio.dart';

class ApiRepository {
  late Dio dio;


  ApiRepository(){
    dio = Dio(BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com'
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if(options.extra["skipAuth"] == true){
          return handler.next(options);
        }
        options.headers["Autheroization"] = 'Brerer token';

        handler.next(options);
        
      },
    ));
  }


  Future<Map<String,dynamic>> myGetApi(String url) async{
    try {
      final getAllUsers = await dio.get(url);
      if(getAllUsers.statusCode! >= 200){
        return {
          "success" : true,
          "data" : getAllUsers.data
        };
      }
      // print("getAllusers ${getAllUsers.data}");
      // print("getAllusers ${getAllUsers.data.runtimeType}"); //List<dynamic>
      return {
        "nodata" : ""
      };
    } catch (e) {
      return {
        "errorapi" : e.toString()
      };
    }
  }

   static Future<Map<String,dynamic>> myPostApi(dynamic data,[String? urls]) async{
    int success;
    if(data != null){
      success = 1;
    }
    else{
      success = 0;
    }
      print("datas $data");
      return {
        "success" : success == 1 ? "success" : "no values",
        "data" : data ?? {},
      };
  }
}