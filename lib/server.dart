// import 'package:mongo_dart/mongo_dart.dart';

// Future<void> main(List<String> arguments) async {
//   final db = await Db.create(
//       'mongodb+srv://Mike:12345@dart.gsx83ml.mongodb.net/testdb?retryWrites=true&w=majority&appName=Dart');
//       // mongodb+srv://Mike:12345@dart.gsx83ml.mongodb.net/testdb?retryWrites=true&w=majority&appName=Dart

//   try {
//     await db.open();
//     print('Connected to the database');

//     final productsCollection = db.collection('products');

//     // Insert a product
//     await insertProduct(productsCollection, {'name': 'Pen'});

//     await insertProduct(productsCollection, {'name': 'Laptop'});

//     // Update a product
//     await updateProduct(productsCollection, 'Pen', {'name': 'Updated Pen'});

//     // Fetch all products
//     await fetchAllProducts(productsCollection);

//     // Delete a product
//     await deleteProduct(productsCollection, 'Updated Pen');

//     // Fetch all products after deletion
//     await fetchAllProducts(productsCollection);
//   } catch (e) {
//     print('Error connecting to the database: $e');
//   } finally {
//     await db.close();
//   }
// }

// Future<void> insertProduct(
//     DbCollection collection, Map<String, dynamic> product) async {
//   var result = await collection.insertOne(product);
//   if (result.isSuccess) {
//     print('Product inserted successfully');
//   } else {
//     print('Failed to insert product');
//   }
// }

// Future<void> updateProduct(DbCollection collection, String oldName,
//     Map<String, dynamic> updatedProduct) async {
//   var result = await collection.updateOne(
//     where.eq('name', oldName),
//     ModifierBuilder().set('name', updatedProduct['name']),
//   );
//   if (result.isSuccess) {
//     print('Product updated successfully');
//   } else {
//     print('Failed to update product');
//   }
// }

// Future<void> deleteProduct(DbCollection collection, String name) async {
//   var result = await collection.deleteOne(where.eq('name', name));
//   if (result.isSuccess) {
//     print('Product deleted successfully');
//   } else {
//     print('Failed to delete product');
//   }
// }

// Future<void> fetchAllProducts(DbCollection collection) async {
//   final products = await collection.find().toList();
//   print('Fetched products:');
//   for (var product in products) {
//     print(product);
//   }
// }
