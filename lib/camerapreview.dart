import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key});

  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  File? _image;
  final picker = ImagePicker();

  // Asynchronous function to get an image from the camera
  Future getImage() async {
    // Use the image_picker plugin to get an image from the camera.
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    // The pickedFile can be null if the user cancels the action.
    if (pickedFile != null) {
      setState(() {
        _image = File(
          pickedFile.path,
        ); // Update the UI with the selected image.
      });
    } else {
      // Handle the case where the user cancels taking the picture.  Show a snackbar.
      if (mounted) {
        // Check if the widget is still in the tree.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No image selected.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a Picture')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Display the image if it's available.
            _image == null
                ? const Text('No image selected.')
                : SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.file(
                    _image!,
                    fit:
                        BoxFit
                            .cover, // Ensure the image fits within the container.
                  ),
                ),
            const SizedBox(height: 20),
            // Button to trigger the getImage function.
            ElevatedButton(
              onPressed: getImage,
              child: const Text('Take a Picture'),
            ),
          ],
        ),
      ),
    );
  }
}
