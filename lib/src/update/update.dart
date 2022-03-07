library dooq.update;

import 'package:dooq/src/column.dart';
import 'package:dooq/src/condition.dart';
import 'package:dooq/src/serializable.dart';
import 'package:dooq/src/table.dart';

part 'interfaces.dart';

UpdateFirstSet update(Table table) => UpdateStatement._(table);

class UpdateStatement with Serializable implements UpdateFirstSet, UpdateMoreSet, UpdateWhere {
  final Table table;
  final List<Condition> sets = [];
  Condition? whereCondition = null;

  UpdateStatement._(this.table);

  @override
  UpdateMoreSet setField<T>(Column<T> field, Column<T> other) {
    sets.add(EqualFieldCondition(field, other));
    return this;
  }

  @override
  UpdateMoreSet setValue<T>(Column<T> field, T object) {
    sets.add(EqualObjectCondition(field, object));
    return this;
  }

  UpdateWhere where(Condition condition) {
    whereCondition = condition;
    return this;
  }

  @override
  String toSql() {
    final sql = <String>[];
    sql.add("UPDATE ${table.toSql()}");
    sql.add("SET");

    sql.add(sets.join(",\n"));

    if (whereCondition != null) {
      sql.add("WHERE ($whereCondition)");
    }
    return sql.join("\n") + ";";
  }
}
