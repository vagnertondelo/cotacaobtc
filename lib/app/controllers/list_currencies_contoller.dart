
import 'package:cotacao_btc/app/models/cotacao_model.dart';

import 'package:cotacao_btc/app/services/cotacao_service.dart';
import 'package:get/get.dart';


class ListCurrenciesController extends GetxController {
  CotacaoService cotacaoService = CotacaoService();
  var isLoading = false.obs;
  var listCurrenciesObs = <Cotacao>[].obs;

  static ListCurrenciesController get listCurrencies => Get.find();

  Future<dynamic> listCurrecies()  async {
    isLoading.value = true;
    var list = await cotacaoService.fetchListCurrencies();
    listCurrenciesObs.value = list.listCurrencies;
    isLoading.value = false;
    update();
    return listCurrenciesObs;
  }


}
