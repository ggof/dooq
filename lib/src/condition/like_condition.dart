part of dooq.condition;

class LikeCondition extends Condition {
  final Column field;
  final String pattern;

  LikeCondition(this.field, this.pattern);

  @override
  String toSql() => "${field.toSql()} LIKE ${utils.objectToSql(pattern)}";
}
