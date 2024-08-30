// ignore_for_file: file_names
import 'dart:convert';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:ticket/routes/app_routes.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket/data/models/tickt_model.dart';
import 'package:ticket/data/models/user_model.dart';
import 'package:ticket/services/utilities.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:validators/validators.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Usercontroller extends GetxController {
  late User user;

  bool isCreatAcount = false; //* variavel q faz transitar entre as telas de login e criaçao de usuario

  bool stayConnected = false; //* Indica se o usuário deve permanecer logado após o fechamento do aplicativo

  final formKey = GlobalKey<FormState>(); //* form key da tela do login/criaçao de conta
  final passwordFormKey = GlobalKey<FormState>(); //* form key da tela de troca de senha
  bool validateChangePassword = true;

  bool isLoading = false;

  final storage = const FlutterSecureStorage(); //* carrega o storage 

  //!-------------------------------------------------------------

  //* controllers da tela de loguin
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  //!-------------------------------------------------------------

  //* controllers da tela de criaçao de conta
  TextEditingController name = TextEditingController();
  TextEditingController emailCreat = TextEditingController();
  TextEditingController phone = MaskedTextController(mask: '(00) 00000 - 0000');
  TextEditingController passwordCreat = TextEditingController();
  TextEditingController passwordCreatConfirm = TextEditingController();

  //!-------------------------------------------------------------

  @override
  Future<void> onInit() async {
    super.onInit();
    isLoading = true;
    update();

    await getLoginSave();
  }

  Future<void> getLoginSave() async {
    String? getId = await getlocalData(key: 'id'); //* verifica se o storage esta vazio 

    if (getId != null) {
      final db = await getDataBase();
      final List<Map<String, dynamic>> result = await db.query(
        'USER',
        where: 'id = ?',
        whereArgs: [getId],
      );

      List<User> loginUser = result.map((map) => User.fromMap(map)).toList();

      user = loginUser[0]; //* carrega o usuario

      update();
      Get.offAllNamed(PagesRoutes.home); 
    }

    isLoading = false;
    update();
  }

  //* transita entre as telas de login e criaçao de conta
  void creatAcountPage() {
    isCreatAcount = !isCreatAcount; 

    update();
  }
  
  void changeStayConnected() {
    stayConnected = !stayConnected;

    update();
  }


  bool validateForm() {
    if (!isCreatAcount) { //* verifica qual tela vai ser validada
      if (email.text == '') {
        Utilities.showToast(message: 'Email necessario', error: true);
        return false;
      }
  
      if (!isEmail(email.text)) {
        Utilities.showToast(message: 'Email invalido', error: true);
        return false;
      }
      if (password.text == '') {
        Utilities.showToast(message: 'Senha necessario', error: true);
        return false;
      }
    } else {
      if (name.text == '') {
        Utilities.showToast(message: 'Nome necessario', error: true);
        return false;
      }

      if (emailCreat.text == '') {
        Utilities.showToast(message: 'Email necessario', error: true);
        return false;
      }

      if (!isEmail(emailCreat.text)) {
        Utilities.showToast(message: 'Email invalido', error: true);
        return false;
      }

      if (phone.text == '') {
        Utilities.showToast(message: 'Telefone necessario', error: true);
        return false;
      }

      if (passwordCreat.text == '') {
        Utilities.showToast(message: 'Senha invalida invalido', error: true);
        return false;
      }

      if (passwordCreatConfirm.text == '') {
        Utilities.showToast(
            message: 'Confirmação senha invalida invalido', error: true);
        return false;
      }

      if (passwordCreat.text != passwordCreatConfirm.text) {
        Utilities.showToast(message: 'Senhas nao batem', error: true);
        return false;
      }
    }

    update();
    return true;
  }

  //* validaçao da troca de senha
  bool validateFormChangePassword() {
    validateChangePassword = passwordFormKey.currentState!.validate();
    update();
    return validateChangePassword;
  }

  Future<void> changePassword(String password, String repitPassword) async {
    if (!validateFormChangePassword()) return;
    if (password == repitPassword) {
      user.password = repitPassword;
      updateUser(user);
    }
  }

  // ignore: non_constant_identifier_names
  Future<void> CreateUser() async { //* criaçao de conta
    isLoading = true;

    bool validate = validateForm();

    if (validate) {

      User newUser = User(
        id: const Uuid().v4(), //* gera um ID aleatorio
        name: name.text,
        email: emailCreat.text,
        phone: phone.text,
        password: passwordCreat.text,
        tickets: [],
      );

      try {
        await insertUser(newUser); //* salva o usuario no baco
        creatAcountPage(); //* volta para a tela de login
      } catch (e) {
        Utilities.showToast(message: e, error: true);
      }
    }

    isLoading = false;

    //* limpa as variaveis
    name.clear();
    emailCreat.clear();
    phone.clear();
    passwordCreat.clear();
    passwordCreatConfirm.clear();

    update();
  }

  Future<void> login(context) async {

    FocusScopeNode currentFocus = FocusScope.of(context); 
    if (!currentFocus.hasPrimaryFocus) { //* fecha o teclado
      currentFocus.unfocus();
    }

    if (!validateForm()) return;
    isLoading = true;

    List<Map<String, dynamic>> checkEmail = await getUserLogin(email.text); //* verifica o email no banco

    if (checkEmail.isNotEmpty) {
      List<User> loginUser = checkEmail.map((map) => User.fromMap(map)).toList();

      if (email.text == loginUser[0].email && password.text == loginUser[0].password) {
        user = loginUser[0];
      
        email.clear();
        password.clear();

        if (stayConnected) {
          saveLocalData(key: 'id', data: user.id);
        }

        isLoading = false;
        update();
        Get.offAllNamed(PagesRoutes.home);
      } else {
        Utilities.showToast(message: 'Senha invalida', error: true);
        isLoading = false;
        update();
      }
    } else {
      Utilities.showToast(message: 'Email ou senha invalidos', error: true);
      isLoading = false;
      update();
    }
  }

  Future<void> addTickt(TickModel ticket) async { 
    user.addTickt(ticket); //* adicona um bilhete ao usuario
    await updateUser(user); //* atualiza o usuario no banco
    update();
  }

  // ignore: non_constant_identifier_names
  Future<void> Logout() async { 
    await removeLocalData(key: 'id'); //* remove o ID do storage

    user = User(id: '', name: '', email: '', phone: '', password: '', tickets: []);

    Utilities.showToast(message: 'Logout efetuado com sucesso');

    Get.offAllNamed(PagesRoutes.login);
  }

  //! ---------------------------DB---------------------------------

  Future<Database> getDataBase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'user_database.db');//* cria o do caminho do banco

    //* cria a tabela do banco
    const createTableSQL = '''CREATE TABLE USER(id TEXT PRIMARY KEY,name TEXT,email TEXT,password TEXT,phone TEXT, tickets TEXT)''';

    final database = openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          createTableSQL,
        );
      },
      version: 1,
    );

    return database;
  }

  Future<void> insertUser(User user) async {
    final db = await getDataBase();

    final result = await userExists(user.email);

    if (!result) {
      final ticktsStr = json.encode(user.tickets);

      db.rawInsert(
          'insert into USER(id, name, email, password, phone, tickets) values(?,?,?,?,?,?)',
          [
            user.id,
            user.name,
            user.email,
            user.password,
            user.phone,
            ticktsStr,
          ]);
    } else {
      Utilities.showToast(
        message: 'Este email ja esta sendo utilizado',
        error: true,
      );
    }
  }

  //* verifica se o email esta sendo utilizado
  Future<bool> userExists(String email) async {
    final db = await getDataBase();
    final List<Map<String, dynamic>> result = await db.query(
      'USER',
      where: 'email = ?',
      whereArgs: [email],
    );

    return result.isNotEmpty;
  }

  Future<List<Map<String, dynamic>>> getUserLogin(String email) async {
    final db = await getDataBase();
    final List<Map<String, dynamic>> result = await db.query(
      'USER',
      where: 'email = ?',
      whereArgs: [email],
    );

    return result;
  }

  Future<void> updateUser(User user) async {
    final ticketsStr = json.encode(user.tickets);

    final db = await getDataBase();
    await db.rawUpdate(
      'UPDATE USER SET name = ?, email = ?, password = ?, phone = ?, tickets = ? WHERE id = ?',
      [
        user.name,
        user.email,
        user.password,
        user.password,
        ticketsStr,
        user.id,
      ],
    );
  }

  //! ------------------------------------------------------------

  //* Salvar dado localmente
  Future<void> saveLocalData(
      {required String key, required String data}) async {
    await storage.write(key: key, value: data);
  }

  //* Recuperar dado salvo locamente
  Future<String?> getlocalData({required String key}) async {
    return await storage.read(key: key);
  }

  //* Remove dadp salvo localmente
  Future<void> removeLocalData({required String key}) async {
    await storage.delete(key: key);
  }
}
