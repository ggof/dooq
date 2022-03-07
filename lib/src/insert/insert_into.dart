library dooq.insert;

import 'package:dooq/utils.dart';
import 'package:dooq/src/column.dart';
import 'package:dooq/src/serializable.dart';
import 'package:dooq/src/table.dart';

part 'interfaces.dart';

InsertInto insertInto(Table table, List<Column> fields) =>
    InsertStatement._(table, fields);

class InsertStatement with Serializable implements InsertInto, Values {
  final Table intoTable;
  final List<Column> fields;
  final List<List> rows = [];

  InsertStatement._(this.intoTable, this.fields);

  @override
  Values values(List row) {
    rows.add(row);
    return this;
  }

  @override
  Values addAll(List<List> rows) {
    this.rows.addAll(rows);
    return this;
  }

  @override
  String toSql() {
    final sql = <String>[];

    sql.add("INSERT INTO $intoTable");
    sql.add("(${fields.join(", ")})");
    sql.add("VALUES");

    final values = rows.map((row) {
      final value = row
          .map((e) => e is Serializable ? e.toSql() : objectToSql(e))
          .join(', ');

      return "($value)";
    });

    sql.add(values.join(",\n"));
    return sql.join("\n") + ";";
  }
}
