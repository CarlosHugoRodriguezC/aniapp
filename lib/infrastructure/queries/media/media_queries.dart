class MediaQueries {
  static String homeMediaQuery = r'''
    query (
      $season: MediaSeason
      $seasonYear: Int
      $nextSeason: MediaSeason
      $nextYear: Int
    ) {
      trending: Page(page: 1, perPage: 6) {
        media(sort: TRENDING_DESC, type: ANIME, isAdult: false) {
          ...media
        }
      }
      season: Page(page: 1, perPage: 6) {
        media(
          season: $season
          seasonYear: $seasonYear
          sort: POPULARITY_DESC
          type: ANIME
          isAdult: false
        ) {
          ...media
        }
      }
      nextSeason: Page(page: 1, perPage: 6) {
        media(
          season: $nextSeason
          seasonYear: $nextYear
          sort: POPULARITY_DESC
          type: ANIME
          isAdult: false
        ) {
          ...media
        }
      }
      popular: Page(page: 1, perPage: 6) {
        media(sort: POPULARITY_DESC, type: ANIME, isAdult: false) {
          ...media
        }
      }
      top: Page(page: 1, perPage: 10) {
        media(sort: SCORE_DESC, type: ANIME, isAdult: false) {
          ...media
        }
      }
    }

    
    fragment media on Media {
      id
      title {
        userPreferred
        romaji
        english
        native
      }
      coverImage {
        extraLarge
        large
        color
      }
      startDate {
        year
        month
        day
      }
      endDate {
        year
        month
        day
      }
      bannerImage
      season
      seasonYear
      description
      type
      format
      status(version: 2)
      episodes
      duration
      chapters
      volumes
      genres
      isAdult
      averageScore
      popularity
      mediaListEntry {
        id
        status
      }
      nextAiringEpisode {
        airingAt
        timeUntilAiring
        episode
      }
      studios(isMain: true) {
        edges {
          isMain
          node {
            id
            name
          }
        }
      }
    }

  ''';

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
          trailer {
            thumbnail
            id
            site
          }
          description
          averageScore
          genres

          characters {
            nodes {
              id
              name {
                native
                full
              }
              image {
                large
                medium
              }
              age
              gender
              siteUrl
            }
          }
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
