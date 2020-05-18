import './networking.dart';

const indiaDataHistoricalURL = 'https://api.covid19india.org/data.json';

const globalDataURL =
    'https://corona-virus-stats.herokuapp.com/api/v1/cases/general-stats';

const globalDataHistoricalURL =
    'https://disease.sh/v2/historical/all?lastdays=10';

// const globalDataHistoricalURL = 'https://corona.lmao.ninja/v2/historical/all';

class CovidData {
  Future<dynamic> indiaHistoricalData() async {
    try {
      NetworkHelper networkHelper = NetworkHelper(url: indiaDataHistoricalURL);

      var indiaData = await networkHelper.getData();
      return indiaData['cases_time_series'];
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> globalData() async {
    try {
      NetworkHelper networkHelper = NetworkHelper(url: globalDataURL);

      var globalData = await networkHelper.getData();
      return globalData['data'];
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> globalHistoricalData() async {
    try {
      NetworkHelper networkHelper = NetworkHelper(url: globalDataHistoricalURL);
      List<double> weekDataAffected = [];
      List<double> weekDataDeath = [];
      List<double> weekDataRecovered = [];

      var globalHistoricalData = await networkHelper.getData();
      List cases = globalHistoricalData['cases'].values.toList();
      cases = cases.reversed.toList();
      List deaths = globalHistoricalData['deaths'].values.toList();
      deaths = deaths.reversed.toList();
      List recovered = globalHistoricalData['recovered'].values.toList();
      recovered = recovered.reversed.toList();
      for (int i = 0; i < cases.length - 1; i++) {
        int c = (cases[i] - cases[i + 1]);
        weekDataAffected.add(c.toDouble());

        int d = (deaths[i] - deaths[i + 1]);
        weekDataDeath.add(d.toDouble());

        int r = (recovered[i] - recovered[i + 1]);
        weekDataRecovered.add(r.toDouble());
      }
      return WeekData(
          weekDataAffected: weekDataAffected,
          weekDataDeath: weekDataDeath,
          weekDataRecovered: weekDataRecovered);
    } catch (e) {
      print(e);
    }
  }
}

class WeekData {
  List<double> weekDataAffected;
  List<double> weekDataDeath;
  List<double> weekDataRecovered;
  WeekData({this.weekDataAffected, this.weekDataDeath, this.weekDataRecovered});
}
