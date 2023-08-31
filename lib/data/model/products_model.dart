/// products : [{"id":61,"title":"Leather Straps Wristwatch","price":120},{"id":62,"title":"Waterproof Leather Brand Watch","price":46},{"id":63,"title":"Royal Blue Premium Watch","price":50},{"id":64,"title":"Leather Strap Skeleton Watch","price":46},{"id":65,"title":"Stainless Steel Wrist Watch","price":47},{"id":66,"title":"Steel Analog Couple Watches","price":35},{"id":67,"title":"Fashion Magnetic Wrist Watch","price":60},{"id":68,"title":"Stylish Luxury Digital Watch","price":57},{"id":69,"title":"Golden Watch Pearls Bracelet Watch","price":47},{"id":70,"title":"Stainless Steel Women","price":35}]
/// total : 100
/// skip : 60
/// limit : 10

class ProductsModel {
  ProductsModel({
      this.products, 
      this.total, 
      this.skip, 
      this.limit,});

  ProductsModel.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
  List<Products>? products;
  num? total;
  num? skip;
  num? limit;
ProductsModel copyWith({  List<Products>? products,
  num? total,
  num? skip,
  num? limit,
}) => ProductsModel(  products: products ?? this.products,
  total: total ?? this.total,
  skip: skip ?? this.skip,
  limit: limit ?? this.limit,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['skip'] = skip;
    map['limit'] = limit;
    return map;
  }

}

/// id : 61
/// title : "Leather Straps Wristwatch"
/// price : 120

class Products {
  Products({
      this.id, 
      this.title, 
      this.price,});

  Products.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
  }
  num? id;
  String? title;
  num? price;
Products copyWith({  num? id,
  String? title,
  num? price,
}) => Products(  id: id ?? this.id,
  title: title ?? this.title,
  price: price ?? this.price,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['price'] = price;
    return map;
  }

}