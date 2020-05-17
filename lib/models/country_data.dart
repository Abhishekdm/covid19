class CountryData {
  String totalAffected;
  String totalDeath;
  String totalRecovered;
  String currentActive;
  int len;
  List<String> weekDataLabels = [];
  List<double> weekDataValues = [];
  int a = 0;

  CountryData(dynamic countryData) {
    len = countryData.length - 1;
    totalAffected = countryData[len]['totalconfirmed'];
    totalDeath = countryData[len]['totaldeceased'];
    totalRecovered = countryData[len]['totalrecovered'];
    int temp = (int.parse(totalAffected) -
        int.parse(totalDeath) -
        int.parse(totalRecovered));
    currentActive = temp.toString();

    for (int i = 0; i < 6; i++) {
      weekDataLabels.add(countryData[len - i]['date']);
      int temp = int.parse(countryData[len - i]['dailyconfirmed']);
      weekDataValues.add(temp.toDouble());
    }
  }
}
