library dooq.test.conditions;

import 'package:dooq/dooq.dart';
import 'package:test/test.dart';
import 'support/tables.dart';

void main() {
  group('Conditions tests', () {
    test('equal object', () {
      var cond = new EqualObjectCondition(orders.id, "blah");
      expect(cond.toSql(), "`orders`.`id` = 'blah'");
    });

    test('equal field', () {
      var cond = new EqualFieldCondition(orders.id, orders.name);
      expect(cond.toSql(), "`orders`.`id` = `orders`.`name`");
    });

    test('generic', () {
      var cond = new GenericCondition("foo = bar");
      expect(cond.toSql(), "foo = bar");
    });

    test('greater equal field condition', () {
      var cond = new GreaterEqualFieldCondition(orders.id, orders.name);
      expect(cond.toSql(), "`orders`.`id` >= `orders`.`name`");
    });

    test('greater field condition', () {
      var cond = new GreaterFieldCondition(orders.id, orders.name);
      expect(cond.toSql(), "`orders`.`id` > `orders`.`name`");
    });

    test('less field condition', () {
      var cond = new LessFieldCondition(orders.id, orders.name);
      expect(cond.toSql(), "`orders`.`id` < `orders`.`name`");
    });

    test('less equal field condition', () {
      var cond = new LessEqualFieldCondition(orders.id, orders.name);
      expect(cond.toSql(), "`orders`.`id` <= `orders`.`name`");
    });

    test('greater equal object condition', () {
      var cond = new GreaterEqualObjectCondition(orders.id, "blah");
      expect(cond.toSql(), "`orders`.`id` >= 'blah'");
    });

    test('greater object condition', () {
      var cond = new GreaterObjectCondition(orders.id, "blah");
      expect(cond.toSql(), "`orders`.`id` > 'blah'");
    });

    test('less object condition', () {
      var cond = new LessObjectCondition(orders.id, "blah");
      expect(cond.toSql(), "`orders`.`id` < 'blah'");
    });

    test('less equal object condition', () {
      var cond = new LessEqualObjectCondition(orders.id, "blah");
      expect(cond.toSql(), "`orders`.`id` <= 'blah'");
    });

    test('and condition', () {
      var cond = new AndCondition(
          new EqualObjectCondition(orders.id, "blah"),
          new EqualFieldCondition(orders.id, orders.name));

      expect(cond.toSql(), "(`orders`.`id` = 'blah' AND `orders`.`id` = `orders`.`name`)");
    });

    test('or condition', () {
      var cond = new OrConditionPair(
          new EqualObjectCondition(orders.id, "blah"),
          new EqualFieldCondition(orders.id, orders.name));

      expect(cond.toSql(), "(`orders`.`id` = 'blah' OR `orders`.`id` = `orders`.`name`)");
    });

    test('like condition', () {
      var cond = new LikeCondition(orders.name, "%FO'O%");
      expect(cond.toSql(), "`orders`.`name` LIKE '%FO\\'O%'");
    });
  });
}
