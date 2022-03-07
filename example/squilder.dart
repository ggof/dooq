library dooq.example;

import 'package:dooq/dooq.dart';

class _OrderTable extends Table {
  @override
  String toSql() => "orders";

  late final _OrderTableFields _f;

  Column<int> get id => _f.id;

  Column<String> get name => _f.name;

  _OrderTable() {
    _f = _OrderTableFields(this);
  }
}

class _OrderTableFields {
  final Column<int> id;
  final Column<String> name;

  _OrderTableFields(Table table)
      : id = Column(table, "id"),
        name = Column(table, "name");
}

void main() {
  final orders = new _OrderTable();
  final sql = select()
      .from([orders])
      .where(orders.id.eqToObj(5).and(orders.name.like("%blah%")))
      .toSql();

  final where = select().from([orders]).where(orders.id.eqToObj(5));

  final sql2 = select()
      .from([orders])
      .where(orders.id.eqToObj(5).and(orders.name.like("%blah%")))
      .toSql();
  print(where);
  print(sql);
  print(sql2);
}
