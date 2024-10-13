import 'package:flutter/material.dart';
import 'package:refood/donar_dashboard.dart';

class CompleteDonorProfile extends StatefulWidget {
  @override
  State<CompleteDonorProfile> createState() => _CompleteDonorProfileState();
}

class _CompleteDonorProfileState extends State<CompleteDonorProfile> {
  String selectedDonorType = 'Individual'; // Default to Individual
  final TextEditingController orgNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController =
      TextEditingController(); // New field for email
  final TextEditingController phoneController =
      TextEditingController(); // New field for phone
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                content(),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(15, 95, 83, 1),
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: DropdownButton<String>(
                    value: selectedDonorType,
                    isExpanded: true,
                    underline: Container(),
                    items: <String>['Individual', 'Organisation']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedDonorType = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                if (selectedDonorType == 'Organisation')
                  TextFormField(
                    controller: orgNameController,
                    validator: (value) {
                      if (selectedDonorType == 'Organisation' &&
                          (value == null || value.isEmpty)) {
                        return 'Please enter Organisation Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Organisation Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: addressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Phone Number';
                    }
                    if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Navigate to DonorDashboard after successful submission
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DonorDashboard()),
                        (route) => false,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    backgroundColor: const Color.fromRGBO(15, 95, 83, 1),
                  ),
                  child: const Text(
                    'Complete',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget content() {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: double.infinity,
          child: Image.asset("assets/image/w61.png", fit: BoxFit.cover),
        ),
        const SizedBox(height: 20),
        const Text(
          "Complete Your Donor Profile",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
      ],
    );
  }
}
