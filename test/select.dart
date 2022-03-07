import 'package:dooq/src/select/select.dart';
import 'package:test/test.dart';

import 'support/tables.dart';

void main() {
  group("test SelectQuery", () {
    test("returns correct SQL", () {
      final sql = select()
          .from([orders])
          .join(orderRecipients,
              on: orders.id.eqToField(orderRecipients.orderId))
          .where(orders.name.like("%lem%"))
          .toSql();

      print(sql);
    });
  });
}
