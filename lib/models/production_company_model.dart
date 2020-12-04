import 'dart:convert';

class ProductionCompanyModel {
  final int id;
  final String logoPath;
  final String name;
  final String originalCountry;

  ProductionCompanyModel({
    this.id, 
    this.logoPath, 
    this.name, 
    this.originalCountry
  });

  factory ProductionCompanyModel.fromJson(String str) => ProductionCompanyModel.fromMap(json.decode(str));

  factory ProductionCompanyModel.fromMap(Map<String, dynamic> json) => ProductionCompanyModel(
    id: json['id'],
    logoPath: json['logo_path'] == null ? null : json['logo_path'],
    name: json['name'],
    originalCountry: json['origin_country']
  );
}