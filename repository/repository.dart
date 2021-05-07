import 'package:bloc_covid/api_repo/covidRepo.dart';
import 'package:bloc_covid/models/covid_model.dart';

class Repository {

 CovidRepository covidRepository = CovidRepository();
  Future<List<CovidModel>> getLatestCovidData() =>covidRepository.getLatestCovidData();

}
