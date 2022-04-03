
import 'package:cotacao_btc/app/models/cotacao_model.dart';
import 'package:cotacao_btc/app/services/cotacao_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  CotacaoService cotacaoService = CotacaoService();
  var isLoading = false.obs;
  var preco = "".obs;

  static HomeController get home => Get.find();

  Future<Cotacao> recuperarCotacao()  async {
    isLoading.value = true;
    Cotacao cotacao = await cotacaoService.fetchListCotacoes();
    isLoading.value = false;
    update();
    return cotacao;
  }

  Future<RxString> recuperarBuy()  async {
    isLoading.value = true;
    Cotacao cotacao = await recuperarCotacao();
    preco.value = cotacao.buy.toString();
    isLoading.value = false;
    update();
    return preco;
  }

}
