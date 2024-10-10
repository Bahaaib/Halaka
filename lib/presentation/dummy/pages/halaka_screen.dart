import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HalakaScreen extends StatelessWidget {
  const HalakaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaka Screen'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text('Halaka Screen'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(' User'),
          ),
        ],
      ),
    );
  }
}
