class AutoGenerate {
  AutoGenerate({
    required this.get,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
    required this.response,
  });
  late final String get;
  late final Parameters parameters;
  late final List<dynamic> errors;
  late final int results;
  late final Paging paging;
  late final List<Response> response;
  
  AutoGenerate.fromJson(Map<String, dynamic> json){
    get = json['get'];
    parameters = Parameters.fromJson(json['parameters']);
    errors = List.castFrom<dynamic, dynamic>(json['errors']);
    results = json['results'];
    paging = Paging.fromJson(json['paging']);
    response = List.from(json['response']).map((e)=>Response.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['get'] = get;
    _data['parameters'] = parameters.toJson();
    _data['errors'] = errors;
    _data['results'] = results;
    _data['paging'] = paging.toJson();
    _data['response'] = response.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Parameters {
  Parameters({
    required this.league,
    required this.season,
  });
  late final String league;
  late final String season;
  
  Parameters.fromJson(Map<String, dynamic> json){
    league = json['league'];
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['league'] = league;
    _data['season'] = season;
    return _data;
  }
}

class Paging {
  Paging({
    required this.current,
    required this.total,
  });
  late final int current;
  late final int total;
  
  Paging.fromJson(Map<String, dynamic> json){
    current = json['current'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['current'] = current;
    _data['total'] = total;
    return _data;
  }
}

class Response {
  Response({
    required this.player,
    required this.statistics,
  });
  late final Player player;
  late final List<Statistics> statistics;
  
  Response.fromJson(Map<String, dynamic> json){
    player = Player.fromJson(json['player']);
    statistics = List.from(json['statistics']).map((e)=>Statistics.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['player'] = player.toJson();
    _data['statistics'] = statistics.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Player {
  Player({
    required this.id,
    required this.name,
    required this.firstname,
    required this.lastname,
    required this.age,
    required this.birth,
    required this.nationality,
     this.height,
     this.weight,
    required this.injured,
    required this.photo,
  });
  late final int id;
  late final String name;
  late final String firstname;
  late final String lastname;
  late final int age;
  late final Birth birth;
  late final String nationality;
  late final String? height;
  late final String? weight;
  late final bool injured;
  late final String photo;
  
  Player.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    age = json['age'];
    birth = Birth.fromJson(json['birth']);
    nationality = json['nationality'];
    height = null;
    weight = null;
    injured = json['injured'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['firstname'] = firstname;
    _data['lastname'] = lastname;
    _data['age'] = age;
    _data['birth'] = birth.toJson();
    _data['nationality'] = nationality;
    _data['height'] = height;
    _data['weight'] = weight;
    _data['injured'] = injured;
    _data['photo'] = photo;
    return _data;
  }
}

class Birth {
  Birth({
    required this.date,
     this.place,
    required this.country,
  });
  late final String date;
  late final String? place;
  late final String country;
  
  Birth.fromJson(Map<String, dynamic> json){
    date = json['date'];
    place = null;
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['date'] = date;
    _data['place'] = place;
    _data['country'] = country;
    return _data;
  }
}

class Statistics {
  Statistics({
    required this.team,
    required this.league,
    required this.games,
    required this.shots,
    required this.goals,
    required this.passes,
    required this.tackles,
    required this.duels,
    required this.dribbles,
    required this.fouls,
    required this.cards,
    required this.penalty,
  });
  late final Team team;
  late final League league;
  late final Games games;
  late final Shots shots;
  late final Goals goals;
  late final Passes passes;
  late final Tackles tackles;
  late final Duels duels;
  late final Dribbles dribbles;
  late final Fouls fouls;
  late final Cards cards;
  late final Penalty penalty;
  
  Statistics.fromJson(Map<String, dynamic> json){
    team = Team.fromJson(json['team']);
    league = League.fromJson(json['league']);
    games = Games.fromJson(json['games']);
    shots = Shots.fromJson(json['shots']);
    goals = Goals.fromJson(json['goals']);
    passes = Passes.fromJson(json['passes']);
    tackles = Tackles.fromJson(json['tackles']);
    duels = Duels.fromJson(json['duels']);
    dribbles = Dribbles.fromJson(json['dribbles']);
    fouls = Fouls.fromJson(json['fouls']);
    cards = Cards.fromJson(json['cards']);
    penalty = Penalty.fromJson(json['penalty']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['team'] = team.toJson();
    _data['league'] = league.toJson();
    _data['games'] = games.toJson();
    _data['shots'] = shots.toJson();
    _data['goals'] = goals.toJson();
    _data['passes'] = passes.toJson();
    _data['tackles'] = tackles.toJson();
    _data['duels'] = duels.toJson();
    _data['dribbles'] = dribbles.toJson();
    _data['fouls'] = fouls.toJson();
    _data['cards'] = cards.toJson();
    _data['penalty'] = penalty.toJson();
    return _data;
  }
}

class Team {
  Team({
    required this.id,
    required this.name,
    required this.logo,
  });
  late final int id;
  late final String name;
  late final String logo;
  
  Team.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['logo'] = logo;
    return _data;
  }
}

class League {
  League({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.flag,
    required this.season,
  });
  late final int id;
  late final String name;
  late final String country;
  late final String logo;
  late final String flag;
  late final int season;
  
  League.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    country = json['country'];
    logo = json['logo'];
    flag = json['flag'];
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['country'] = country;
    _data['logo'] = logo;
    _data['flag'] = flag;
    _data['season'] = season;
    return _data;
  }
}

class Games {
  Games({
     this.appearences,
     this.lineups,
     this.minutes,
     this.number,
    required this.position,
     this.rating,
    required this.captain,
  });
  late final int? appearences;
  late final int? lineups;
  late final int? minutes;
  late final Null number;
  late final String position;
  late final String? rating;
  late final bool captain;
  
  Games.fromJson(Map<String, dynamic> json){
    appearences = null;
    lineups = null;
    minutes = null;
    number = null;
    position = json['position'];
    rating = null;
    captain = json['captain'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['appearences'] = appearences;
    _data['lineups'] = lineups;
    _data['minutes'] = minutes;
    _data['number'] = number;
    _data['position'] = position;
    _data['rating'] = rating;
    _data['captain'] = captain;
    return _data;
  }
}



class Shots {
  Shots({
     this.total,
     this.on,
  });
  late final int? total;
  late final int? on;
  
  Shots.fromJson(Map<String, dynamic> json){
    total = null;
    on = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['on'] = on;
    return _data;
  }
}

class Goals {
  Goals({
     this.total,
     this.conceded,
     this.assists,
     this.saves,
  });
  late final int? total;
  late final int? conceded;
  late final int? assists;
  late final Null saves;
  
  Goals.fromJson(Map<String, dynamic> json){
    total = null;
    conceded = null;
    assists = null;
    saves = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['conceded'] = conceded;
    _data['assists'] = assists;
    _data['saves'] = saves;
    return _data;
  }
}

class Passes {
  Passes({
     this.total,
     this.key,
     this.accuracy,
  });
  late final int? total;
  late final int? key;
  late final int? accuracy;
  
  Passes.fromJson(Map<String, dynamic> json){
    total = null;
    key = null;
    accuracy = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['key'] = key;
    _data['accuracy'] = accuracy;
    return _data;
  }
}

class Tackles {
  Tackles({
     this.total,
     this.blocks,
     this.interceptions,
  });
  late final int? total;
  late final int? blocks;
  late final int? interceptions;
  
  Tackles.fromJson(Map<String, dynamic> json){
    total = null;
    blocks = null;
    interceptions = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['blocks'] = blocks;
    _data['interceptions'] = interceptions;
    return _data;
  }
}

class Duels {
  Duels({
     this.total,
     this.won,
  });
  late final int? total;
  late final int? won;
  
  Duels.fromJson(Map<String, dynamic> json){
    total = null;
    won = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['won'] = won;
    return _data;
  }
}

class Dribbles {
  Dribbles({
     this.attempts,
     this.success,
     this.past,
  });
  late final int? attempts;
  late final int? success;
  late final Null past;
  
  Dribbles.fromJson(Map<String, dynamic> json){
    attempts = null;
    success = null;
    past = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['attempts'] = attempts;
    _data['success'] = success;
    _data['past'] = past;
    return _data;
  }
}

class Fouls {
  Fouls({
     this.drawn,
     this.committed,
  });
  late final int? drawn;
  late final int? committed;
  
  Fouls.fromJson(Map<String, dynamic> json){
    drawn = null;
    committed = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['drawn'] = drawn;
    _data['committed'] = committed;
    return _data;
  }
}

class Cards {
  Cards({
     this.yellow,
     this.yellowred,
     this.red,
  });
  late final int? yellow;
  late final int? yellowred;
  late final int? red;
  
  Cards.fromJson(Map<String, dynamic> json){
    yellow = null;
    yellowred = null;
    red = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['yellow'] = yellow;
    _data['yellowred'] = yellowred;
    _data['red'] = red;
    return _data;
  }
}

class Penalty {
  Penalty({
     this.won,
     this.commited,
     this.scored,
     this.missed,
     this.saved,
  });
  late final Null won;
  late final Null commited;
  late final int? scored;
  late final int? missed;
  late final int? saved;
  
  Penalty.fromJson(Map<String, dynamic> json){
    won = null;
    commited = null;
    scored = null;
    missed = null;
    saved = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['won'] = won;
    _data['commited'] = commited;
    _data['scored'] = scored;
    _data['missed'] = missed;
    _data['saved'] = saved;
    return _data;
  }
}