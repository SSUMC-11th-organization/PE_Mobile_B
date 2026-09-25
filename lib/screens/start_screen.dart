import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 진짜 화면 내용을 담당하는 위젯. "시작 화면"
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold = "화면의 기본 뼈대" — 앱바, 바디, 하단 네비게이션 등을 배치할 수 있는 틀
    // 지금은 body만 씀
    return Scaffold(
      // SafeArea = 상단 노치(카메라 구멍)나 하단 홈 인디케이터 같은
      // 시스템 UI 영역을 피해서 안전한 영역 안에만 내용을 그려줌
      body: SafeArea(
        // Padding = 안쪽 여백. 화면 양옆에 24만큼 여백을 줘서 글자가 화면 끝에 안 붙게 함
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          // Column = 자식 위젯들을 "세로"로 나란히 쌓는 위젯 (가로로 쌓으려면 Row)
          child: Column(
            // 세로축 기준 가운데 정렬. 이거 없으면 요소들이 화면 맨 위에 붙어버림
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon = 아이콘 하나 표시. Icons.movie_outlined는 Flutter가 기본 제공하는 영화 아이콘
              const Icon(
                Icons.movie_outlined,
                size: 72,                  // 아이콘 크기
                color: Colors.deepPurple, // 아이콘 색
              ),
              // SizedBox = 크기만 있고 눈에 안 보이는 빈 상자. 위젯 사이 간격 주는 용도
              const SizedBox(height: 24),
              // Text = 글자 표시
              const Text(
                '영화의 순간을 기록하세요',
                textAlign: TextAlign.center, // 여러 줄일 때 가운데 정렬
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold, // 글자 굵게
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                '보고 싶은 영화부터 나만의 평점까지 한곳에서 관리해요',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey, // 부제목이라 좀 흐린 회색
                ),
              ),
              const SizedBox(height: 32),
              // ElevatedButton = 그림자 있는 기본 버튼
              ElevatedButton(
                // onPressed = 버튼 눌렀을 때 실행할 함수.
                // context.go = 스택을 쌓지 않고 '/register'로 교체 이동 → 회원가입에서 Start로 되돌아갈 수 없음
                onPressed: () => context.go('/register'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  // double.infinity = "가로 폭을 부모가 허용하는 최대까지" → 버튼이 옆으로 꽉 참
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                ),
                child: const Text('시작하기'), // 버튼 안에 들어갈 내용
              ),
            ],
          ),
        ),
      ),
    );
  }
}
