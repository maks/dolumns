import 'package:dolumns/dolumns.dart';

void main() {
  final columns = dolumnify([
    ['provider', '4.0.2'],
    ['http', '0.12.0+4'],
    ['shared_preferences', '0.5.6+1'],
    ['sentry', '3.0.1'],
  ], columnSplitter: ' | ');
  print(columns);
}
