part of dooq.condition;

class GreaterObjectCondition<T> extends Condition {
  final Column<T> field;
  final T object;

  GreaterObjectCondition(this.field, this.object);

  @override
  String toSql() => "${field.toSql()} > ${utils.objectToSql(object)}";
}
