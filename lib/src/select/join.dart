part of dooq.select;

abstract class JoinScope with Serializable {
  const JoinScope();

  const factory JoinScope.inner() = _InnerJoinScope;

  factory JoinScope.outer() = _OuterJoinScope;
}

class _InnerJoinScope extends JoinScope {
  const _InnerJoinScope() : super();

  @override
  String toSql() => "INNER";
}

class _OuterJoinScope extends JoinScope {
  const _OuterJoinScope() : super();

  @override
  String toSql() => "OUTER";
}

abstract class JoinType with Serializable {
  const JoinType();

  const factory JoinType.join() = _Join;

  const factory JoinType.leftJoin() = _LeftJoin;

  const factory JoinType.rightJoin() = _RightJoin;
}

class _Join extends JoinType {
  const _Join() : super();

  @override
  String toSql() => "JOIN";
}

class _LeftJoin extends JoinType {
  const _LeftJoin() : super();

  @override
  String toSql() => "LEFT JOIN";
}

class _RightJoin extends JoinType {
  const _RightJoin() : super();

  @override
  String toSql() => "RIGHT JOIN";
}

class Join with Serializable {
  final JoinType type;
  final JoinScope scope;
  final Table table;
  final Condition on;

  Join(
    this.table,
    this.on, {
    this.type = const JoinType.join(),
    this.scope = const JoinScope.inner(),
  });

  @override
  String toSql() => "$scope $type $table ON $on";
}
