library dooq.condition;

import 'package:dooq/src/serializable.dart';
import 'package:dooq/src/column.dart';
import 'package:dooq/utils.dart' as utils;

part 'condition/and_condition_pair.dart';

part 'condition/equal_field_condition.dart';

part 'condition/equal_object_condition.dart';

part 'condition/generic_condition.dart';

part 'condition/greater_equal_field_condition.dart';

part 'condition/greater_equal_object_condition.dart';

part 'condition/greater_field_condition.dart';

part 'condition/greater_object_condition.dart';

part 'condition/less_equal_field_condition.dart';

part 'condition/less_equal_object_condition.dart';

part 'condition/less_field_condition.dart';

part 'condition/less_object_condition.dart';

part 'condition/like_condition.dart';

part 'condition/or_condition_pair.dart';

abstract class Condition with Serializable {
  Condition and(Condition condition) =>
      AndCondition(this, condition);

  Condition or(Condition condition) => OrConditionPair(this, condition);

  Condition andStr(String string, [Iterable params = const []]) =>
      AndCondition(this, new GenericCondition(string, params));

  Condition orStr(String string, [Iterable params = const []]) =>
      OrConditionPair(this, new GenericCondition(string, params));
}
