import 'package:camera/camera.dart';
import 'package:canieatit/camerapreview.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CanIEatItApp());
}

class CanIEatItApp extends StatelessWidget {
  const CanIEatItApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Can I Eat It?',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Can I Eat It???'), centerTitle: true),
      body: const Center(
        child: Column(
          children: [
            // Text('Welcome to Can I Eat It???', style: TextStyle(fontSize: 24)),
            CameraWidget(),
          ],
        ),
      ),
      // Dock a FAB at bottom-center
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // TODO: Hook up camera action
        },
        child: const Icon(Icons.camera_alt),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: SizedBox(height: 50), // space for the FAB
      ),
    );
  }
}
