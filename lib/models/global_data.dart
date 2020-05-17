class GlobalData {
  String totalAffected;
  String totalDeath;
  String totalRecovered;
  String currentActive;
  String currentCritical;

  GlobalData(dynamic globalData) {
    totalAffected = globalData['total_cases'];
    totalDeath = globalData['death_cases'];
    totalRecovered = globalData['recovery_cases'];
    currentActive = globalData['currently_infected'];
    currentCritical = globalData['critical_condition_active_cases'];
  }
}
