import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'editTheme_component.dart';

Widget appBarPrincipal( String title){
  return AppBar(
    title: Text(title),
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
  );

}
