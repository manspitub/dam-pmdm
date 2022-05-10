class SeriesResponse {
  SeriesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
  late final int page;
  late final List<Results> results;
  late final int totalPages;
  late final int totalResults;
  
  SeriesResponse.fromJson(Map<String, dynamic> json){
    page = json['page'];
    results = List.from(json['results']).map((e)=>Results.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['page'] = page;
    _data['results'] = results.map((e)=>e.toJson()).toList();
    _data['total_pages'] = totalPages;
    _data['total_results'] = totalResults;
    return _data;
  }
}

class Results {
  Results({
    required this.firstAirDate,
    required this.genreIds,
    required this.id,
    required this.name,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.posterPath,
  });
  late final String firstAirDate;
  late final List<int> genreIds;
  late final int id;
  late final String name;
  late final List<String> originCountry;
  late final String originalLanguage;
  late final String originalName;
  late final String overview;
  late final String posterPath;
  
  Results.fromJson(Map<String, dynamic> json){
    firstAirDate = json['first_air_date'];
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'];
    name = json['name'];
    originCountry = List.castFrom<dynamic, String>(json['origin_country']);
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    posterPath = json['poster_path'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_air_date'] = firstAirDate;
    _data['genre_ids'] = genreIds;
    _data['id'] = id;
    _data['name'] = name;
    _data['origin_country'] = originCountry;
    _data['original_language'] = originalLanguage;
    _data['original_name'] = originalName;
    _data['overview'] = overview;
    _data['poster_path'] = posterPath;
    return _data;
  }
}