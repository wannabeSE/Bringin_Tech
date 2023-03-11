import 'package:bringin_texh/screens/dummy_screen.dart';
import 'package:bringin_texh/screens/set_profile.dart';

import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes{
  static String setProfile = '/set_profile';
  static String dummyScreen = '/dummy_screen';
}
final List<GetPage> getPages = [
  GetPage(
    name: Routes.setProfile,
    page: () => const CreateProfile(),
  ),
  GetPage(
    name: Routes.dummyScreen,
    page: () => const DummyScreen(),
  ),
];