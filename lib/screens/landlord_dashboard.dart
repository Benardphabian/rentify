import 'package:flutter/material.dart';

class LandlordDashboard extends StatelessWidget {
  final String firstName;
  const LandlordDashboard({super.key, required this.firstName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Landlord Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome Landlord $firstName', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ElevatedButton(
              onPressed: () {},
              child: const Text('View Properties'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Manage Tenants'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('View Payments'),
            ),
          ],
        ),
      ),
    );
  }
}
