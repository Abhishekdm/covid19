class GlobalData {
  String totalAffected;
  String totalDeath;
  String totalRecovered;
  String currentActive;
  String currentCritical;
  String todayAffected;
  String todayDeath;

  GlobalData(dynamic globalData) {
    totalAffected = globalData['cases'].toString();
    totalDeath = globalData['deaths'].toString();
    totalRecovered = globalData['recovered'].toString();
    currentActive = globalData['active'].toString();
    currentCritical = globalData['critical'].toString();
    todayAffected = globalData['todayCases'].toString();
    todayDeath = globalData['todayDeaths'].toString();
  }
}
