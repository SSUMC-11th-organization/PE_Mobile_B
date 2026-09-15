// flutter/material.dart 안에 MaterialApp, Scaffold, Text, Icon, ElevatedButton 등
// 자주 쓰는 Widget들이 다 들어있어서 이 한 줄로 전부 가져다 씀
import 'package:flutter/material.dart';
import 'theme/app_theme.dart';  
import 'screens/profile_screen.dart';


// 앱이 시작될 때 제일 먼저 실행되는 함수. Dart의 모든 프로그램은 main()에서 시작해
void main() {
  // runApp()에 "가장 바깥쪽 Widget"을 넘겨주면 Flutter가 그걸 화면에 그리기 시작함
  runApp(const MovieLogApp());

  // ↓ Mission 2 (Dart 연습) 확인용 — 앱 화면과는 무관, 콘솔 로그만 찍힘
  printMovieTitles();
  debugPrint(displayName(null));   // → 이름 없음
  debugPrint(displayName('   ')); // → 이름 없음 (공백만 있으니까)
  debugPrint(displayName('지현')); // → 지현
}

// StatelessWidget = "상태(state)가 없는 위젯" = 한번 그려지면 스스로 안 바뀌는 화면
// 지금 이 앱은 버튼 눌러도 숫자가 바뀌거나 하지 않으니까 StatelessWidget으로 충분해
class MovieLogApp extends StatelessWidget {
  const MovieLogApp({super.key}); // 생성자. key는 Flutter가 위젯을 구분하는 이름표 정도로 생각하면 됨

  @override
  // build()는 "이 위젯이 화면에 뭘 그려야 하는지"를 리턴하는 함수
  // BuildContext context는 "지금 이 위젯이 Widget Tree의 어디쯤 있는지"에 대한 정보
  Widget build(BuildContext context) {
    // MaterialApp = 앱 전체의 설정을 담당하는 최상위 껍데기
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 우측 상단에 뜨는 빨간 DEBUG 띠 안 보이게
      title: 'MovieLog', // 브라우저 탭 제목 등에 쓰임
      theme: AppTheme.light,
      home: const ProfileScreen(), // 앱 켰을 때 제일 먼저 보여줄 화면 지정
    );
  }
}

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
                // onPressed = 버튼 눌렀을 때 실행할 함수. 지금은 로그만 찍음(화면 이동 X)
                onPressed: () {
                  debugPrint('시작하기 버튼을 눌렀습니다.');
                },
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

// ──────────────────────────────
// Mission 2. Dart 연습
// ──────────────────────────────

// 영화 한 편의 정보를 담는 설계도(틀) 역할을 하는 Class
class Movie {
  // 생성자. Named Parameter — 이름을 붙여서 값을 넘겨야 함 (Movie(id: 1, title: '기생충'))
  // required = 이 값은 반드시 넣어야 한다는 뜻
  const Movie({required this.id, required this.title});

  // 이 클래스가 가지는 데이터(속성/필드)
  final int id;      // 영화 고유 번호. final = 한번 값 넣으면 다시는 못 바꿈
  final String title; // 영화 제목
}

// 영화 목록을 만들고 제목을 하나씩 출력하는 함수
void printMovieTitles() {
  // <Movie> = "이 List 안에는 Movie 타입만 들어간다"는 타입 지정
  final movies = <Movie>[
    const Movie(id: 1, title: '기생충'),
    const Movie(id: 2, title: '올드보이'),
    const Movie(id: 3, title: '헤어질 결심'),
  ];

  // for-in 반복문. movies 리스트 안의 항목을 하나씩 movie라는 이름으로 꺼내서 반복
  for (final movie in movies) {
    debugPrint(movie.title); // 각 영화의 title 속성만 꺼내서 콘솔에 출력
  }
}

// nullable 닉네임을 안전한 기본값으로 변환하는 함수
String displayName(String? nickname) {
  // nickname?.trim().isNotEmpty == true
  //   ?. = "nickname이 null이 아닐 때만 .trim() 실행, null이면 전체가 null로 건너뜀"
  //   .trim() = 문자열 앞뒤 공백 제거
  //   .isNotEmpty == true = "공백 지운 뒤에도 글자가 남아있으면 true"
  //   (== true로 비교하는 이유: nickname이 null이면 식 전체가 null이 되는데,
  //    null == true는 안전하게 false로 처리되기 때문)
  return nickname?.trim().isNotEmpty == true ? nickname! : '이름 없음';
  //     ↑ 조건이 참이면 nickname! (실제 값 사용) / 거짓이면 '이름 없음' 반환
}