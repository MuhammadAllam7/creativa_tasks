import 'package:creativa_tasks/controller/login_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ctrl = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: ctrl.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: ctrl.emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'cannot be empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextFormField(
                controller: ctrl.passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'cannot be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() => ctrl.isHidden = !ctrl.isHidden);
                    },
                    icon: ctrl.isHidden
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
                obscureText: ctrl.isHidden,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => ctrl.login(context),
                child: const Text('Login'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => ctrl.register(context),
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
