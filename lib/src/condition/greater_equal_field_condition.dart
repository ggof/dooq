part of dooq.condition;

class GreaterEqualFieldCondition<T> extends Condition {
  final Column<T> fieldOne;
  final Column<T> fieldTwo;

  GreaterEqualFieldCondition(this.fieldOne, this.fieldTwo);

  @override
  String toSql() => "${fieldOne.toSql()} >= ${fieldTwo.toSql()}";
}
