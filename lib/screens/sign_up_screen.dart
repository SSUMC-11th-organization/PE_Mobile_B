import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/common_app_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nicknameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  bool _agreedToTerms = false;
  bool _obscurePassword = true; // Challenge: 비밀번호 표시/숨김

  @override
  void dispose() {
    _nicknameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  bool get _canSubmit {
    final nickname = _nicknameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    return nickname.length >= 2 &&
      email.contains('@') &&
      password.length>=8 &&
      _agreedToTerms;
  }

  void _onSubmit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid || !_agreedToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('입력값을 다시 확인해주세요.')),
      );
      return;
    }
    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('회원가입이 완료됐어요.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: '회원가입', centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _SignUpFields(
                  nicknameController: _nicknameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  emailFocusNode: _emailFocusNode,
                  passwordFocusNode: _passwordFocusNode,
                  obscurePassword: _obscurePassword,
                  onTogglePasswordVisibility: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                  onChanged: () => setState(() {}),
                ),
                const SizedBox(height: 20),
                _TermsAgreement(
                  value: _agreedToTerms,
                  onChanged: (value) =>
                      setState(() => _agreedToTerms = value ?? false),
                ),
                const SizedBox(height: 24),
                _SignUpButton(enabled: _canSubmit, onPressed: _onSubmit),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 닉네임 · 이메일 · 비밀번호 입력창 묶음.
/// Controller/FocusNode는 State가 소유하고, 이 위젯은 값만 받아 그린다.
class _SignUpFields extends StatelessWidget {
  const _SignUpFields({
    required this.nicknameController,
    required this.emailController,
    required this.passwordController,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    required this.obscurePassword,
    required this.onTogglePasswordVisibility,
    required this.onChanged,
  });

  final TextEditingController nicknameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  final bool obscurePassword;
  final VoidCallback onTogglePasswordVisibility;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: nicknameController,
          decoration: const InputDecoration(
            labelText: '닉네임',
            hintText: '두 글자 이상 입력',
          ),
          textInputAction: TextInputAction.next,
          onChanged: (_) => onChanged(),
          onFieldSubmitted: (_) => emailFocusNode.requestFocus(),
          validator: (value) {
            final nickname = value?.trim() ?? '';
            if (nickname.isEmpty) return '닉네임을 입력해주세요.';
            if (nickname.length<2) return '닉네임은 두 글자 이상 입력해주세요.';
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: emailController,
          focusNode: emailFocusNode,
          decoration: const InputDecoration(labelText: '이메일'),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onChanged: (_) => onChanged(),
          onFieldSubmitted: (_) => passwordFocusNode.requestFocus(),
          validator: (value) {
            final email = value?.trim() ?? '';
            if (email.isEmpty) return '이메일을 입력해주세요.';
            if (!email.contains('@')) return '올바른 이메일 형식이 아니에요.';
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: passwordController,
          focusNode: passwordFocusNode,
          decoration: InputDecoration(
            labelText: '비밀번호',
            hintText: '8자 이상 입력',
            suffixIcon: IconButton(
              icon: Icon(
                obscurePassword ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: onTogglePasswordVisibility,
            ),
          ),
          obscureText: obscurePassword,
          textInputAction: TextInputAction.done,
          onChanged: (_) => onChanged(),
          validator: (value) {
            final password = value?.trim() ?? '';
            if (password.length < 8) return '비밀번호를 8자 이상 입력해주세요.';
            return null;
          },
        ),
      ],
    );
  }
}

class _TermsAgreement extends StatelessWidget {
  const _TermsAgreement({required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: onChanged),
        const Expanded(
          child: Text('필수 약관에 동의합니다', style: AppTextStyles.bodyMedium),
        ),
      ],
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({required this.enabled, required this.onPressed});

  final bool enabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: enabled ? AppColors.violet : AppColors.lightGray,
        foregroundColor: enabled ? AppColors.white : AppColors.gray,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text('가입하기'),
    );
  }
}
