import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:zhanggui_pos/pages/menu_page.dart';
import 'package:zhanggui_pos/widgets/user_input.dart';

class AccountSetup extends StatefulWidget {
  const AccountSetup({super.key});

  @override
  State<AccountSetup> createState() => _AccountSetupState();
}

class _AccountSetupState extends State<AccountSetup> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserInput(
        localImagePath: "assets/app.png",
        question: "员工姓名",
        onReturnedData: (String? name) {
          box.write("员工姓名", name!);
        },
        then: () => Get.to(
          UserInput(
            onReturnedData: (String? shopname) {
              box.write("企业名称", shopname!);
            },
            then: () => Get.to(const MenuPage()),
            question: "企业名称",
            localImagePath: "assets/app.png",
          ),
        ),
      ),
    );
  }
}
