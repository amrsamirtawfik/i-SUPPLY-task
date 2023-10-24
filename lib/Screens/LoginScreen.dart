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
  bool loginError = false;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login Screen'),
      // ),
      body: StreamBuilder<Object>(
          stream: authenticationBloc.authenticationStream,
          builder: (context, snapshot) {
            print(snapshot);
            if (snapshot.hasData) {
              if (snapshot.data is AuthenticatedState) {
                // Navigate to the dashboard screen on successful login
                loginError = false;
                print('authnicated ya zmeeeellll');
              } else if (snapshot.data is UnauthenticatedState) {
                // Show an error message on unsuccessful login
                loginError = true;
              }
            }
            return Container(
              padding: const EdgeInsets.all(100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [
                  Expanded(
                    // child: Image.asset('assets/images/medicine.jpg'),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(100),
                        bottomLeft: Radius.circular(100),
                      ),
                      child: Image.asset(
                        'assets/images/medicine.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 400,
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
                            decoration:
                                const InputDecoration(labelText: 'Username'),
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
                              authenticationBloc.login(usernameController.text,
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
                          loginError
                              ? const Text(
                                  'Username or password is incorrect!',
                                  style: TextStyle(color: Colors.red),
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
