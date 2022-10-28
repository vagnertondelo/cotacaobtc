import 'package:cotacao_btc/app/controllers/list_currencies_contoller.dart';
import 'package:cotacao_btc/app/screens/price_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money2/money2.dart';

import '../components/editTheme_component.dart';
import '../components/pais_cotacao.dart';

class ListCurrencies extends StatefulWidget {
  const ListCurrencies({Key? key}) : super(key: key);

  @override
  _ListCurrenciesState createState() => _ListCurrenciesState();
}

class _ListCurrenciesState extends State<ListCurrencies> {
  var controller = ListCurrenciesController.listCurrencies;

  @override
  void initState() {
    super.initState();
    controller.listCurrecies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cotação compra BTC"),
          actions: [
            editTheme()
            // PopupMenuButton( icon:Icon(Icons.more_vert),itemBuilder:(_)=>[
            //   PopupMenuItem(
            //       child:
            //       ListTile(
            //         leading:
            //         Obx(()=> themeController.isDark.value
            //             ? Icon(Icons.brightness_7):
            //               Icon(Icons.brightness_2),
            //
            //         ),
            //           title: Obx(()=>themeController.isDark.value ? Text('Claro'):Text("Escuro")),
            //         onTap: () => themeController.changeTheme(),
            //       )
            //   )
            // ]),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: 120.0,
                child: DrawerHeader(
                  child:
                  Text(''),
                  decoration: BoxDecoration(color: Colors.deepPurple),
                  margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.all(0.0),
                ),
              ),
              ListTile(
                title: const Text('Atualizar'),
                leading: const Icon(Icons.refresh),
                onTap: () {
                  controller.listCurrecies();
                  Get.back();
                  // Get.to(()=>ListCurrencies());
                },
              ),
            ],
          ),
        ),
        body: Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Container(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: controller.listCurrenciesObs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return
                        validCompnent(controller.listCurrenciesObs[index].buy,controller.listCurrenciesObs[index].symbol) == false? SizedBox():
                        Card(
                        child: ListTile(
                          onTap: () {
                            Get.to(PriceDetails(cotacao:  controller.listCurrenciesObs[index]), fullscreenDialog: true);
                          },
                          leading:
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child:
                                //virou componente
                               PaisCotacao(image: 'assets/imagens-moedas/${controller.listCurrenciesObs[index].symbol}.png',width: 50.0,

                              )
                              //era assim
                            // Image.asset('assets/imagens-moedas/${controller.listCurrenciesObs[index].symbol}.png', height: 50.0,width: 50.0,)
                            ),
                          // Text(controller.listCurrenciesObs[index].symbol),
                          title:
                          Text(Money.fromNum(controller.listCurrenciesObs[index].buy,code:controller.listCurrenciesObs[index].symbol).toString()
                          ),
                          trailing: Icon(Icons.chevron_right),
                        ),
                      );
                    }),
              ))
        // GetBuilder<HomeController>(
        //   builder: ((controller) => controller.isLoading.value?
        //
        //
        //   ),
        // ),
        );
  }

  bool validCompnent(double value, String symbol){
    try {
      Text( Money.fromNum(value,code:symbol).toString());
      return true;
    } catch (error) {
      return false;
    }
  }
}
