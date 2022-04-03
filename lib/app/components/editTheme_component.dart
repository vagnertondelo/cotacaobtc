import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controllers/theme_controller.dart';

Widget editTheme(){
  var themeController = ThemeController.to;
  return
    IconButton(
      icon:
      Obx(()=> themeController.isDark.value
          ? Icon(Icons.brightness_7):
      Icon(Icons.brightness_2),
      ),
      tooltip: 'Trocar tema',
      onPressed: () {
          themeController.changeTheme();
      },
    );
}
