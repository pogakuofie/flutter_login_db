import 'package:login_db/user.dart';
import 'package:sqflite/sqflite.dart';

class DBOperations {
  final Database _database;

  DBOperations(this._database);

  Future<void> insertRecord(String fullName, String email, password) async {
    Map<String, Object> userMap = {
      "id": DateTime.now().millisecond,
      "full_name": fullName,
      "email": email,
      "password": password
    };

    await _database.insert(
      'users',
      userMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, Object>> users(email) async {
    final List<Map<String, dynamic>> maps = await _database.query('users');

    String dbEmail = "";

    List.generate(maps.length, (i) {
      if (maps[i]["email"] == email) {
        dbEmail = maps[i]["email"];
      }
    });

    return {"dbEmail": dbEmail, "length": maps.length};
  }
}
