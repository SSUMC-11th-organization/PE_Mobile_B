// 영화 한 편의 정보를 담는 모델
class Movie {
  const Movie({
    required this.id,
    required this.title,
    required this.genre,
    required this.year,
    required this.posterAsset,
  });

  final int id;
  final String title;
  final String genre;
  final int year;
  final String posterAsset; // 포스터 이미지 asset 경로
}
