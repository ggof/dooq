// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library dooq.test;

import 'package:dooq/dooq.dart';
import 'package:test/test.dart';

import 'support/tables.dart';

void main() {
  group('A group of tests', () {
    test('select Test', () {
      final sql = select()
          .from([orders])
          .join(orderRecipients,
              on: orders.id.eqToField(orderRecipients.orderId))
          .where(orders.id.eqToObj(5).and(orders.name.like("%blah%")));
      print(sql);
      expect(true, isTrue);
    });

    test('insertInto Test', () {
      final values = [
        for (var i = 0; i < 10; i++) ["value $i", i]
      ];
      final sql = insertInto(
        orderRecipients,
        [orderRecipients.name, orderRecipients.orderId],
      ).addAll(values);

      print(sql);
      expect(true, isTrue);
    });

    test('update Test', () {
      final sql = update(orderRecipients)
          .setValue(orderRecipients.name, "default")
          .setValue(orderRecipients.orderId, 6)
          .where(orderRecipients.name.eqToObj("blah"));
      print(sql);
      expect(true, isTrue);
    });

    test('delete Test', () {
      final sql =
          delete(orderRecipients).where(orderRecipients.name.eqToObj("blah"));
      print(sql);
      expect(true, isTrue);
    });
  });
}
