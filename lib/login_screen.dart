import 'package:flutter/material.dart';

import 'auth_service.dart';
import 'places_cupertino.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() =>
      _LoginPageState();
}

class _LoginPageState
    extends State<LoginPage> {

  final usuarioController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  final authService =
      AuthService();

  bool loading = false;

  Future<void> login() async {

    if (usuarioController.text.isEmpty ||
        passwordController.text.isEmpty) {

      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            "Complete todos los campos",
          ),
        ),
      );

      return;
    }

    setState(() {
      loading = true;
    });

    final ok =
        await authService.iniciarSesion(
      usuarioController.text.trim(),
      passwordController.text,
    );

    setState(() {
      loading = false;
    });

    if (!mounted) return;

    if (ok) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              PlacesCupertino(),
        ),
      );

    } else {

      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            "Usuario o contraseña incorrectos",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [

            TextField(
              controller:
                  usuarioController,
              decoration:
                  const InputDecoration(
                labelText: "Usuario",
                border:
                    OutlineInputBorder(),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            TextField(
              controller:
                  passwordController,
              obscureText: true,
              decoration:
                  const InputDecoration(
                labelText: "Contraseña",
                border:
                    OutlineInputBorder(),
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                    loading
                        ? null
                        : login,
                child:
                    loading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child:
                                CircularProgressIndicator(),
                          )
                        : const Text(
                            "Ingresar",
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}