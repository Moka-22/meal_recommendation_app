import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> setup() async {
final prefs = await SharedPreferences.getInstance();
sl.registerSingleton<SharedPreferences>(prefs);

}
