enum MovieListType { UPCOMING, POPULAR }

extension MovieListTypeExtension on MovieListType {
  String get name {
    switch (this) {
      case MovieListType.UPCOMING:
        return 'Upcoming';
      case MovieListType.POPULAR:
        return 'Popular';
      default:
        return null;
    }
  }
}
