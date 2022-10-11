import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'fogot_password_page.dart';


//se crea una pestaña para logearse el usuario
class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage ({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //Text Controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future singIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }
  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.login,
                size: 100,
              ),
              const SizedBox(height: 75),
              Text('Iniciar sesion',
                style:GoogleFonts.bebasNeue(
                  fontSize:50
                )
              ),
              const SizedBox(height: 10),
              const Text(
                  'bienvenido',
                      style: TextStyle(
                        fontSize: 20,
                      ),
              ),
              const SizedBox(height: 20),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _emailController,
                obscureText: false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  hintText: 'Email',
                  fillColor: Colors.grey[200],
                  filled: true
                ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                 controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12),
                    ),
                      hintText: 'password',
                    fillColor: Colors.grey[200],
                    filled: true
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                        MaterialPageRoute(builder: (context){

                          return ForgotPasswordPage();
                        }
                        ),
                          );
                        },
                        child: const Text(
                          'olvido su contraseña',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
              ),
              ),
              const SizedBox(height:20),
              //button inicio
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: GestureDetector(
                onTap: singIn,
                  child: Container(
                  padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                          'iniciar sesion',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      ),
                    ),
                )

                ),
              ),
              const SizedBox(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('no tiene cuenta',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: const Text(
                        'registrese ahora',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
        )
      ),
    );
  }
}
