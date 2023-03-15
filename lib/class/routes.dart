import 'package:bringin_texh/screens/products_view.dart';
import 'package:bringin_texh/screens/welcome.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'package:bringin_texh/screens/dummy_screen.dart';
import 'package:bringin_texh/screens/customer_login.dart';

class Routes{
  static String welcomeScreen = '/welcome';
  static String signIn = '/customer_login';
  static String dummyScreen = '/dummy_screen';
  static String customerProductView = '/products_view';
}
final List<GetPage> getPages = [
  GetPage(
    name: Routes.welcomeScreen, 
    page: ()=> const Welcome()
  ),
  GetPage(
    name: Routes.signIn,
    page: () => const UserSignIn(),
  ),
  GetPage(
    name: Routes.dummyScreen,
    page: () => const DummyScreen(),
  ),
  GetPage(
    name: Routes.customerProductView, 
    page: ()=> const CustomerProductsView()
  )
];