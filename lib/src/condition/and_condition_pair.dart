part of dooq.condition;

class AndCondition extends Condition {
  final Condition one;
  final Condition two;

  AndCondition(this.one, this.two);

  @override
  String toSql() => "(${one.toSql()} AND ${two.toSql()})";
}
