import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final box = GetStorage();

  late final String? shopname;
  late final String? empname;

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
    );
  }
}
