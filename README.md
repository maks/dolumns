A library for formatting text output into columns.


## Usage

A simple usage example:

```dart
import 'package:dolumns/dolumns.dart';

main() {
  final columns = dolumnify([
    ['provider', '4.0.2'],
    ['http', '0.12.0+4'],
    ['shared_preferences', '0.5.6+1'],
    ['sentry', '3.0.1'],
  ]);
  print(columns);
}
```

will output:
```
provider            4.0.2   
http                0.12.0+4
shared_preferences  0.5.6+1 
sentry              3.0.1   
```

Note you can pass in objects of any type, dolumn will call `toString()` on every object passed in.

API inspired by the [columinfy](https://github.com/timoxley/columnify) npm package.

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://github.com/maks/dolumns/issues
