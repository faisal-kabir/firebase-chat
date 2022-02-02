import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {

    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: GetBuilder<RegisterController>(
            init: controller,
            builder: (_) {
              return Form(
                key: controller.formKey,
                child: Container(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                          controller: controller.name,
                          validator: (text){
                            if(text!.isEmpty){
                              return 'Name is required!';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              labelText: 'Name'
                          )
                      ),
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
                      TextFormField(
                          controller: controller.photo,
                          validator: (text){
                            if(text!.isEmpty){
                              return 'Photo is required!';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              labelText: 'Photo'
                          )
                      ),
                      const SizedBox(height: 16,),
                      ElevatedButton(
                          onPressed: () => controller.register(),
                          child: const Text('Register')
                      ),
                      const SizedBox(height: 16,),
                      TextButton(
                          onPressed: (){
                            Get.back();
                          },
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
}//GgUk0p3AuIoEjF6bnPAs //yg50vdq7UMQZkhm9mJTf
