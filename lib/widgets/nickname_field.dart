import 'package:flutter/material.dart';

class NicknameField extends StatelessWidget {
  const NicknameField({
    super.key,
    required this.controller,
    required this.nextFocus,
    required this.onChanged,
  });

  final TextEditingController controller;
  final FocusNode nextFocus;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: '닉네임',
        hintText: '두 글자 이상 입력',
      ),
      textInputAction: TextInputAction.next,
      validator: (value) {
        final nickname = value?.trim() ?? '';
        if (nickname.isEmpty) {
          return '닉네임을 입력해주세요.';
        }
        if (nickname.length < 2) {
          return '닉네임은 두 글자 이상 입력해주세요.';
        }
        return null;
      },
      onChanged: onChanged,
      onFieldSubmitted: (_) => nextFocus.requestFocus(),
    );
  }
}
