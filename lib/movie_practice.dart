class Movie {
  final String title;
  final int releaseYear;
  final String? nickname;

  Movie({required this.title, required this.releaseYear, this.nickname});
}

void main() {
  final movies = [
    Movie(title: '기생충', releaseYear: 2019, nickname: '기생'),
    Movie(title: '올드보이', releaseYear: 2003),
    Movie(title: '살인의 추억', releaseYear: 2003, nickname: '살추'),
  ];

  for (final movie in movies) {
    print('${movie.title} (${movie.releaseYear}) - ${movie.nickname ?? '별명 없음'}');
  }
}
