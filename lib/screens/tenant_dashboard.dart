import 'package:flutter/material.dart';

class TenantDashboard extends StatelessWidget {
  final String firstName;
  const TenantDashboard({super.key, required this.firstName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tenant Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome Tenant $firstName', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Pay Rent'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('View Lease Details'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Request Maintenance'),
            ),
          ],
        ),
      ),
    );
  }
}
