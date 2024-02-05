class MediaQueries {
  static String mediaByIdQuery = r'''
      query getMediaById($id: Int) {
        Media(id: $id) {
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
    ''';

  static String popularMediaOfSeasonYearQuery = r'''
      query getPopularMediaOfSeasonYear(
        $year: Int
        $mediaType: MediaType
        $format: MediaFormat
      ) {
        Media(
          sort: POPULARITY_DESC
          seasonYear: $year
          status: RELEASING
          type: $mediaType
          format: $format
        ) {
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
          genres
          bannerImage
          description
          averageScore
        }
      }
    ''';

  static String popularMediaOfYearQuery = r'''
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

  static String pageMediaQuery = r'''
      query pageMediaQuery($page: Int, $perPage: Int, $year: Int) {
        Page(page: $page, perPage: $perPage) {
          media(
            status: RELEASING
            seasonYear: $year
            type: ANIME
            sort: POPULARITY_DESC
          ) {
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

  static String pageMediaTrendingQuery = r'''
      query pageMediaTrending($page: Int, $perPage: Int){
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
