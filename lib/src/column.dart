library dooq.table_fields;

import 'package:dooq/src/condition.dart';
import 'package:dooq/src/serializable.dart';
import 'package:dooq/src/table.dart';
import 'package:dooq/utils.dart' as utils;

class Column<T> with Serializable {
  final String name;
  final Table table;
  final String? defaultValue;

  Column(this.table, this.name, [this.defaultValue]);

  EqualFieldCondition<T> eqToField(Column<T> field) =>
      EqualFieldCondition<T>(this, field);

  EqualObjectCondition<T> eqToObj(T obj) => EqualObjectCondition<T>(this, obj);

  LessFieldCondition<T> ltField(Column<T> field) =>
      LessFieldCondition<T>(this, field);

  LessObjectCondition<T> ltObj(T obj) => LessObjectCondition<T>(this, obj);

  LessEqualFieldCondition<T> lteField(Column<T> field) =>
      LessEqualFieldCondition<T>(this, field);

  LessEqualObjectCondition<T> lteObj(T obj) =>
      LessEqualObjectCondition<T>(this, obj);

  GreaterFieldCondition<T> gtField(Column<T> field) =>
      GreaterFieldCondition<T>(this, field);

  GreaterObjectCondition<T> gtObj(T obj) =>
      GreaterObjectCondition<T>(this, obj);

  GreaterEqualFieldCondition<T> gteField(Column<T> field) =>
      GreaterEqualFieldCondition<T>(this, field);

  GreaterEqualObjectCondition<T> gteObj(T obj) =>
      GreaterEqualObjectCondition<T>(this, obj);

  Condition like(String pattern) => LikeCondition(this, pattern);

  String toSql() => "${table.toSql()}.`${utils.escape(name)}`";

  bool operator ==(other) =>
      other is Column && other.name == name && other.table == table;

  int get hashCode => name.hashCode ^ table.hashCode;
}
