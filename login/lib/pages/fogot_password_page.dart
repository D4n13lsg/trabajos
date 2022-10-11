import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//se crea una pestaña para recuperar la contraseña
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    //todo: implement dispose
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    final cuentaEmail = _emailController.text.trim();
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: cuentaEmail);
      showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: const Text('Recuperación de Contraseña'),
            content: Text('Un email fue enviado a la cuenta $cuentaEmail'),
            actions: <Widget>[
              TextButton(
                child: const Text('Cerrar'),
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
              )
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: const Text('Firebase Error'),
            content: Text('Email error: $e'),
            actions: <Widget>[
              TextButton(
                child: const Text('Cerrar'),
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
//Los widgets son básicamente componentes de la interfaz de usuario utilizados para crear la interfaz de usuario de la aplicación
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'ingrese su email para el restablecimiento de contraseña',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          //Al pasar las restricciones de diseño a su elemento secundario, padding reduce las restricciones según el relleno dado, 
          //lo que hace que el elemento secundario tenga un tamaño más pequeño. El relleno luego se adapta al tamaño de su hijo,
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Email',
                    fillColor: Colors.grey[200],
                    filled: true),
              )),
          const SizedBox(height: 20),
          MaterialButton(
              onPressed: passwordReset,
              color: Colors.deepPurple[200],
              child: const Text(
                'restablecer contraseña',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ))
        ],
      ),
    );
  }
}
