import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zhanggui_pos/components/scroll_physic.dart';
import 'package:zhanggui_pos/model/menu.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final box = GetStorage();

  late final String? shopname;
  late final String? empname;

  final List<Menu> menu = [
    Menu(index: 0, name: "付款", localIconPath: "assets/scanner.png"),
    Menu(index: 1, name: "库存", localIconPath: "assets/inventory.png"),
    Menu(index: 2, name: "关于", localIconPath: "assets/info.png"),
  ];

  void onMenuTap(int index) {
    switch (index) {
      case 0:
      case 1:
      case 2:
      default:
        break;
    }
  }

  @override
  void initState() {
    super.initState();

    shopname = box.read("企业名称");
    empname = box.read("员工姓名");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(shopname!),
        leading: Tooltip(
          message: empname!,
          child: InkResponse(
            onTap: () {},
            enableFeedback: true,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.person_2_outlined, size: 20),
                  Text(
                    empname!,
                    style: const TextStyle(fontSize: 8),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: ScrollConfiguration(
            behavior: ZhangGuiPOSScrollPhysics(),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
              ),
              itemBuilder: (BuildContext context, int index) {
                final posMenu = menu[index];

                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(35.0),
                    onTap: () => onMenuTap(index),
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            posMenu.localIconPath!,
                            height: 65,
                            width: 65,
                          ),
                          Text(
                            posMenu.name!,
                            style: const TextStyle(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: menu.length,
            ),
          ),
        ),
      ),
    );
  }
}
