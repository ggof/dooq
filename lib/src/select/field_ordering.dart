part of dooq.select;

abstract class Ordering {
  const Ordering();

  const factory Ordering.ascending() = Ascending;

  const factory Ordering.descending() = Descending;
}

class Ascending extends Ordering {
  const Ascending() : super();

  @override
  String toString() => "ASC";
}

class Descending extends Ordering {
  const Descending() : super();

  @override
  String toString() => "DESC";
}

class FieldOrdering implements Serializable {
  final Column field;
  final Ordering order;

  FieldOrdering(this.field, [this.order = const Ordering.ascending()]);

  @override
  String toSql() => "${field.toSql()} $order";
}
