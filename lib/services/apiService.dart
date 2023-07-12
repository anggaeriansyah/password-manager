import 'dart:convert';
import 'package:http/http.dart' as http;

// import '../models/color_model.dart';

Future<List<dynamic>> fetchData() async {
  var url = Uri.parse('https://reqres.in/api/unknown');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    var colorJsonList = jsonData['data'];

    return colorJsonList;
  } else {
    throw Exception('Failed to fetch data from REST API');
  }
}
