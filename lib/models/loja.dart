class Loja {
  final id;
  final nome;
  final email;
  final imagemUrl;
  final telefones;
  final enderecos;
  final descricao;
  bool vazia;

  Loja({
    this.id,
    this.nome,
    this.email,
    this.imagemUrl,
    this.telefones,
    this.enderecos,
    this.descricao,
    this.vazia = false
  });

  bool estaVazia(){
    return vazia;
  }

  factory Loja.fromJson(Map<String, dynamic> json) {
    final chave = json.keys.first;
    return Loja(
      id: chave,
      nome: json[chave]['nome'],
      email: json[chave]['email'],
      imagemUrl: json[chave]['imagemUrl'],
      telefones: json[chave]['telefones'],
      enderecos: json[chave]['enderecos'],
      descricao: json[chave]['descricao'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      id: {
        'nome': nome,
        'email': email,
        'imagemUrl': imagemUrl,
        'telefones': telefones,
        'enderecos': enderecos,
        'descricao': descricao,
      }
    };
  }
}
