class PopularResponse {
  PopularResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
  late final int page;
  late final List<Popular> results;
  late final int totalPages;
  late final int totalResults;
  
  PopularResponse.fromJson(Map<String, dynamic> json){
    page = json['page'];
    results = List.from(json['results']).map((e)=>Popular.fromJson(e)).toList();
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

class Popular {
  Popular({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownFor,
    required this.name,
    required this.profilePath,
  });
  late final bool adult;
  late final int gender;
  late final int id;
  late final List<KnownFor> knownFor;
  late final String name;
  late final String profilePath;
  
  Popular.fromJson(Map<String, dynamic> json){
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownFor = List.from(json['known_for']).map((e)=>KnownFor.fromJson(e)).toList();
    name = json['name'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    _data['gender'] = gender;
    _data['id'] = id;
    _data['known_for'] = knownFor.map((e)=>e.toJson()).toList();
    _data['name'] = name;
    _data['profile_path'] = profilePath;
    return _data;
  }
}

class KnownFor {
  KnownFor({
    required this.genreIds,
    required this.id,

    required this.voteCount,
  });
  late final List<int> genreIds;
  late final int id;

  late final int voteCount;
  
  KnownFor.fromJson(Map<String, dynamic> json){
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'];

    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['genre_ids'] = genreIds;
    _data['id'] = id;

    _data['vote_count'] = voteCount;
    return _data;
  }
}