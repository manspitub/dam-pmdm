
class SerieImageResponse {
  SerieImageResponse({
    required this.backdrops,
    required this.id,
    required this.logos,
    required this.posters,
  });
  late final List<dynamic> backdrops;
  late final int id;
  late final List<dynamic> logos;
  late final List<dynamic> posters;
  
  SerieImageResponse.fromJson(Map<String, dynamic> json){
    backdrops = List.castFrom<dynamic, dynamic>(json['backdrops']);
    id = json['id'];
    logos = List.castFrom<dynamic, dynamic>(json['logos']);
    posters = List.castFrom<dynamic, dynamic>(json['posters']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['backdrops'] = backdrops;
    _data['id'] = id;
    _data['logos'] = logos;
    _data['posters'] = posters;
    return _data;
  }
}