part of dooq.condition;

class LessEqualObjectCondition<T> extends Condition {
  final Column<T> field;
  final T object;

  LessEqualObjectCondition(this.field, this.object);

  @override
  String toSql() => "${field.toSql()} <= ${utils.objectToSql(object)}";
}
