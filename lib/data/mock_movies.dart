import '../models/movie.dart';

// API 연결 전까지 사용할 임시 영화 데이터
const List<Movie> mockMovies = [
  Movie(
    id: 1,
    title: '별빛 아래 우리',
    genre: '드라마',
    year: 2024,
    posterAsset: 'assets/images/movie_1.png',
  ),
  Movie(
    id: 2,
    title: '우주의 끝에서',
    genre: 'SF',
    year: 2024,
    posterAsset: 'assets/images/movie_2.png',
  ),
  Movie(
    id: 3,
    title: '겨울의 기록',
    genre: '로맨스',
    year: 2023,
    posterAsset: 'assets/images/movie_3.png',
  ),
];

// id에 해당하는 영화를 찾아 반환. id가 null이거나 일치하는 영화가 없으면 null
Movie? findMovieById(int? id) {
  if (id == null) return null;
  for (final movie in mockMovies) {
    if (movie.id == id) return movie;
  }
  return null;
}
