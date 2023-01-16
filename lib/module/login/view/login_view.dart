import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 160, 209, 232),
          body: Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const ExTextField(
                          id: "email",
                          label: "Email",
                        ),
                        const ExTextField(
                          id: "password",
                          label: "Password",
                          textFieldType: TextFieldType.password,
                          value: null,
                        ),
                        ExButton(
                          label: "Login",
                          color: Colors.blue,
                          onPressed: () => controller.doLogin(),
                        ),
                        InkWell(
                          onTap: () => Get.to(const RegisterView()),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Register"),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
