import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PickPhotoButton extends StatelessWidget {
  const PickPhotoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final imageProvider = Image.network(
          'https://images.unsplash.com/photo-1720774531704-dff00e791a55?'
          'q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8M'
          'HxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ).image;
        showImageViewer(
          context,
          imageProvider,
          swipeDismissible: true,
          backgroundColor: Colors.black26,
          onViewerDismissed: () {
            if (kDebugMode) {
              print('dismissed');
            }
          },
        );
      },
      child: const Text('Pick Photo'),
    );
  }
}
