import 'package:flutter/material.dart';
import 'package:my_app/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black45,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 2,
                        child: Image.network(
                            'https://seeklogo.com/images/S/svg-logo-C2C6DE140E-seeklogo.com.png'),
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text("Já tem cadastro?",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(height: 10),
                  const Text("Faça seu login e make the change",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  const SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    height: 30,
                    alignment: Alignment.center,
                    child: TextField(
                        controller: emailController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(top: -3),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 82, 13, 160))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber)),
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.mail_outline,
                                color: Color.fromARGB(255, 82, 13, 160)))),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    height: 30,
                    alignment: Alignment.center,
                    child: TextField(
                        obscureText: isObscure,
                        controller: passwordController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(top: -3),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 82, 13, 160))),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber)),
                            hintText: "Senha",
                            hintStyle: const TextStyle(color: Colors.white),
                            prefixIcon: const Icon(Icons.lock_outlined,
                                color: Color.fromARGB(255, 82, 13, 160)),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              child: Icon(
                                isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color.fromARGB(255, 82, 13, 160),
                              ),
                            ))),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: TextButton(
                      onPressed: () {
                        if (emailController.text.trim() == 'diego' &&
                            passwordController.text.trim() == '123') {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Erro nas credenciais',
                                      style: TextStyle(fontSize: 20))));
                        }
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 82, 13, 160))),
                      child: const Text("Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Expanded(child: Container()),
                  const Text("Esqueci minha senha",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.orange,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 15),
                  const Text("Criar conta",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.teal,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 80)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
