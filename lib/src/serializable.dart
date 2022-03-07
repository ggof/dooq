library dooq.serializable;

abstract class Serializable {
  String toSql();

  String toString() => toSql();
}
