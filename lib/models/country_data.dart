class CountryData {
  String totalAffected;
  String totalDeath;
  String totalRecovered;
  String currentActive;
  int len;
  List<String> weekDataLabels = [];
  List<double> weekDataValues = [];
  List<CountryPreviousData> previousDayData = [];

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

    for (int i = 0; i < 2; i++) {
      String confirmed = countryData[len - i]['dailyconfirmed'];
      String died = countryData[len - i]['dailydeceased'];
      String recover = countryData[len - i]['dailyrecovered'];

      previousDayData.add(CountryPreviousData(
          dailyAffected: confirmed, dailyDeath: died, dailyRecovered: recover));
    }
  }
}

class CountryPreviousData {
  String dailyAffected;
  String dailyDeath;
  String dailyRecovered;

  CountryPreviousData(
      {this.dailyAffected, this.dailyDeath, this.dailyRecovered});
}
