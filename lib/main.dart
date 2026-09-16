import 'package:flutter/material.dart';

void main() {
  runApp(const MovieLogApp());
}

class MovieLogApp extends StatelessWidget {
    const MovieLogApp({super.key});

    @override
    Widget build(BuildContext context){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MovieLog',
        theme: ThemeData(
          useMaterial3: true
        ),
        home: const StartScreen(),
      );
    }
}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const purple = Color(0xFF5B3E8C);
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                'FLUTTER 0주차',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 100),
              const Icon(
                Icons.movie_outlined,
                size: 80,
                color: purple,
                semanticLabel: 'MovieLog 아이콘',
              ),
              const SizedBox(height: 60),
              const Text(
                '영화의 순간을\n기록하세요',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 20),
              const Text(
                '보고 싶은 영화부터 나만의 평점까지\n한곳에서 관리해요',
                style: TextStyle(fontSize: 15, color: Colors.grey, height: 1.4),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text('시작하기', style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

