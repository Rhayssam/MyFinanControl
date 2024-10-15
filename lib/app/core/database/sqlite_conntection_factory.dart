import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

class SqliteConntectionFactory {
  //* Versão e nome do banco de dados
  static const _VERSION = 1;
  static const _DATABASE_NAME = 'MY_FINAN_CONTROL';

  static SqliteConntectionFactory? _instance;

  Database? _db;
  final _lock = Lock();

  SqliteConntectionFactory._();

  //* Abrir apenas uma conexão com o SQLITE
  factory SqliteConntectionFactory() {
    if (_instance == null) {
      _instance = SqliteConntectionFactory._();
    }
    return _instance!;
  }

  //* Abrir conexão
  Future<Database> openConnection() async {
    var databasePath = await getDatabasesPath();
    var databasePathFinal = join(databasePath, _DATABASE_NAME);

    if (_db == null) {
      await _lock.synchronized(() async {
        if (_db == null) {
          _db = await openDatabase(databasePathFinal,
              version: _VERSION,
              onConfigure: _onConfigure,
              onCreate: _onCreate,
              onUpgrade: _onUpgrade,
              onDowngrade: _onDowngrade);
        }
      });
    }
    return _db!;
  }

  //* Fechar conexão
  void closeConnection() {
    _db?.close();
    _db == null;
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> _onCreate(Database db, int version) async {}
  Future<void> _onUpgrade(Database db, int oldVersion, int version) async {}
  Future<void> _onDowngrade(Database db, int oldVersion, int version) async {}
}
