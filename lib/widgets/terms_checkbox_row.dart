import 'package:flutter/material.dart';

class TermsCheckboxRow extends StatelessWidget {
  const TermsCheckboxRow({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: onChanged),
        const Expanded(
          child: Text('(필수) 이용약관에 동의합니다'),
        ),
      ],
    );
  }
}
