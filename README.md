# DOOQ

A type-safe builder of SQL strings in Dart, heavily inspired by [JOOQ](http://www.jooq.org/). It's currently pre-alpha
software, meaning a lot of features might be missing and test coverage is not great.

## Usage

There are two ways of using DOOQ. the fastest and easiest route is to use the provided generator to create your full
database's schema. The other way is to write your tables by hand.

To use the generator, you should create a file in your `bin` folder (e.g. bin/schema_generator.dart). It should look
like the following:

```dart
import 'package:dooq/schema_generator.dart' as generator;

void main() {
  generator.generate(
      host: "localhost",
      username: "root",
      password: "pass",
      port: 5432,
      database: "your_db",
      output: "dbschema.dart",
      library: "dbschema");
}
```

As of now, `dooq` can only work with a postgres database. I hope to mitigate that in the future. It's also the reason
why `dooq` depends on `postgres`: it uses it to open the connection to the database.

After you created the script, run it with `dart bin/schema_generator.dart`, and it will create a file
called `dbschema.dart` with all the classes generated from your database.

It should look like the following (of course, with your own data):

```dart
library dbschema;

import 'package:dooq/dooq.dart';

class _OrderTable extends Table {
  @override
  String toSql() => "orders";

  Column<int> get id => _f.id;

  Column<String> get name => _f.name;

  OrderTableFields _f;

  _OrderTable() {
    _f = _OrderTableFields(this);
  }
}

class _OrderTableFields {
  final TableField<int> id;
  final TableField<String> _name;

  OrderTableFields(Table table)
      : id = TableField<int>(table, "id"),
        name = TableField<String>(table, "name");
}

final orders = _OrderTable();
```

And then you can import it and use it like this:

```dart
import 'dbschema.dart';
import 'package:dooq/dooq.dart';

void main() {
  final selectSql = select() // add columns here to select only them.
      .from([orders])
      .where(orders.id.eqToObj(5).and(orders.name.like("%blah%")))
      .toSql();
  print(selectSql);

  final insertSql = insertInto(orders, [orders.name]).values(["New one"]).toSql();
  print(insertSql);
}
```

## Contribution

`dooq` is currently closed to contributions since it is in the very early stages of development. I will probably allow
contributions if I see a lot of people are using this package.
