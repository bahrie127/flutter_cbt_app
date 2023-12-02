import 'package:shared_preferences/shared_preferences.dart';

class OnboardingLocalDatasource {

  Future<void> saveOnboadingPassed() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('is_first_time', true);
  }

  Future<bool> getIsFirstTime() async {
    final pref = await SharedPreferences.getInstance();
    final isFirstTime = pref.getBool('is_first_time');

    return isFirstTime ?? false;
  }
}