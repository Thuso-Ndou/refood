import 'package:flutter/material.dart';

class DonorDashboard extends StatelessWidget {
  const DonorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donor Dashboard'),
        backgroundColor: const Color.fromRGBO(15, 95, 83, 25),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome, Donor!'),
            ElevatedButton(
              onPressed: () {
                // Logic for creating a food donation
              },
              child: const Text('Create Donation'),
            ),
            ElevatedButton(
              onPressed: () {
                // Logic for viewing donation history
              },
              child: const Text('View Donation History'),
            ),
          ],
        ),
      ),
    );
  }
}
