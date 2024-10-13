import 'package:flutter/material.dart';
import 'package:refood/donar_dashboard.dart';
import 'package:refood/ngo_dashboard.dart';
import 'package:refood/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String selectedRole = 'Donor'; // Default role
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              content(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formSignInKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                          label: const Text('Email'),
                          hintText: 'Enter a valid email',
                          hintStyle: const TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(15, 95, 83, 1),
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(15, 95, 83, 1),
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                        controller: passwordController,
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          hintText: 'Enter Password',
                          hintStyle: const TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(15, 95, 83, 1),
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(15, 95, 83, 1),
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal:
                          16.0), // Adjust the padding inside the container
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(
                          15, 95, 83, 1), // Same border color
                    ),
                    borderRadius:
                        BorderRadius.circular(25), // Same border radius
                  ),
                  child: DropdownButton<String>(
                    value: selectedRole,
                    isExpanded: true, // Make it take the full width
                    underline: Container(), // Removes the default underline
                    items: <String>['Donor', 'NGO'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedRole = newValue!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberPassword,
                          onChanged: (bool? value) {
                            setState(() {
                              rememberPassword = value!;
                            });
                          },
                          activeColor: Colors.blueAccent,
                        ),
                        const Text(
                          'Remember me',
                          style: TextStyle(color: Colors.black45),
                        ),
                      ],
                    ),
                    GestureDetector(
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      onTap: () {
                        // Add functionality for Forgot Password
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0), // Correct padding
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formSignInKey.currentState!.validate() &&
                          rememberPassword) {
                        _login(context);
                      } else if (!rememberPassword) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'Please agree to the processing of personal information')));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(
                          16.0), // Apply padding to the button content
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            25), // Consistent border radius
                      ),
                      backgroundColor: const Color.fromRGBO(
                          15, 95, 83, 1), // Consistent background color
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 0.7,
                    color: Colors.grey.withOpacity(0.5),
                  )),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 10,
                    ),
                    child: Text(
                      'Sign up with',
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 0.7,
                    color: Colors.grey.withOpacity(0.5),
                  ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an accound? ',
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (e) => const Signup(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget content() {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(15, 95, 83, 1),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          height: 130,
          width: double.infinity,
          child: Image.asset("assets/image/w61.png", fit: BoxFit.cover),
        ),
        const SizedBox(height: 20),
        const Text(
          "Welcome to ReFood!",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
      ],
    );
  }

  void _login(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    // TODO: Add backend logic for login authentication here.

    if (email.isNotEmpty && password.isNotEmpty) {
      if (selectedRole == 'Donor') {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const DonorDashboard()),
          (route) => false,
        );
      } else if (selectedRole == 'NGO') {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const RecipientDashboard()),
          (route) => false,
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email and password')),
      );
    }
  }
}
