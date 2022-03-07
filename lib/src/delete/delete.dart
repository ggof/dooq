library dooq.delete;

import '../serializable.dart';
import '../table.dart';
import '../condition.dart';

part 'interfaces.dart';

DeleteWhereStep delete(Table table) {
  return new Delete._(table: table);
}

class Delete implements DeleteWhereStep {
  final Table table;
  final Condition? whereCondition;

  Delete._({required this.table, this.whereCondition});

  Delete _update({Table? table, Condition? whereCondition}) {
    return new Delete._(
        table: table ?? this.table,
        whereCondition: whereCondition ?? this.whereCondition);
  }

  String toSql() {
    var sql = "DELETE FROM ${table.toSql()}";
    if (whereCondition != null) {
      sql += " WHERE ${whereCondition?.toSql()}";
    }
    return sql;
  }

  DeleteWhereStep where(Condition condition) => _update(
      whereCondition: (whereCondition != null
          ? whereCondition!.and(condition)
          : condition));
}

abstract class DeleteStep extends Serializable {

}