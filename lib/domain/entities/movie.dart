class Movie {
  final int id;
  final String poster;
  final String releaseDate;
  final String title;

  Movie({
    this.id,
    this.poster,
    this.releaseDate,
    this.title
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      poster: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['original_title']
    );
  }
}