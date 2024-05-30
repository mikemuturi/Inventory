// import 'package:mongo_dart/mongo_dart.dart';

// void main(List<String> arguments) async {
//   final db = Db(
//       'mongodb+srv://Mike:12345@dart.gsx83ml.mongodb.net/?retryWrites=true&w=majority&appName=Dart');

//   try {
//     await db.open();
//     print('Connected to the database');
//     // Your further database operations can go here
//   } catch (e) {
//     print('Error connecting to the database: $e');
//   } finally {
//     await db.close();
//   }
// }

import 'package:mongo_dart/mongo_dart.dart';

void main(List<String> arguments) async {
  // Replace the connection string with your MongoDB URI
  final db = await Db.create(
      'mongodb+srv://Mike:12345@dart.gsx83ml.mongodb.net/?retryWrites=true&w=majority&appName=Dart');

  try {
    await db.open();
    print('Connected to the database');

    // Your further database operations can go here
    // For example:
    // await performDatabaseOperations(db);
  } catch (e) {
    print('Error connecting to the database: $e');
  } finally {
    await db.close();
  }
}


