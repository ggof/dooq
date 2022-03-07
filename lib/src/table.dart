library dooq.table;

import 'package:dooq/src/serializable.dart';

abstract class Table extends Serializable {
  bool operator ==(other) => other is Table && other.toString() == toString();

  int get hashCode => toString().hashCode;
}
