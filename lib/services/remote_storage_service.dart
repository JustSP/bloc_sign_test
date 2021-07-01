// ignore_for_file: file_names

import 'package:bloc_sign_test/signin/custom_exceeption.dart';
import 'package:http/http.dart' as http;

class RemoteStorageService {
  //final dio = Dio();
  final String _baseUrl = "scrumapi.azurewebsites.net";
  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
    // "Authorization": "Bearer " + appDataService.authenticationToken
  };

  Future<String> sendData(String apiRelativePath, String paramJson) async {
    var response = await http.post(Uri.https(_baseUrl, apiRelativePath),
        headers: _headers, body: paramJson);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw CustomAppException(response.body);
    }
  }

  Future<String> getData(String apiRelativePath) async {
    var response =
        await http.get(Uri.https(_baseUrl, apiRelativePath), headers: _headers);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw CustomAppException(response.body);
    }
  }
}
