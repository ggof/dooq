part of dooq.condition;

class GreaterEqualObjectCondition<T> extends Condition {
  final Column<T> field;
  final T object;

  GreaterEqualObjectCondition(this.field, this.object);

  @override
  String toSql() => "${field.toSql()} >= ${utils.objectToSql(object)}";
}
