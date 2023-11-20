import 'package:despedida/app/bindings/home_binding.dart';
import 'package:despedida/app/views/home_screen.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages{
  AppPages._();
  static const INITIAL = Routes.HOME;
  static final routes = [
    GetPage(name: Routes.HOME, page: () => HomeView(), binding: HomeBinging()),
  ];

}