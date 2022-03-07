part of dooq.condition;

class GreaterFieldCondition<T> extends Condition {
  final Column<T> fieldOne;
  final Column<T> fieldTwo;

  GreaterFieldCondition(this.fieldOne, this.fieldTwo);

  @override
  String toSql() => "${fieldOne.toSql()} > ${fieldTwo.toSql()}";
}
