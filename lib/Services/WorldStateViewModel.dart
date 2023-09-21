import 'dart:convert';
import 'package:covid19_tracker/Models/WorldStatesModel.dart';
import 'package:covid19_tracker/Services/utilities/App_Url.dart';
import 'package:http/http.dart' as http;

class WorldStateViewModel {
  Future<WorldStatesModel> fetchWorldStatesRecords() async {
    final response = await http.get(Uri.parse(App_Url.worldStateApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countriesListApi() async {
    var data;
    final response = await http.get(Uri.parse(App_Url.countriesList));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
