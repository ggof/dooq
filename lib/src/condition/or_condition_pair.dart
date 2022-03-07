part of dooq.condition;

class OrConditionPair extends Condition {
  final Condition one;
  final Condition two;

  OrConditionPair(this.one, this.two);

  @override
  String toSql() => "(${one.toSql()} OR ${two.toSql()})";
}
