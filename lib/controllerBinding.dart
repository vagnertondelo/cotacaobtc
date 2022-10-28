import 'package:cotacao_btc/app/controllers/theme_controller.dart';
import 'package:get/get.dart';
import 'app/controllers/list_currencies_contoller.dart';
class ControllerBinding implements Bindings  {
  @override
  void dependencies(){
    Get.lazyPut<ListCurrenciesController>(() => ListCurrenciesController());
    Get.lazyPut<ThemeController>(() => ThemeController());
  }

}