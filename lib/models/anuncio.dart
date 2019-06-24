class Anuncio {
  final id;
  final idLoja;
  final idProduto;
  final nomeLoja;
  final descricao;
  final preco;

  Anuncio({this.id, this.idLoja, this.idProduto, this.nomeLoja, this.descricao, this.preco});

  factory Anuncio.fromJson(Map<String, dynamic> json) {
    final chave = json.keys.first;
    return Anuncio(
        id: chave,
        idLoja: json[chave]['idLoja'],
        idProduto: json[chave]['idProduto'],
        nomeLoja: json[chave]['nomeLoja'],
        descricao: json[chave]['descricao'],
        preco: json[chave]['preco']);
  }

  Map<String, dynamic> toMap() {
    return {
      id: {
        'idLoja': idLoja,
        'idProduto': idProduto,
        'nomeLoja': nomeLoja,
        'descricao': descricao,
        'preco': preco
      }
    };
  }
}
