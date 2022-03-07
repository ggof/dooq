library dooq.select;

import 'package:dooq/src/column.dart';
import 'package:dooq/src/condition.dart';
import 'package:dooq/src/serializable.dart';
import 'package:dooq/src/table.dart';

part 'interfaces.dart';
part 'field_ordering.dart';
part 'join.dart';

Select select([List<Column> fields = const []]) => SelectQuery(fields);

class SelectQuery with Serializable
    implements Select, SelectFrom, SelectWhere, SelectGroupBy, SelectHaving, SelectOrderBy, SelectLimit, SelectOffset {
  List<Table> tables = [];
  final List<Column> fields;
  List<Join> joins = [];
  Condition? _where = null;
  List<Column> _groupBy = [];
  Condition? _having = null;
  List<FieldOrdering> _orderBy = [];
  int? _limit = null;
  int? _offset = null;

  SelectQuery(this.fields);

  SelectFrom from(List<Table> tables) {
    this.tables = tables;
    return this;
  }

  @override
  SelectGroupBy groupBy(List<Column> fields) {
    this._groupBy = fields;
    return this;
  }

  @override
  SelectHaving having(Condition condition) {
    this._having = condition;
    return this;
  }

  @override
  SelectFrom join(Table t,
      {required Condition on, JoinScope scope = const JoinScope.inner()}) {
    joins.add(Join(t, on, scope: scope));
    return this;
  }

  @override
  SelectFrom leftJoin(Table t,
      {required Condition on, JoinScope scope = const JoinScope.inner()}) {
    joins.add(Join(t, on, type: const JoinType.leftJoin(), scope: scope));
    return this;
  }

  @override
  SelectFrom rightJoin(Table t,
      {required Condition on, JoinScope scope = const JoinScope.inner()}) {
    joins.add(Join(t, on, type: const JoinType.leftJoin(), scope: scope));
    return this;
  }

  @override
  SelectOrderBy orderBy(List<FieldOrdering> condition) {
    _orderBy = condition;
    return this;
  }

  @override
  SelectWhere where(Condition condition) {
    _where = condition;
    return this;
  }

  @override
  String toSql() {
    final query = <String>[];
    query.add("SELECT " +
        (fields.isEmpty ? "*" : fields.map((f) => f.toSql()).join(", ")));

    query.add("FROM " + tables.map((t) => t.toSql()).join(", "));

    if (joins.isNotEmpty) {
      query.add(joins.map((j) => j.toSql()).join("\n"));
    }

    if (_where != null) {
      query.add("WHERE " + _where!.toSql());
    }

    if (_groupBy.isNotEmpty) {
      query.add("GROUP BY " + _groupBy.map((g) => g.toSql()).join(", "));
    }

    if (_having != null) {
      query.add("HAVING " + _having!.toSql());
    }

    if (_orderBy.isNotEmpty) {
      query.add("ORDER BY " + _orderBy.map((f) => f.toSql()).join(", "));
    }

    if (_limit != null) {
      query.add("LIMIT $_limit");
    }

    if (_offset != null) {
      query.add("OFFSET $_offset");
    }

    return query.join("\n") + ";";
  }

  @override
  SelectLimit limit(int limit) {
    _limit = limit;
    return this;
  }

  @override
  SelectOffset offset(int offset) {
    _offset = offset;
    return this;
  }
}
