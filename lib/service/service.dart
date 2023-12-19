import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:pagination/model/model.dart';

class Service {
  Future service({page}) async {
    var baseUrl = 'https://jsonplaceholder.typicode.com/posts';
    try {
      var response = await http.get(Uri.parse(
          'https://jsonplaceholder.typicode.com/posts?$page=1&$page=10'));

      log(response.body.toString());
      //var jsonresponse = jsonDecode(response.body);
     // print(jsonresponse);
      if (response.statusCode == 200) {
        //return Model.fromJson(jsonresponse);
        //return List<Model>.from(json.decode(response.body));
        List jsonResponse = json.decode(response.body);
  return jsonResponse.map((job) => new Model.fromJson(job)).toList();
      }
    } catch (e) {
      rethrow;
    }
  }
}
