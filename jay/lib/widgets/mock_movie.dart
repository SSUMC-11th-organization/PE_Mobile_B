class Movie {
  const Movie({
    required this.id,
    required this.title,
    required this.genre,
    required this.year,
    required this.posterAsset,
    required this.rating,
    required this.runtime,
    required this.synopsis,
  });
  final int id;
  final String genre;
  final String title;
  final int year;
  final String posterAsset;
  final double rating;
  final int runtime;
  final String synopsis;
}

const genres = ['전체', '드라마', 'SF', '애니메이션', '스릴러'];

const movies = [
  Movie(
    id: 1,
    title: '별빛 아래 우리',
    genre: '드라마',
    year: 2024,
    posterAsset: 'assets/images/posters/hero_under_the_starlight.jpg',
    rating: 4.8,
    runtime: 124,
    synopsis:
        '바쁜 현대 사회 속에서 서로의 존재를 잊고 살아가던 두 남녀가 우연한 계기로 작은 천문대에서 만나게 됩니다. '
        '매일 밤 별을 관측하며 서로의 상처를 치유하고, 잊고 있던 꿈과 사랑을 다시금 깨닫게 되는 따뜻한 이야기입니다.',
  ),
  Movie(
    id: 2,
    title: '우주의 끝에서',
    genre: 'SF',
    year: 2024,
    posterAsset: 'assets/images/posters/poster_echoes_of_the_void.jpg',
    rating: 4.2,
    runtime: 138,
    synopsis: '폐허가 된 행성에 홀로 남은 우주비행사가 정체불명의 신호를 따라 우주의 끝을 향해 나아갑니다.',
  ),
  Movie(
    id: 3,
    title: '기억의 숲',
    genre: '애니메이션',
    year: 2023,
    posterAsset: 'assets/images/posters/poster_whispering_woods.jpg',
    rating: 4.9,
    runtime: 105,
    synopsis: '속삭이는 숲에 들어간 소녀가 잃어버린 기억과 작은 정령들을 만나며 성장하는 이야기입니다.',
  ),
  Movie(
    id: 4,
    title: '밤의 그림자',
    genre: '스릴러',
    year: 2024,
    posterAsset: 'assets/images/posters/poster_night_shadows.jpg',
    rating: 3.8,
    runtime: 117,
    synopsis: '네온사인이 꺼지지 않는 골목에서 연쇄 실종 사건을 쫓는 형사의 긴 밤이 시작됩니다.',
  ),
  Movie(
    id: 5,
    title: '심연을 걷는 자',
    genre: 'SF',
    year: 2022,
    posterAsset: 'assets/images/posters/poster_abyss_walker.jpg',
    rating: 4.0,
    runtime: 129,
    synopsis: '심해 기지에서 발견된 미지의 구조물을 조사하던 탐사대가 예상치 못한 존재와 마주합니다.',
  ),
  Movie(
    id: 6,
    title: '네 번째 오후',
    genre: '드라마',
    year: 2023,
    posterAsset: 'assets/images/posters/poster_fourth_afternoon.jpg',
    rating: 4.3,
    runtime: 98,
    synopsis: '매주 같은 카페에서 마주치는 네 사람의 오후가 조금씩 서로의 삶에 스며듭니다.',
  ),
];

Movie? findMovieById(int? id) {
  for (final movie in movies) {
    if (movie.id == id) return movie;
  }
  return null;
}
