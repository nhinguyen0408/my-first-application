import 'package:my_application/models/media.model.dart';
import 'package:my_application/models/variant.model.dart';

class Product {
  int id;
  String title;
  String code;
  String barcode;
  int company;
  num priceSell;
  List<int> media;
  num priceImport;
  bool statusProduct;
  bool statusOnline;
  String description;
  List<Setting> settings;
  int system;
  int account;
  List<Media> mediaData;
  List<Variant> variantData;
  SystemData systemData;
  DateTime createdAt;

  Product({
    required this.id,
    required this.title,
    required this.code,
    required this.barcode,
    required this.company,
    required this.priceSell,
    required this.media,
    required this.priceImport,
    required this.statusProduct,
    required this.statusOnline,
    required this.description,
    required this.settings,
    required this.system,
    required this.account,
    required this.mediaData,
    required this.variantData,
    required this.systemData,
    required this.createdAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    code: json["code"],
    barcode: json["barcode"],
    company: json["company"],
    priceSell: json["price_sell"],
    media: List<int>.from(json["media"].map((x) => x)),
    priceImport: json["price_import"],
    statusProduct: json["status_product"],
    statusOnline: json["status_online"],
    description: json["description"],
    settings: List<Setting>.from(json["settings"].map((x) => Setting.fromJson(x))),
    system: json["system"],
    account: json["account"],
    mediaData: List<Media>.from(json["media_data"].map((x) => Media.fromJson(x))),
    variantData: List<Variant>.from(json["variant_data"].map((x) => Variant.fromJson(x))),
    systemData: SystemData.fromJson(json["system_data"]),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "code": code,
    "barcode": barcode,
    "company": company,
    "price_sell": priceSell,
    "media": List<dynamic>.from(media.map((x) => x)),
    "price_import": priceImport,
    "status_product": statusProduct,
    "status_online": statusOnline,
    "description": description,
    "settings": List<dynamic>.from(settings.map((x) => x.toJson())),
    "system": system,
    "account": account,
    "media_data": List<dynamic>.from(mediaData.map((x) => x.toJson())),
    "variant_data": List<dynamic>.from(variantData.map((x) => x.toJson())),
    "system_data": systemData.toJson(),
    "created_at": createdAt.toIso8601String(),
  };
}

class Setting {
  String title;
  List<String> value;

  Setting({
    required this.title,
    required this.value,
  });

  factory Setting.fromJson(Map<String, dynamic> json) => Setting(
    title: json["title"],
    value: List<String>.from(json["value"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "value": List<dynamic>.from(value.map((x) => x)),
  };
}

class SystemData {
  int id;
  String title;
  String code;

  SystemData({
    required this.id,
    required this.title,
    required this.code,
  });

  factory SystemData.fromJson(Map<String, dynamic> json) => SystemData(
    id: json["id"],
    title: json["title"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "code": code,
  };
}

