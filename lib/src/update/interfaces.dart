part of dooq.update;

abstract class UpdateFirstSet {
  UpdateMoreSet setValue<T>(Column<T> field, T object);

  UpdateMoreSet setField<T>(Column<T> field, Column<T> anotherField);
}

abstract class UpdateMoreSet with Serializable {
  UpdateMoreSet setValue<T>(Column<T> field, T object);

  UpdateMoreSet setField<T>(Column<T> field, Column<T> anotherField);

  UpdateWhere where(Condition condition);
}

abstract class UpdateWhere with Serializable {}
