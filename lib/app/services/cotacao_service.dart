import 'dart:convert';
import 'package:cotacao_btc/app/models/lis_currencies_model.dart';
import 'package:http/http.dart' as http;

import '../models/cotacao_model.dart';

class CotacaoService{
  String url = "https://blockchain.info/ticker";
  dynamic _response;

  CotacaoService(){
    _response="";
  }

  Future<Cotacao> fetchListCotacoes() async {
    _response = await http.get(Uri.parse(url));
    if (_response.statusCode == 200) {
      Map<String, dynamic> retorno = json.decode(_response.body);
      return Cotacao.fromJson(retorno["BRL"]);
    } else {
      throw Exception('Failed to load cote');
    }
  }


  Future<ListCurrencies> fetchListCurrencies() async {
    _response = await http.get(Uri.parse(url));
    if (_response.statusCode == 200) {
      Map<String, dynamic> retorno = json.decode(_response.body);
      return  ListCurrencies.fromJson(retorno);
    } else {
      throw Exception('Failed to load cote');
    }
  }
}







