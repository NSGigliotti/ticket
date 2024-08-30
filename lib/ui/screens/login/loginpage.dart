import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket/core/theme/theme.dart';
import 'package:ticket/ui/screens/login/widget/customGradientButton.dart';
import 'package:ticket/ui/screens/login/widget/loginFormFildComponent.dart';

import '../../../controller/userController.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      decoration: AppTheme.backgoundDecoration,
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(child: Container()),
          GetBuilder<Usercontroller>(builder: (controller) {
            return controller.isLoading
                ? SizedBox(
                    height: size.height,
                    width: size.width,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : IntrinsicWidth(
                    child: SizedBox(
                      width: size.width * 0.85,
                      child: Material(
                        elevation: 1,
                        color: Colors.transparent,
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              Container(
                                child: controller.isCreatAcount
                                    ? Column(
                                        children: [ //* tela de criaçao de conta
                                          LoginFormFildComponent(
                                            controller: controller.name,
                                            labelText: 'Nome Completo',
                                          ),
                                          LoginFormFildComponent(
                                            controller: controller.emailCreat,
                                            labelText: 'Email',
                                          ),
                                          LoginFormFildComponent(
                                            controller: controller.phone,
                                            labelText: 'Telefone',
                                          ),
                                          LoginFormFildComponent(
                                            controller:
                                                controller.passwordCreat,
                                            labelText: 'Senha',
                                            isPassword: true,
                                          ),
                                          LoginFormFildComponent(
                                            controller:
                                                controller.passwordCreatConfirm,
                                            labelText: 'Confirmaçao De senha',
                                            isPassword: true,
                                          ),
                                        ],
                                      )
                                    : Column( //* tela de login
                                        children: [
                                          LoginFormFildComponent(
                                            controller: controller.email,
                                            labelText: 'Email',
                                          ),
                                          LoginFormFildComponent(
                                            controller: controller.password,
                                            isPassword: true,
                                            labelText: 'Senha',
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Checkbox(
                                                value: controller.stayConnected,
                                                onChanged: (status) =>
                                                    controller
                                                        .changeStayConnected(),
                                              ),
                                              Text(
                                                'Manter Conectado',
                                                style: AppTheme.stayConnected,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Column(
                                  children: [
                                    CustomGradientButton(
                                      text: controller.isCreatAcount
                                          ? 'Criar Conta'
                                          : 'Login',
                                      onPressed: () => controller.isCreatAcount
                                          ? controller.CreateUser()
                                          : controller.login(context),
                                    ),
                                    CustomGradientButton(
                                      text: controller.isCreatAcount
                                          ? 'Fazer login'
                                          : 'Criar Conta',
                                      onPressed: controller.creatAcountPage,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
          }),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
