import 'package:bloc_covid/blocs/covidData_bloc.dart';
import 'package:bloc_covid/models/covid_model.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  CovidDataBloc covidDataBloc = CovidDataBloc();
  @override
 void initState() {
   
 covidDataBloc.fetchCovidData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19'),
      ),
      body: StreamBuilder(
        stream: covidDataBloc.covidDataStream,
        builder: (context, AsyncSnapshot<List<CovidModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data[index].country),
                     trailing:
                        Text(snapshot.data[index].totalConfirmed.toString()),
                  ),
                );
              },
              itemCount: null,
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
