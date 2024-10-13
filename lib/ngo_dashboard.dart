import 'package:flutter/material.dart';

class RecipientDashboard extends StatelessWidget {
  const RecipientDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipient Dashboard'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome, Recipient!'),
            ElevatedButton(
              onPressed: () {
                // Logic for browsing available food donations
              },
              child: const Text('Browse Donations'),
            ),
            ElevatedButton(
              onPressed: () {
                // Logic for viewing previous requests
              },
              child: const Text('View My Requests'),
            ),
          ],
        ),
      ),
    );
  }
}
