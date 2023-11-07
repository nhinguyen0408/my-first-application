class Variant {
  int? id;
  String? title;
  String? code;
  String? barcode;
  int? company;
  num? priceSell;
  num? priceImport;
  bool? status;
  num? quantity;
  Settings? settings;
  String? image;
  int? product;
  Data? productData;
  int? account;
  DateTime? createdAt;
  List<OptionsData>? optionsData;
  String? productTitle;

  Variant({
    required this.id,
    required this.title,
    required this.code,
    required this.barcode,
    required this.company,
    required this.priceSell,
    required this.priceImport,
    required this.status,
    required this.quantity,
    required this.settings,
    required this.image,
    required this.product,
    required this.productData,
    required this.account,
    required this.createdAt,
    required this.optionsData,
    required this.productTitle,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    id: json["id"],
    title: json["title"],
    code: json["code"],
    barcode: json["barcode"],
    company: json["company"],
    priceSell: json["price_sell"],
    priceImport: json["price_import"],
    status: json["status"],
    quantity: json["quantity"],
    settings: Settings.fromJson(json["settings"]),
    image: json["image"],
    product: json["product"],
    productData: Data.fromJson(json["product_data"]),
    account: json["account"],
    createdAt: DateTime.parse(json["created_at"]),
    optionsData: List<OptionsData>.from(json["options_data"].map((x) => OptionsData.fromJson(x))),
    productTitle: json["product__title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "code": code,
    "barcode": barcode,
    "company": company,
    "price_sell": priceSell,
    "price_import": priceImport,
    "status": status,
    "quantity": quantity,
    "settings": settings?.toJson(),
    "image": image,
    "product": product,
    "product_data": productData?.toJson(),
    "account": account,
    "created_at": createdAt?.toIso8601String(),
    "options_data": optionsData == null ? null : List<dynamic>.from(optionsData!.map((x) => x.toJson())),
    "product__title": productTitle,
  };
}

class Settings {
  Settings();

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
  );

  Map<String, dynamic> toJson() => {
  };
}

class OptionsData {
  int id;
  String title;
  dynamic code;
  String values;
  bool status;

  OptionsData({
    required this.id,
    required this.title,
    required this.code,
    required this.values,
    required this.status,
  });

  factory OptionsData.fromJson(Map<String, dynamic> json) => OptionsData(
    id: json["id"],
    title: json["title"],
    code: json["code"],
    values: json["values"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "code": code,
    "values": values,
    "status": status,
  };
}


class Data {
  int id;
  String title;
  String code;

  Data({
    required this.id,
    required this.title,
    required this.code,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
