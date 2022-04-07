import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  Future<Database> initDB() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'app_database.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, full_name TEXT, email TEXT, password TEXT)',
        );
      },
      version: 1,
    );

    // Open the database and store the reference.
    return database;
  }
}
