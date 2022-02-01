import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: GetBuilder<LoginController>(
        init: controller,
        builder: (_) {
          return Form(
            key: controller.formKey,
            child: Container(
              padding: EdgeInsets.only(left: 16,right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: controller.email,
                    validator: (text){
                      if(text!.isEmpty){
                        return 'Email is required!';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email'
                    )
                  ),
                  const SizedBox(height: 16,),
                  ElevatedButton(
                    onPressed: () => controller.login(),
                    child: const Text('Login')
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
