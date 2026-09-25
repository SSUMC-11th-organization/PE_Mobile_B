import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 하단 NavigationBar를 가진 탭 껍데기 화면. ShellRoute가 탭 화면을 child로 넣어줌
class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.currentIndex, required this.child});

  final int currentIndex; // 현재 선택된 탭 (0: 홈, 1: 영화, 2: 마이)
  final Widget child; // 현재 경로에 해당하는 탭 화면

  @override
  Widget build(BuildContext context) {
    // canPop: false → 홈/영화/마이 어느 탭에서든 시스템 뒤로가기를 막음
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: child,
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentIndex,
          // 탭 이동은 go → 탭끼리는 스택이 쌓이지 않음
          onDestinationSelected: (index) {
            switch (index) {
              case 0:
                context.go('/home');
              case 1:
                context.go('/movies');
              case 2:
                context.go('/my');
            }
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: '홈',
            ),
            NavigationDestination(
              icon: Icon(Icons.movie_outlined),
              selectedIcon: Icon(Icons.movie),
              label: '영화',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: '마이',
            ),
          ],
        ),
      ),
    );
  }
}
