class Movie {
  const Movie({
    required this.id,
    required this.title,
    required this.genre,
    required this.year,
    required this.posterAsset,
    required this.averageRating,
  });

  final int id;
  final String title;
  final String genre;
  final int year;
  final String posterAsset;
  final double averageRating;
}

const movies = [
  Movie(
    id: 1,
    title: '별빛 아래 우리',
    genre: '드라마',
    year: 2024,
    posterAsset: 'assets/images/movie_1.png',
    averageRating: 4.5,
  ),
  Movie(
    id: 2,
    title: '우주의 끝에서',
    genre: 'SF',
    year: 2024,
    posterAsset: 'assets/images/movie_2.png',
    averageRating: 4.2,
  ),
  Movie(
    id: 3,
    title: '웃음의 발견',
    genre: '코미디',
    year: 2023,
    posterAsset: 'assets/images/movie_3.png',
    averageRating: 3.8,
  ),
  Movie(
    id: 4,
    title: '마지막 추격',
    genre: '액션',
    year: 2023,
    posterAsset: 'assets/images/movie_4.png',
    averageRating: 4.0,
  ),
  Movie(
    id: 5,
    title: '기억의 조각들',
    genre: '드라마',
    year: 2022,
    posterAsset: 'assets/images/movie_5.png',
    averageRating: 4.7,
  ),
  Movie(
    id: 6,
    title: '은하수 저편',
    genre: 'SF',
    year: 2025,
    posterAsset: 'assets/images/movie_6.png',
    averageRating: 4.1,
  ),
];

Movie? findMovieById(int? id) {
  for (final movie in movies) {
    if (movie.id == id) return movie;
  }
  return null;
}
