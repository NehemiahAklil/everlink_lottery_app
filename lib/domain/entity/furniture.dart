import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:everlink_lottery_app/domain/value_objects/furniture_type.dart';

class Furniture {
  Furniture(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.category,
      required this.imageUrl,
      Timestamp? creationTime,
      Timestamp? updateTime}) {
    createdAt = creationTime ?? Timestamp.now();
    updateAt = updateTime ?? Timestamp.now();
  }
  final String id;
  final String name;
  final int price;
  final String description;
  final String imageUrl;
  final FurnitureType category;
  late Timestamp createdAt;
  late Timestamp updateAt;

  factory Furniture.fromFirestore(Map<String, dynamic> firestoreData) {
    return Furniture(
      id: firestoreData['id'],
      name: firestoreData['name'],
      price: firestoreData['price'],
      category: FurnitureType.values
              .asNameMap()
              .keys
              .contains(firestoreData["category"])
          ? FurnitureType.values
              .firstWhere((c) => c.name == firestoreData['category'])
          : FurnitureType.sofa,
      description: firestoreData['description'],
      imageUrl: firestoreData['imageUrl'],
      creationTime: firestoreData['createdAt'],
      updateTime: firestoreData['updateAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'category': category.name,
      'description': description,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
      'updateAt': updateAt,
    };
  }
}
