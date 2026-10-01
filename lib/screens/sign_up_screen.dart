import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/common_app_bar.dart';
import '../widgets/email_field.dart';
import '../widgets/nickname_field.dart';
import '../widgets/password_field.dart';
import '../widgets/sign_up_button.dart';
import '../widgets/terms_checkbox_row.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _agreedToTerms = false;

  @override
  void dispose() {
    _nicknameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool canSubmit = _nicknameController.text.trim().length >= 2 &&
        EmailField.pattern.hasMatch(_emailController.text.trim()) &&
        _passwordController.text.length >= 8 &&
        _agreedToTerms;

    // canPop: false → 안드로이드 백 제스처 등 시스템 뒤로가기를 막음
    return PopScope(
      canPop: false,
      child: Scaffold(
        // onBack을 넘기지 않음 → 회원가입 화면에는 뒤로가기 버튼이 없음
        appBar: const CommonAppBar(title: '회원가입'),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  NicknameField(
                    controller: _nicknameController,
                    nextFocus: _emailFocusNode,
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 16),
                  EmailField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    nextFocus: _passwordFocusNode,
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 16),
                  PasswordField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 16),
                  TermsCheckboxRow(
                    value: _agreedToTerms,
                    onChanged: (value) {
                      setState(() {
                        _agreedToTerms = value ?? false;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  SignUpButton(
                    onPressed: canSubmit
                        ? () {
                            final isValid =
                                _formKey.currentState?.validate() ?? false;
                            if (!isValid) return;
                            FocusScope.of(context).unfocus();
                            context.go('/home');
                          }
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
