import 'package:flutter/material.dart';

class LoadingSpinner extends StatelessWidget {
  final double size;

  const LoadingSpinner({super.key, this.size = 32});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
