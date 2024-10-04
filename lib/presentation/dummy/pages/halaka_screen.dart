import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class User {
  String userId;
  String name;
  int age;
  String email;
  String phone;
  String address;
  String city;
  String country;

  User({
    required this.userId,
    required this.name,
    required this.age,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
    required this.country,
    // Add other fields in the constructor
  });

  // Convert the User object into a Map
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'age': age,
      'email': email,
      'phone': phone,
      'address': address,
      'city': city,
      'country': country,
    };
  }
}

class HalakaScreen extends StatelessWidget {
  const HalakaScreen({super.key});

  void addUserToFirebase(User user) {
    Map<String, dynamic> userMap = user.toJson();
    final databaseRef = FirebaseDatabase.instance.ref();
    databaseRef.child('users/${user.userId}').set(userMap).then((_) {
      print("User added successfully to Firebase.");
    }).catchError((error) {
      print("Failed to add user: $error");
    });
  }

  Future<List<User>> fetchUsers() async {
    final databaseRef = FirebaseDatabase.instance.ref();
    DatabaseEvent event = await databaseRef.child('users').once();
    final DataSnapshot snapshot = event.snapshot;

    List<User> users = [];

    if (snapshot.value == null) {
      return users;
    }

    if (snapshot.exists) {
      Map<String, dynamic> usersData =
          Map<String, dynamic>.from(snapshot.value as Map);
      usersData.forEach((key, value) {
        Map<String, dynamic> userMap = Map<String, dynamic>.from(value);
        User user = User(
          userId: userMap['userId'],
          name: userMap['name'],
          age: userMap['age'],
          email: userMap['email'],
          phone: userMap['phone'],
          address: userMap['address'],
          city: userMap['city'],
          country: userMap['country'],
        );
        users.add(user);
        print(user.name);
      });
    }
    return users;
  }

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
            onPressed: () {
              // User user = User(
              //   userId: '144',
              //   name: 'John Doe',
              //   age: 30,
              //   email: 'W3lQd@example.com',
              //   phone: '02478573',
              //   address: 'manchester',
              //   city: 'manchester',
              //   country: 'england',
              // );
              fetchUsers();
            },
            child: const Text(' User'),
          ),
        ],
      ),
    );
  }
}
