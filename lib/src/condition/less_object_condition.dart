part of dooq.condition;

class LessObjectCondition<T> extends Condition {
  final Column<T> field;
  final T object;

  LessObjectCondition(this.field, this.object);

  @override
  String toSql() => "${field.toSql()} < ${utils.objectToSql(object)}";
}
