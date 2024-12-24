import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('articles.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE articles (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        author_name TEXT NOT NULL,
        author_description TEXT NOT NULL,
        content TEXT NOT NULL
      )
    ''');

    await db.insert('articles', {
      'title': 'Judul 1',
      'author_name': 'Lele',
      'author_description': 'Deskripsi singkat tentang penulis Lele',
      'content': 'Konten artikel untuk Judul 1...'
    });
    // Tambahkan data contoh lainnya sesuai kebutuhan.
  }

  Future<List<Map<String, dynamic>>> getArticles() async {
    final db = await instance.database;
    return await db.query('articles');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
