part of dooq.condition;

class LessFieldCondition<T> extends Condition {
  final Column<T> fieldOne;
  final Column<T> fieldTwo;

  LessFieldCondition(this.fieldOne, this.fieldTwo);

  @override
  String toSql() => "${fieldOne.toSql()} < ${fieldTwo.toSql()}";
}
