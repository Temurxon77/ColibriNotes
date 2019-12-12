import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
final String base_url = "https://postman-echo.com/post";

Future<String> signUpApi(Map<String,String> data) async {
    final response = await http.post(Uri.parse(base_url),
    body: json.encode(data),
    headers: {
      "Content-Type": "application/json"
    }
    );
    if(response.statusCode == 200 || response.statusCode == 201){
      return "Success";
    }
    return "Error!";
}
