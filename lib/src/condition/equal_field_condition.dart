part of dooq.condition;

class EqualFieldCondition<T> extends Condition {
  final Column<T> fieldOne;
  final Column<T> fieldTwo;

  EqualFieldCondition(this.fieldOne, this.fieldTwo);

  @override
  String toSql() => "${fieldOne.toSql()} = ${fieldTwo.toSql()}";
}

