
class SerieVideos {
  SerieVideos({
    required this.id,
    required this.results,
  });
  late final int id;
  late final List<dynamic> results;
  
  SerieVideos.fromJson(Map<String, dynamic> json){
    id = json['id'];
    results = List.castFrom<dynamic, dynamic>(json['results']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['results'] = results;
    return _data;
  }
}