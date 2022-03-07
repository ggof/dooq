part of dooq.select;

abstract class Select {
  SelectFrom from(List<Table> tables);
}

abstract class SelectFrom extends Serializable {
  SelectFrom join(Table t,
      {required Condition on, JoinScope scope = const JoinScope.inner()});

  SelectFrom leftJoin(Table t,
      {required Condition on, JoinScope scope = const JoinScope.inner()});

  SelectFrom rightJoin(Table t,
      {required Condition on, JoinScope scope = const JoinScope.inner()});

  SelectWhere where(Condition condition);

  SelectGroupBy groupBy(List<Column> fields);

  SelectHaving having(Condition condition);

  SelectOrderBy orderBy(List<FieldOrdering> clauses);

  SelectLimit limit(int limit);

  SelectOffset offset(int offset);
}

abstract class SelectWhere extends Serializable {
  SelectGroupBy groupBy(List<Column> fields);

  SelectHaving having(Condition condition);

  SelectOrderBy orderBy(List<FieldOrdering> condition);
}

abstract class SelectGroupBy extends Serializable {
  SelectHaving having(Condition condition);

  SelectOrderBy orderBy(List<FieldOrdering> condition);
}

abstract class SelectHaving extends Serializable {
  SelectOrderBy orderBy(List<FieldOrdering> condition);
}

abstract class SelectOrderBy extends Serializable {
  SelectLimit limit(int limit);

  SelectOffset offset(int offset);
}

abstract class SelectLimit extends Serializable {
  SelectOffset offset(int offset);

  SelectOrderBy orderBy(List<FieldOrdering> condition);
}

abstract class SelectOffset extends Serializable {
  SelectLimit limit(int limit);

  SelectOrderBy orderBy(List<FieldOrdering> condition);
}
