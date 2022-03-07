part of dooq.condition;

class LessEqualFieldCondition<T> extends Condition {
  final Column<T> fieldOne;
  final Column<T> fieldTwo;

  LessEqualFieldCondition(this.fieldOne, this.fieldTwo);

  @override
  String toSql() => "${fieldOne.toSql()} <= ${fieldTwo.toSql()}";
}
