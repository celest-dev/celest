import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_test/firebase_options.dart';
import 'package:firebase_test_client/firebase_test_client.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  celest.init(externalAuth: ExternalAuth.firebase(FirebaseAuth.instance));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Celest + Firebase 🔥',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FirebaseDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FirebaseDemo extends StatefulWidget {
  const FirebaseDemo({super.key});

  @override
  State<FirebaseDemo> createState() => _FirebaseDemoState();
}

class _FirebaseDemoState extends State<FirebaseDemo> {
  String? _currentUser;

  Future<void> _getCurrentUser() async {
    try {
      final user = await celest.functions.auth.currentUser();
      setState(() {
        _currentUser = user.primaryEmail?.email ?? user.userId;
      });
    } on Object catch (e) {
      log('Failed to get current user', error: e);
      setState(() {
        _currentUser = 'Not logged in';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Celest + Firebase 🔥'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Currently logged in as: $_currentUser',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _getCurrentUser,
              child: const Text('Get Current User'),
            ),
          ],
        ),
      ),
    );
  }
}
