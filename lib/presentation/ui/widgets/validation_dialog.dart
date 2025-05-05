import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ValidationDialog extends StatelessWidget {
  const ValidationDialog({
    required this.title,
    required this.description,
    super.key,
  });

  final String title;
  final String description;

  static void show({
    required BuildContext context,
    required String title,
    required String description,
  }) {
    showDialog(
      context: context,
      builder: (context) => ValidationDialog(
        title: title,
        description: description,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget dialogContent = AlertDialog.adaptive(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        description,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'LOGIN.DIALOG.BUTTON.CLOSE'.tr(),
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );

    if (kIsWeb) {
      return Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 400,
          ),
          child: dialogContent,
        ),
      );
    }

    return dialogContent;
  }
}