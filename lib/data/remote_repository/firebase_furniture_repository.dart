import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:everlink_lottery_app/domain/entity/furniture.dart';
import 'package:everlink_lottery_app/domain/value_objects/furniture_type.dart';
import 'package:everlink_lottery_app/locator.dart';
import 'package:everlink_lottery_app/utils/nanoid_generator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class FirebaseFurnitureRepository {
  final FirebaseFirestore _firebaseFirestore = locator<FirebaseFirestore>();
  final FirebaseStorage _firebaseStorage = locator<FirebaseStorage>();

  // time limit constant
  static const timeLimit = Duration(seconds: 10);

  Future<Reference> furnitureStorageRef() async {
    return _firebaseStorage.ref('furniture');
  }

  Future<CollectionReference<Object?>> furnitureCollectionRef() async {
    return _firebaseFirestore.collection("furniture");
  }

  Future<void> uploadFurnitureImage(File? photo, Furniture furniture) async {
    if (photo == null) return;
    try {
      final storageRef = await furnitureStorageRef();
      // final ref = storage.ref(destination).child('file/');
      TaskSnapshot taskSnapshot =
          await storageRef.child('/${furniture.id}').putFile(photo);
      // await storageRef.putFile(file);
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      debugPrint(downloadUrl);
      var docRef = await furnitureCollectionRef();
      Furniture newFurniture = Furniture(
        id: furniture.id,
        name: furniture.name,
        price: furniture.price,
        description: furniture.description,
        category: furniture.category,
        imageUrl: downloadUrl,
        creationTime: furniture.createdAt,
        updateTime: furniture.updateAt,
      );
      await docRef.doc(newFurniture.id).update(newFurniture.toMap());
    } on FirebaseException catch (e) {
      print('error occured');
    }
  }

  Future<Either<String, Furniture>> create(
      {required String name,
      required String description,
      required int price,
      required FurnitureType category,
      required String imageUrl}) async {
    bool success = false;
    try {
      var furniture = Furniture(
          id: nanoId(),
          name: name,
          description: description,
          price: price,
          imageUrl: imageUrl,
          category: category);
      var docRef = await furnitureCollectionRef();
      await docRef.doc(furniture.id).set(furniture.toMap());
      return right(furniture);
    } catch (e) {
      debugPrint('Register Error: $e');
      // return left('Register Error: $e');
      return left("Error Adding Furniture");
    }
  }

  Future<Either<String, List<Furniture>>> get() async {
    try {
      var collection = await furnitureCollectionRef();
      var query = await collection.get().timeout(timeLimit);
      var docs = query.docs;

      List<Furniture> furniture = docs.map((doc) {
        return Furniture.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();

      return right(furniture);
    } catch (error) {
      return left(error.toString());
    }
  }

  Future<Either<String, Furniture>> getOne(String id) async {
    try {
      var collection = await furnitureCollectionRef();
      DocumentSnapshot snapshot = await collection.doc(id).get();
      if (snapshot.exists) {
        Furniture user =
            Furniture.fromFirestore(snapshot.data() as Map<String, dynamic>);
        return right(user);
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    return left("Couldn't get furniture");
  }
}
