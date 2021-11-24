/*+

import 'dart:async';
import 'dart:io';
import 'package:api_post/models/model_post.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpService{
  static var time_out =  Duration(seconds: 10);

  static var client =   http.Client();
  static String url = 'https://jsonplaceholder.typicode.com/albums';
  static String log  = 'HttpServiceLog';

  static Future<List<ModelPost>> GetAllPost() async {
    Map<String,String> param_header = {'API-KEY' : '9988776543232q457899'};
    Map<String,String> param_body = {'city_id' : '22','city_name' : '12',};
    try{
      Response response = await client
          .post(Uri.parse(url), body: param_body, headers: param_header)
          .timeout(time_out);

      if(response.statusCode == 200){
        String json_string = response.body;
        List<ModelPost> modelPost = modelPostFromJson(json_string);
        return modelPost;

      } else if (response.statusCode == 401){
        print("hhhh" );

      }
    }
    on TimeoutException catch(_){
      print('$log Time out error please try again');
    } on SocketException{
      print('$log You are not connected to internet');

    } catch (ex){
      print('$log Exception $ex');
    }
    throw Exception();
  }

}


*/