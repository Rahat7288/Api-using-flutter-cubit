import 'dart:convert';

import '../models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService{

  Future<List<User>> getData() async{
    List<User> userData = [];

    try{
      var request = http.Request('GET', Uri.parse('https://jsonplaceholder.typicode.com/users'));
      http.StreamedResponse  response = await request.send();

      if(response.statusCode == 200){
        var rawData = await response.stream.bytesToString();
        List<dynamic>data = jsonDecode(rawData);
        data.forEach((element) {
          User user = User.fromJson(element);
          userData.add(user);
        });
        return userData;

      }else{
        return [];
      }
    }catch(e){
      throw e;
    }
  }
}