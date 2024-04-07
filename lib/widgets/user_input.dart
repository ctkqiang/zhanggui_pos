// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  final void Function(String) onReturnedData;
  final VoidCallback then;

  final String question;
  final String localImagePath;

  UserInput({
    Key? key,
    required this.onReturnedData,
    required this.then,
    required this.question,
    required this.localImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final userData = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async {
          // Return false to prevent the user from leaving the page
          return false;
        },
        child: Center(
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(height: 150),
                Image.asset(
                  localImagePath,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 5, 30, 20),
                  child: TextFormField(
                    controller: userData,
                    keyboardType: TextInputType.text,
                    cursorColor: const Color.fromARGB(255, 132, 151, 255),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.edit_document,
                        color: Color.fromARGB(255, 132, 151, 255),
                      ),
                      hintText: question,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 15,
                      ),
                      fillColor: const Color.fromARGB(255, 132, 151, 255),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 132, 151, 255),
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 132, 151, 255),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 5, 30, 20),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        try {
                          onReturnedData(userData.text);
                        } catch (e) {
                          rethrow;
                        } finally {
                          then();
                        }
                      }
                    },
                    style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(
                        EdgeInsets.all(18),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      enableFeedback: true,
                      backgroundColor: const MaterialStatePropertyAll(
                        Color.fromARGB(255, 132, 151, 255),
                      ),
                    ),
                    label: const Text("保存", style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
