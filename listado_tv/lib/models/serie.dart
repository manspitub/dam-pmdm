class SerieResponse {
  SerieResponse({
    required this.adult,
     this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
     this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });
  late final bool adult;
  late final Null backdropPath;
  late final List<dynamic> createdBy;
  late final List<int> episodeRunTime;
  late final String firstAirDate;
  late final List<Genres> genres;
  late final String homepage;
  late final int id;
  late final bool inProduction;
  late final List<String> languages;
  late final String lastAirDate;
  late final LastEpisodeToAir lastEpisodeToAir;
  late final String name;
  late final Null nextEpisodeToAir;
  late final List<Networks> networks;
  late final int numberOfEpisodes;
  late final int numberOfSeasons;
  late final List<String> originCountry;
  late final String originalLanguage;
  late final String originalName;
  late final String overview;
  late final double popularity;
  late final String posterPath;
  late final List<dynamic> productionCompanies;
  late final List<dynamic> productionCountries;
  late final List<Seasons> seasons;
  late final List<SpokenLanguages> spokenLanguages;
  late final String status;
  late final String tagline;
  late final String type;
  late final double voteAverage;
  late final int voteCount;
  
  SerieResponse.fromJson(Map<String, dynamic> json){
    adult = json['adult'];
    backdropPath = null;
    createdBy = List.castFrom<dynamic, dynamic>(json['created_by']);
    episodeRunTime = List.castFrom<dynamic, int>(json['episode_run_time']);
    firstAirDate = json['first_air_date'];
    genres = List.from(json['genres']).map((e)=>Genres.fromJson(e)).toList();
    homepage = json['homepage'];
    id = json['id'];
    inProduction = json['in_production'];
    languages = List.castFrom<dynamic, String>(json['languages']);
    lastAirDate = json['last_air_date'];
    lastEpisodeToAir = LastEpisodeToAir.fromJson(json['last_episode_to_air']);
    name = json['name'];
    nextEpisodeToAir = null;
    networks = List.from(json['networks']).map((e)=>Networks.fromJson(e)).toList();
    numberOfEpisodes = json['number_of_episodes'];
    numberOfSeasons = json['number_of_seasons'];
    originCountry = List.castFrom<dynamic, String>(json['origin_country']);
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    productionCompanies = List.castFrom<dynamic, dynamic>(json['production_companies']);
    productionCountries = List.castFrom<dynamic, dynamic>(json['production_countries']);
    seasons = List.from(json['seasons']).map((e)=>Seasons.fromJson(e)).toList();
    spokenLanguages = List.from(json['spoken_languages']).map((e)=>SpokenLanguages.fromJson(e)).toList();
    status = json['status'];
    tagline = json['tagline'];
    type = json['type'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    _data['backdrop_path'] = backdropPath;
    _data['created_by'] = createdBy;
    _data['episode_run_time'] = episodeRunTime;
    _data['first_air_date'] = firstAirDate;
    _data['genres'] = genres.map((e)=>e.toJson()).toList();
    _data['homepage'] = homepage;
    _data['id'] = id;
    _data['in_production'] = inProduction;
    _data['languages'] = languages;
    _data['last_air_date'] = lastAirDate;
    _data['last_episode_to_air'] = lastEpisodeToAir.toJson();
    _data['name'] = name;
    _data['next_episode_to_air'] = nextEpisodeToAir;
    _data['networks'] = networks.map((e)=>e.toJson()).toList();
    _data['number_of_episodes'] = numberOfEpisodes;
    _data['number_of_seasons'] = numberOfSeasons;
    _data['origin_country'] = originCountry;
    _data['original_language'] = originalLanguage;
    _data['original_name'] = originalName;
    _data['overview'] = overview;
    _data['popularity'] = popularity;
    _data['poster_path'] = posterPath;
    _data['production_companies'] = productionCompanies;
    _data['production_countries'] = productionCountries;
    _data['seasons'] = seasons.map((e)=>e.toJson()).toList();
    _data['spoken_languages'] = spokenLanguages.map((e)=>e.toJson()).toList();
    _data['status'] = status;
    _data['tagline'] = tagline;
    _data['type'] = type;
    _data['vote_average'] = voteAverage;
    _data['vote_count'] = voteCount;
    return _data;
  }
}

class Genres {
  Genres({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;
  
  Genres.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class LastEpisodeToAir {
  LastEpisodeToAir({
    required this.airDate,
    required this.episodeNumber,
    required this.id,
    required this.name,
    required this.overview,
    required this.productionCode,
    required this.seasonNumber,
     this.stillPath,
    required this.voteAverage,
    required this.voteCount,
  });
  late final String airDate;
  late final int episodeNumber;
  late final int id;
  late final String name;
  late final String overview;
  late final String productionCode;
  late final int seasonNumber;
  late final Null stillPath;
  late final int voteAverage;
  late final int voteCount;
  
  LastEpisodeToAir.fromJson(Map<String, dynamic> json){
    airDate = json['air_date'];
    episodeNumber = json['episode_number'];
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    productionCode = json['production_code'];
    seasonNumber = json['season_number'];
    stillPath = null;
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['air_date'] = airDate;
    _data['episode_number'] = episodeNumber;
    _data['id'] = id;
    _data['name'] = name;
    _data['overview'] = overview;
    _data['production_code'] = productionCode;
    _data['season_number'] = seasonNumber;
    _data['still_path'] = stillPath;
    _data['vote_average'] = voteAverage;
    _data['vote_count'] = voteCount;
    return _data;
  }
}

class Networks {
  Networks({
    required this.name,
    required this.id,
    required this.logoPath,
    required this.originCountry,
  });
  late final String name;
  late final int id;
  late final String logoPath;
  late final String originCountry;
  
  Networks.fromJson(Map<String, dynamic> json){
    name = json['name'];
    id = json['id'];
    logoPath = json['logo_path'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['id'] = id;
    _data['logo_path'] = logoPath;
    _data['origin_country'] = originCountry;
    return _data;
  }
}

class Seasons {
  Seasons({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
     this.posterPath,
    required this.seasonNumber,
  });
  late final String airDate;
  late final int episodeCount;
  late final int id;
  late final String name;
  late final String overview;
  late final Null posterPath;
  late final int seasonNumber;
  
  Seasons.fromJson(Map<String, dynamic> json){
    airDate = json['air_date'];
    episodeCount = json['episode_count'];
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    posterPath = null;
    seasonNumber = json['season_number'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['air_date'] = airDate;
    _data['episode_count'] = episodeCount;
    _data['id'] = id;
    _data['name'] = name;
    _data['overview'] = overview;
    _data['poster_path'] = posterPath;
    _data['season_number'] = seasonNumber;
    return _data;
  }
}

class SpokenLanguages {
  SpokenLanguages({
    required this.englishName,
    required this.iso_639_1,
    required this.name,
  });
  late final String englishName;
  late final String iso_639_1;
  late final String name;
  
  SpokenLanguages.fromJson(Map<String, dynamic> json){
    englishName = json['english_name'];
    iso_639_1 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['english_name'] = englishName;
    _data['iso_639_1'] = iso_639_1;
    _data['name'] = name;
    return _data;
  }
}