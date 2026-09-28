import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Form 전체 검증에 사용
  final _formKey = GlobalKey<FormState>();

  // 입력값
  final _nicknameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Focus 이동
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  // 약관 동의
  bool _agreedToTerms = false;

  bool get _isNicknameValid => _nicknameController.text.trim().length >= 2;

  @override
  void dispose() {
    _nicknameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  // 입력창 공통 스타일 (상태별 테두리·아이콘)
  InputDecoration _inputDecoration({
    required String hint,
    required bool isValid,
    required bool showStatusIcon,
  }) {
    final colors = Theme.of(context).colorScheme;
    const radius = BorderRadius.all(Radius.circular(12));

    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: const Color(0xFFF3F1EE),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      suffixIcon: !showStatusIcon
          ? null
          : isValid
          ? Icon(Icons.check_circle, color: colors.primary)
          : Icon(Icons.error_outline, color: colors.error),
      enabledBorder: const OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(color: Color(0xFFC9C5C0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(color: colors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(color: colors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(color: colors.error, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입', style: TextStyle(color: colors.primary)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                Text(
                  '환영합니다!\n간단한 정보만 입력하고 시작해보세요.',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyLarge,
                ),
                const SizedBox(height: 48),

                // ── 닉네임 ──
                Text('닉네임', style: textTheme.titleMedium),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _nicknameController,
                  textInputAction: TextInputAction.next,
                  decoration: _inputDecoration(
                    hint: '닉네임을 입력해주세요',
                    isValid: _isNicknameValid,
                    showStatusIcon: _nicknameController.text.isNotEmpty,
                  ),
                  validator: (value) {
                    final nickname = value?.trim() ?? '';
                    if (nickname.isEmpty) return '닉네임을 입력해주세요.';
                    if (nickname.length < 2) return '닉네임은 2자 이상이어야 합니다.';
                    return null;
                  },
                  onChanged: (_) => setState(() {}),
                  onFieldSubmitted: (_) => _emailFocusNode.requestFocus(),
                ),

                // TODO(Required Mission): 이메일, 비밀번호, 약관, 가입 버튼
                const SizedBox(height: 400), // 스크롤 확인용 임시 여백
                // 검증 동작 확인용 임시 버튼 (Required Mission에서 실제 가입 버튼으로 교체)
                ElevatedButton(
                  onPressed: () => _formKey.currentState?.validate(),
                  child: const Text('검증 테스트'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
