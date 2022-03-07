library dooq.test.support.tables;

import 'package:dooq/dooq.dart';

class _OrderTable extends Table {
  late final _OrderTableFields _f;

  @override
  String toSql() => "orders";

  Column<int> get id => _f.id;

  Column<String> get name => _f.name;

  _OrderTable() {
    _f = _OrderTableFields(this);
  }
}

final orders = _OrderTable();

class _OrderTableFields {
  late final Column<int> id;
  late final Column<String> name;

  _OrderTableFields(Table table) {
    id = Column<int>(table, "id");
    name = Column<String>(table, "name");
  }
}

class _OrderRecipientsTable extends Table {
  late final _OrderRecipientsFields _f;

  Column<int> get id => _f.id;

  Column<String> get name => _f.name;

  Column<int> get orderId => _f.orderId;

  @override
  String toSql() => "order_recipients";

  _OrderRecipientsTable() {
    _f = _OrderRecipientsFields(this);
  }
}

final orderRecipients = _OrderRecipientsTable();

class _OrderRecipientsFields {
  final Column<int> id;
  final Column<String> name;
  final Column<int> orderId;

  Iterable<Column> get all => [id, name, orderId];

  _OrderRecipientsFields(Table table)
      : id = Column(table, "id"),
        name = Column(table, "name"),
        orderId = Column(table, "order_id");
}
