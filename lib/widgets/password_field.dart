import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: const InputDecoration(labelText: '비밀번호'),
      obscureText: true,
      textInputAction: TextInputAction.done,
      validator: (value) {
        final password = value ?? '';
        if (password.isEmpty) {
          return '비밀번호를 입력해주세요.';
        }
        if (password.length < 8) {
          return '비밀번호는 8자 이상 입력해주세요.';
        }
        return null;
      },
      onChanged: onChanged,
      onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
    );
  }
}
