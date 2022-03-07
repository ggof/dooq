part of dooq.condition;

class EqualObjectCondition<T> extends Condition {
  final Column<T> field;
  final T object;

  EqualObjectCondition(this.field, this.object);

  @override
  String toSql() => "${field.toSql()} = ${utils.objectToSql(object)}";
}
