part of dooq.insert;

abstract class InsertInto {
  Values values(List fields);
  Values addAll(List<List> rows);
}

abstract class Values extends Serializable {
  Values values(List fields);
  Values addAll(List<List> rows);
}
