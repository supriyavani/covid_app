class CovidModel {
  String country;
  int totalConfirmed;


  CovidModel({this.country, this.totalConfirmed, });

  factory CovidModel.fromJSON(Map map) {
    return CovidModel(
      country : map["Country"],
      totalConfirmed :map["TotalConfirmed"],
      );
       }
}
