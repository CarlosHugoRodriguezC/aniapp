class MediaQueries {
  static String getPopularMediaOfYear({required int year}) {
    return '''
      query seasonPopular {
        Media(seasonYear: $year, sort: POPULARITY_DESC) {
          id
          title {
            romaji
            english
            native
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
    ''';
  }

  static String getMediaPageQuery(int page, int perPage) {
    return '''
      query {
        Page(page: $page, perPage: $perPage) {
          media(status: RELEASING, seasonYear: 2024, type: ANIME, sort: POPULARITY_DESC) {
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

  static String getMediaPageTrendingQuery(int page, int perPage) {
    return '''
      query  {
        Page(page: $page, perPage: $perPage) {
          mediaTrends {
            mediaId
            episode
            trending
            releasing
            averageScore
            date
            media {
              id
              title {
                romaji
                english
                native
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
              genres
            }
          }
        }
      }
    ''';
  }
}
