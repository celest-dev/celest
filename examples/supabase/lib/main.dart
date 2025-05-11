import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:supabase_client/supabase_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: 'YOUR_SUPABASE_URL',
    anonKey: 'YOUR_SUPABASE_ANON_KEY',
  );
  celest.init(externalAuth: ExternalAuth.supabase(supabase.client.auth));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Celest + Supabase 🚀',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SupabaseDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SupabaseDemo extends StatefulWidget {
  const SupabaseDemo({super.key});

  @override
  State<SupabaseDemo> createState() => _SupabaseDemoState();
}

class _SupabaseDemoState extends State<SupabaseDemo> {
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
        title: const Text('Celest + Supabase 🚀'),
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
