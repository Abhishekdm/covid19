import './networking.dart';

const indiaDataHistoricalURL = 'https://api.covid19india.org/data.json';

const globalDataURL =
    'https://corona-virus-stats.herokuapp.com/api/v1/cases/general-stats';

// const globalDataHistoricalURL = 'https://corona.lmao.ninja/v2/historical/all';
const globalDataHistoricalURL =
    'https://disease.sh/v2/historical/all?lastdays=6';

class CovidData {
  Future<dynamic> indiaHistoricalData() async {
    NetworkHelper networkHelper = NetworkHelper(url: indiaDataHistoricalURL);

    var indiaData = await networkHelper.getData();
    return indiaData['cases_time_series'];
  }

  Future<dynamic> globalData() async {
    NetworkHelper networkHelper = NetworkHelper(url: globalDataURL);

    var globalData = await networkHelper.getData();
    return globalData['data'];
  }
}
