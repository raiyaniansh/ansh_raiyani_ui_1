import 'dart:convert';

import 'package:ansh_raiyani_ui_1/screen/home/modal/home_modal.dart';
import 'package:http/http.dart' as http;

class ApiHelper
{
  Future<HomeModal> apicall()
  async {
    String link ="https://praticle-service.s3.ap-south-1.amazonaws.com/red_and_white_api.json";
    Uri uri = Uri.parse("$link");
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    return HomeModal.fromJson(json);
  }
}