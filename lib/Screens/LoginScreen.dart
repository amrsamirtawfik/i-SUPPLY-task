import 'package:flutter/material.dart';
import 'package:i_supply_task/Bloc/AuthnicationBloc.dart';

import '../Bloc/States.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: StreamBuilder<Object>(
          stream: authenticationBloc.authenticationStream,
          builder: (context, snapshot) {
            print(snapshot);
            if (snapshot.hasData) {
              if (snapshot.data is AuthenticatedState) {
                // Navigate to the dashboard screen on successful login
                print('authnicated ya zmeeeellll');
              } else if (snapshot.data is UnauthenticatedState) {
                // Show an error message on unsuccessful login
              }
            }
            return Center(
              child: SizedBox(
                width: 1100,
                child: Card(
                  margin: const EdgeInsets.all(100),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(100)), // Set the borderRadius to null
                  ),
                  elevation: 4,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset('assets/images/medicine.jpg'),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Welcome to i\'SUPPLY pharmacy!'
                                '\n'
                                '\n'
                                'Please Login',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                    labelText: 'Username'),
                                controller: usernameController,
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: togglePasswordVisibility,
                                  ),
                                ),
                                obscureText:
                                    !isPasswordVisible, // Toggle the obscureText property
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  // Implement sign-in logic here
                                  authenticationBloc.login(
                                      usernameController.text,
                                      passwordController.text);
                                },
                                child: const Text('Sign In'),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  // Implement sign-up logic here
                                },
                                child: const Text('Sign Up'),
                              ),
                              const SizedBox(height: 20),
                              TextButton(
                                onPressed: () {
                                  // Implement forgot password logic here
                                },
                                child: const Text('Forgot Password?'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
