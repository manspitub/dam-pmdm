/*class AutoGenerate {
  AutoGenerate({
    required this.Fecha,
    required this.ListaEESSPrecio,
    required this.Nota,
    required this.ResultadoConsulta,
  });
  late final String Fecha;
  late final List<ListaEESSPrecio> ListaEESSPrecio;
  late final String Nota;
  late final String ResultadoConsulta;
  
  AutoGenerate.fromJson(Map<String, dynamic> json){
    Fecha = json['Fecha'];
    ListaEESSPrecio = List.from(json['ListaEESSPrecio']).map((e)=>ListaEESSPrecio.fromJson(e)).toList();
    Nota = json['Nota'];
    ResultadoConsulta = json['ResultadoConsulta'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Fecha'] = Fecha;
    _data['ListaEESSPrecio'] = ListaEESSPrecio.map((e)=>e.toJson()).toList();
    _data['Nota'] = Nota;
    _data['ResultadoConsulta'] = ResultadoConsulta;
    return _data;
  }
}*/