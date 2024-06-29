import 'dart:convert';

import 'package:genderize/data/data_model/GenderDataModel.dart';
import 'package:http/http.dart' as http;

class GenderRepo {
  final String name;

  GenderRepo({required this.name});

  Future getData() async{
    http.Response response = await http.get(Uri.parse('https://api.genderize.io?name=$name'));
    GenderDataModel genderData = GenderDataModel.fromJson(jsonDecode(response.body));
    return genderData;

  }

}

