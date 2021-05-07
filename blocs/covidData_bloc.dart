import 'package:bloc_covid/models/covid_model.dart';
import 'package:bloc_covid/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class CovidDataBloc {
  final _repository = Repository();
  final _covidDataStream = PublishSubject<List<CovidModel>>();
  Stream<List<CovidModel>> get covidDataStream => _covidDataStream.stream;

  fetchCovidData() async {
    List<CovidModel> data = await _repository.getLatestCovidData();
    _covidDataStream.sink.add(data);
  }

  dispose() {
    _covidDataStream.close();
  }

// CovidDataBloc  covidDataBloc =  CovidDataBloc();
}
