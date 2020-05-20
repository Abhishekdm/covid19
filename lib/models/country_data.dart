class CountryData {
  String totalAffected;
  String totalDeath;
  String totalRecovered;
  String currentActive;
  String lastupDated;
  int len;
  List<String> weekDataLabels = [];
  List<double> weekDataValues = [];
  List<CountryPreviousData> previousDayData = [];

  CountryData(dynamic data) {
    dynamic countryDataTimeSeries = data['cases_time_series'];
    len = countryDataTimeSeries.length - 1;
    dynamic countryDataStateWise = data['statewise'];

    totalAffected = countryDataStateWise[0]['confirmed'];
    totalDeath = countryDataStateWise[0]['deaths'];
    totalRecovered = countryDataStateWise[0]['recovered'];
    currentActive = countryDataStateWise[0]['active'];
    lastupDated = countryDataStateWise[0]['lastupdatedtime'];

    // creating a list of active values to plot graph
    for (int i = 0; i < 6; i++) {
      weekDataLabels.add(countryDataTimeSeries[len - i]['date']);
      int temp = int.parse(countryDataTimeSeries[len - i]['dailyconfirmed']);
      weekDataValues.add(temp.toDouble());
    }

    // previous day data
    previousDayData.add(CountryPreviousData(
      dailyAffected: countryDataStateWise[0]['deltaconfirmed'],
      dailyRecovered: countryDataStateWise[0]['deltarecovered'],
      dailyDeath: countryDataStateWise[0]['deltadeaths'],
    ));
    previousDayData.add(CountryPreviousData(
      dailyAffected: countryDataTimeSeries[len]['dailyconfirmed'],
      dailyRecovered: countryDataTimeSeries[len]['dailyrecovered'],
      dailyDeath: countryDataTimeSeries[len]['dailydeceased'],
    ));
  }
}

class CountryPreviousData {
  String dailyAffected;
  String dailyDeath;
  String dailyRecovered;

  CountryPreviousData(
      {this.dailyAffected, this.dailyDeath, this.dailyRecovered});
}
