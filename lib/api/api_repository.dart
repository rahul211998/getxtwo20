import 'package:dio/dio.dart';

class ApiRepository {
  late Dio dio;


  ApiRepository(){
    dio = Dio(BaseOptions());

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


  Future<void> myGetApi() async{

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