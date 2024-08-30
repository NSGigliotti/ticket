import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket/controller/userController.dart';
import 'package:ticket/core/theme/theme.dart';
import 'package:ticket/ui/screens/login/widget/loginFormFildComponent.dart';
import 'package:ticket/ui/widgets/button_edit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    TextEditingController password = TextEditingController();
    TextEditingController repitPassword = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perfil',
          style: AppTheme.dataTimeDisplay,
        ),
      ),
      body: GetBuilder<Usercontroller>(
        builder: (controller) {
          return SingleChildScrollView(
            child: SizedBox(
              child: Column(
                //* informações do usuario
                children: [
                  SizedBox(
                    height: size.width * 0.25,
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child:
                            Icon(Icons.person, size: 60, color: Colors.white),
                      ),
                      Text(
                        'Usuario :',
                        style: AppTheme.seatInfoStyle,
                      ),
                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Text(
                          controller.user.name,
                          style: AppTheme.seatInfoStyle,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child:
                              Icon(Icons.email, size: 60, color: Colors.white),
                        ),
                        Text(
                          'Email :',
                          style: AppTheme.seatInfoStyle,
                        ),
                        Expanded(child: Container()),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            controller.user.email,
                            style: AppTheme.seatInfoStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(Icons.phone, size: 60, color: Colors.white),
                      ),
                      Text(
                        'Telefone :',
                        style: AppTheme.seatInfoStyle,
                      ),
                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Text(
                          controller.user.phone,
                          style: AppTheme.seatInfoStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.23,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),


                      //* troca senha button showDialog
                      ButtonEdit(
                          onPressed: () {
                            showDialog(
                              barrierColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor:
                                      const Color.fromARGB(122, 255, 255, 255),
                                  title: const Text('Trocar senha'),
                                  content: SizedBox(
                                    height: size.height * 0.35,
                                    child: Form(
                                      key: controller.passwordFormKey,
                                      child: Column(
                                        children: [
                                          LoginFormFildComponent(
                                            controller: password,
                                            labelText: 'Digite a senha',
                                          ),
                                          LoginFormFildComponent(
                                            controller: repitPassword,
                                            labelText: 'Repita a senha',
                                          ),
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  controller.changePassword(
                                                    password.text,
                                                    repitPassword.text,
                                                  );
                                                },
                                                child:
                                                    const Text('Trocar Senha'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Cancelar'),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          text: 'Trocar Senha'),
                      Expanded(child: Container()),


                      //* logout button showDialog
                      ButtonEdit(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Deseja desconectar'),
                                  content: SizedBox(
                                    height: size.height * 0.10,
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red),
                                          onPressed: () => controller.Logout(),
                                          child: Text(
                                            'Sim',
                                            style: AppTheme.seatInfoStyle,
                                          ),
                                        ),
                                        Expanded(child: Container()),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.green),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'Nao',
                                            style: AppTheme.seatInfoStyle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          text: 'logout'),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Expanded(child: Container()),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
