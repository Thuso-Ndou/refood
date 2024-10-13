import 'package:flutter/material.dart';
import 'package:refood/complete_donor.dart';
import 'package:refood/complete_ngo.dart';
import 'package:refood/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String selectedRole = 'Donor'; // Default role
  final _formSignUnKey = GlobalKey<FormState>();

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
                  key: _formSignUnKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter full name';
                          }
                          return null;
                        },
                        controller: nameController,
                        decoration: InputDecoration(
                          label: const Text('Name'),
                          hintText: 'Enter full name',
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
                padding: const EdgeInsets.all(16.0), // Correct padding
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formSignUnKey.currentState!.validate()) {
                        _login(context);
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
                      'Sign Up',
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
                    'Already have an accound? ',
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (e) => const LoginPage(),
                        ),
                        (route) => false,
                      );
                    },
                    child: const Text(
                      'Login',
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
          "Get Started",
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
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    // TODO: Add backend logic for login authentication here.

    if (email.isNotEmpty && password.isNotEmpty && name.isNotEmpty) {
      if (selectedRole == 'Donor') {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => CompleteDonorProfile()),
          (route) => false,
        );
      } else if (selectedRole == 'NGO') {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => CompleteNGOProfile()),
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
