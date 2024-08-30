import 'dart:convert';

class Address {
  String street;
  String city;
  PostalCode postalCode;

  Address({
    required this.street,
    required this.city,
    required this.postalCode,
  });

  factory Address.mapToModel(Map m1) {
    return Address(
      street: m1['street'],
      city: m1['city'],
      postalCode: PostalCode.mapToModel(m1['postalCode']),
    );
  }
}

class PostalCode {
   String code;
   String country;

  PostalCode({
    required this.code,
    required this.country,
  });

  factory PostalCode.mapToModel(Map m1) {
    return PostalCode(
      code: m1['code'],
      country: m1['country'],
    );
  }
}

class Manufacturer {
   String name;
   Address address;

  Manufacturer({
    required this.name,
    required this.address,
  });

  factory Manufacturer.mapToModel(Map m1) {
    return Manufacturer(
      name: m1['name'],
      address: Address.mapToModel(m1['address']),
    );
  }
}

class Specification {
  String weight;
 List<String> color;

  Specification({
    required this.weight,
    required this.color,
  });

  factory Specification.mapToModel(Map m1) {
    return Specification(
      weight: m1['weight'],
      color: List<String>.from(m1['color']),
    );
  }
}

class Feature {
   String type;
   String description;

  Feature({
    required this.type,
    required this.description,
  });

  factory Feature.mapToModel(Map m1) {
    return Feature(
      type: m1['type'],
      description: m1['description'],
    );
  }
}

class Spec {
  String type;
   dynamic value;

  Spec({
    required this.type,
    required this.value,
  });

  factory Spec.mapToModel(Map m1) {
    if (m1['type'] == 'specification') {
      return Spec(
        type: m1['type'],
        value: Specification.mapToModel(m1['value']),
      );
    } else {
      return Spec(
        type: m1['type'],
        value: Feature.mapToModel(m1['value']),
      );
    }
  }
}

class Review {
   String user;
  double rating;
   String comment;

  Review({
    required this.user,
    required this.rating,
    required this.comment,
  });

  factory Review.mapToModel(Map m1) {
    return Review(
      user: m1['user'],
      rating: m1['rating'].toDouble(),
      comment: m1['comment'],
    );
  }
}

class DynamicFields {
  String customField1;
  Map<String, String> customField2;

  DynamicFields({
    required this.customField1,
    required this.customField2,
  });

  factory DynamicFields.mapToModel(Map m1) {
    return DynamicFields(
      customField1: m1['customField1'],
      customField2: Map<String, String>.from(m1['customField2']),
    );
  }
}

class Product {
   String id;
   String name;
  Details details;
   Price price;
   bool availability;
  List<Review> reviews;
   DynamicFields dynamicFields;

  Product({
    required this.id,
    required this.name,
    required this.details,
    required this.price,
    required this.availability,
    required this.reviews,
    required this.dynamicFields,
  });

  factory Product.mapToModel(Map m1) {
    return Product(
      id: m1['id'],
      name: m1['name'],
      details: Details.mapToModel(m1['details']),
      price: Price.mapToModel(m1['price']),
      availability: m1['availability'],
      reviews:
          (m1['reviews'] as List).map((i) => Review.mapToModel(i)).toList(),
      dynamicFields: DynamicFields.mapToModel(m1['dynamicFields']),
    );
  }
}

class Details {
   List<Spec> specs;
  Manufacturer manufacturer;

  Details({
    required this.specs,
    required this.manufacturer,
  });

  factory Details.mapToModel(Map m1) {
    return Details(
      specs: (m1['specs'] as List).map((i) => Spec.mapToModel(i)).toList(),
      manufacturer: Manufacturer.mapToModel(m1['manufacturer']),
    );
  }
}

class Price {
   double amount;
   String currency;

  Price({
    required this.amount,
    required this.currency,
  });

  factory Price.mapToModel(Map m1) {
    return Price(
      amount: m1['amount'].toDouble(),
      currency: m1['currency'],
    );
  }
}
