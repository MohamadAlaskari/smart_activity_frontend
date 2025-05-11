import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME.TITLE'.tr(), style: const TextStyle(fontSize: 28)),
        centerTitle: true,
      ),
    );
  }
}
