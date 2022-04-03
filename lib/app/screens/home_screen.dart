
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_contoller.dart';
import '../models/cotacao_model.dart';
import '../services/cotacao_service.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // HomeController homeController = HomeController();
  var controller = HomeController.home;
  // bool isLoading = false;
  // String _preco = "0";
   // late Cotacao cotacao;

  // void _recuperarPreco() async {
  //   // setState(() {
  //   //   isLoading = true;
  //   // });
  //   // var url = Uri.parse("https://blockchain.info/ticker");
  //   // http.Response response = await http.get(url);
  //   // Map<String, dynamic> retorno = json.decode(response.body);
  //   // cotacao = await fetchListCotacoes();
  //   // controller.isLoading.value = true;
  //   cotacao = await controller.recuperarCotacao();
  //
  //   // controller.isLoading.value = false;
  //
  //   setState(() {
  //     _preco = cotacao.buy.toString();
  //   });
  //   // print("Resultado : " + retorno["BRL"]["buy"].toString());
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Obx(()=> controller.isLoading.value?
          Center(child: const CircularProgressIndicator()) :
          Container(
            padding: EdgeInsets.all(32),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 30),
                    child: Text(
                      controller.preco.value!= ""?'R\$ ${controller.preco.value.toString()}': "0",
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                  RaisedButton(
                    child: Text(
                      "Atualizar",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    color: Colors.orange,
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                    onPressed: (){
                        controller.recuperarBuy();
                        // _recuperarPreco();
                    },
                  )
                  // Image.asset("imagens/bitcoin.png"),
                ],
              ),
            ),
          ))
        // GetBuilder<HomeController>(
        //   builder: ((controller) => controller.isLoading.value?
        //
        //
        //   ),
        // ),
    );
  }
}
