class MediaQueries {
  static String getMediaPageQuery(int page, int perPage) {
    return '''
      query {
        Page(page: $page, perPage: $perPage) {
          media(status: RELEASING, type: ANIME, sort: POPULARITY_DESC) {
            id
            title {
              romaji
              english
            }
            coverImage {
              color
              large
              medium
              extraLarge
            }
            bannerImage
            description
            averageScore
          }
        }
      }
    ''';
  }
}
