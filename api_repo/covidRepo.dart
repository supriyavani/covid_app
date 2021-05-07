import 'dart:convert';

import 'package:bloc_covid/models/covid_model.dart';
import 'package:http/http.dart' as http;

class CovidRepository {
  Future<List<CovidModel>> getLatestCovidData() async {
    
      var data =
          await http.get(Uri.parse("https://api.covid19api.com/summary"));
      return (json.decode(data.body)["Countries"] as List)
          .map((e) => CovidModel.fromJSON(e))
          .toList();
   
  }
}
