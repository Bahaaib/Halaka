import 'package:flutter/material.dart';

class HalakaScreen extends StatelessWidget {
  const HalakaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaka Screen'),
      ),
      body: const Center(
        child: Text('Halaka Screen'),
      ),
    );
  }
}
