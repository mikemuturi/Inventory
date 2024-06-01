import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:product_app/dbHelper/constants.dart';

class MongoDatabase {
  static var db, userCollection;
  static Connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
  }
}
