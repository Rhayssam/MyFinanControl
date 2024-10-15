import 'package:finan_control/app/core/database/migrations/migration.dart';
import 'package:sqflite_common/sqlite_api.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''

    ''');
  }

  @override
  void update(Batch batch) {}
}
