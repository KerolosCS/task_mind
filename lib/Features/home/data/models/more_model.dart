
class MoreProductsModel {
  final bool status;
  final String msg;
  final List<Datum> data;

  MoreProductsModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory MoreProductsModel.fromJson(Map<String, dynamic> json) =>
      MoreProductsModel(
        status: json["status"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final String id;
  final String name;
  final String shortDesc;
  final String mainImage;
  final String listPrice;
  final String salePrice;
  final String discount;
  final dynamic rating;

  Datum({
    required this.id,
    required this.name,
    required this.shortDesc,
    required this.mainImage,
    required this.listPrice,
    required this.salePrice,
    required this.discount,
    required this.rating,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        shortDesc: json["short_desc"],
        mainImage: json["main_image"],
        listPrice: json["list_price"],
        salePrice: json["sale_price"],
        discount: json["discount"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_desc": shortDesc,
        "main_image": mainImage,
        "list_price": listPrice,
        "sale_price": salePrice,
        "discount": discount,
        "rating": rating,
      };
}
