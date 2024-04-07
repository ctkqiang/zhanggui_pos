import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zhanggui_pos/pages/menu_page.dart';
import 'package:zhanggui_pos/widgets/user_input.dart';

class AccountSetup extends StatefulWidget {
  const AccountSetup({super.key});

  @override
  State<AccountSetup> createState() => _AccountSetupState();
}

class _AccountSetupState extends State<AccountSetup> {
  Future<void> save({String? data}) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserInput(
        localImagePath: "assets/app.png",
        question: "员工姓名",
        onReturnedData: (name) async {},
        then: () => Get.to(
          UserInput(
            onReturnedData: (shopname) {},
            then: () => Get.to(const MenuPage()),
            question: "企业名称",
            localImagePath: "assets/app.png",
          ),
        ),
      ),
    );
  }
}
