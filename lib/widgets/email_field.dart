import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.nextFocus,
    required this.onChanged,
  });

  static final RegExp pattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode nextFocus;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: const InputDecoration(labelText: '이메일'),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (value) {
        final email = value?.trim() ?? '';
        if (email.isEmpty) {
          return '이메일을 입력해주세요.';
        }
        if (!pattern.hasMatch(email)) {
          return '올바른 이메일 형식이 아니에요.';
        }
        return null;
      },
      onChanged: onChanged,
      onFieldSubmitted: (_) => nextFocus.requestFocus(),
    );
  }
}
