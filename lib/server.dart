import 'package:mongo_dart/mongo_dart.dart';

main(List<String> arguements) async {
  Db db = await Db.create(
      'mongodb+srv://Mike:Mike_1234@dart.gsx83ml.mongodb.net/?retryWrites=true&w=majority&appName=Dart');
  await db.open();
  print('connected to database');
}
