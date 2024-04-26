class HomeModel {
  final bool status;
  final String msg;
  final Data data;

  HomeModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  final List<Slider> slider;
  final List<Category> categories;
  final List<Product> products;
  final List<Product> selectedProducts;
  final List<Product> newProducts;

  Data({
    required this.slider,
    required this.categories,
    required this.products,
    required this.selectedProducts,
    required this.newProducts,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        slider:
            List<Slider>.from(json["slider"].map((x) => Slider.fromJson(x))),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        selectedProducts: List<Product>.from(
            json["selected_products"].map((x) => Product.fromJson(x))),
        newProducts: List<Product>.from(
            json["new_products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "slider": List<dynamic>.from(slider.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "selected_products":
            List<dynamic>.from(selectedProducts.map((x) => x.toJson())),
        "new_products": List<dynamic>.from(newProducts.map((x) => x.toJson())),
      };
}

class Category {
  final String id;
  final String catName;
  final String icon;

  Category({
    required this.id,
    required this.catName,
    required this.icon,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        catName: json["cat_name"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cat_name": catName,
        "icon": icon,
      };
}

class Product {
  final String id;
  final String name;
  final String shortDesc;
  final String mainImage;
  final String listPrice;
  final String salePrice;
  final String discount;
  final dynamic rating;

  Product({
    required this.id,
    required this.name,
    required this.shortDesc,
    required this.mainImage,
    required this.listPrice,
    required this.salePrice,
    required this.discount,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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

class Slider {
  final String id;
  final String productId;
  final String image;

  Slider({
    required this.id,
    required this.productId,
    required this.image,
  });

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        id: json["id"],
        productId: json["product_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "image": image,
      };
}
