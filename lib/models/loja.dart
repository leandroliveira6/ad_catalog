class Loja{
  final id;
  final nome;
  final imagemUrl;
  final telefones;
  final enderecos;

  Loja({this.id, this.nome, this.imagemUrl, this.telefones, this.enderecos});

  factory Loja.fromJson(Map<String, dynamic> json){
    final chave = json.keys.first;
    return Loja(id: chave, nome: json[chave]['nome'], imagemUrl: json[chave]['imagemUrl'], telefones: json[chave]['telefones'], enderecos: json[chave]['enderecos']);
  }

  Map<String, dynamic> toMap(){
    return {
      id: {
        'nome': nome,
        'imagemUrl': imagemUrl,
        'telefones': telefones,
        'enderecos': enderecos,
      }
    };
  }
}