// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final String? id;
  final String nome;
  final String descricao;
  final String categoria;
  final double preco;
  final double altura;
  final double peso;
  ProductModel({
    this.id,
    required this.nome,
    required this.descricao,
    required this.categoria,
    required this.preco,
    required this.altura,
    required this.peso,
  });

  ProductModel copyWith({
    String? id,
    String? nome,
    String? descricao,
    String? categoria,
    double? preco,
    double? altura,
    double? peso,
  }) {
    return ProductModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      categoria: categoria ?? this.categoria,
      preco: preco ?? this.preco,
      altura: altura ?? this.altura,
      peso: peso ?? this.peso,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'categoria': categoria,
      'preco': preco,
      'altura': altura,
      'peso': peso,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as String : null,
      nome: map['nome'] as String,
      descricao: map['descricao'] as String,
      categoria: map['categoria'] as String,
      preco: map['preco'] as double,
      altura: map['altura'] as double,
      peso: map['peso'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, nome: $nome, descricao: $descricao, categoria: $categoria, preco: $preco, altura: $altura, peso: $peso)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nome == nome &&
        other.descricao == descricao &&
        other.categoria == categoria &&
        other.preco == preco &&
        other.altura == altura &&
        other.peso == peso;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nome.hashCode ^
        descricao.hashCode ^
        categoria.hashCode ^
        preco.hashCode ^
        altura.hashCode ^
        peso.hashCode;
  }
}
