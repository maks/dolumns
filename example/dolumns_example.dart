import 'package:dolumns/dolumns.dart';

void main() {
  print('<<Basic Table>>\n');
  final columns = dolumnify([
    ['provider', '4.0.2'],
    ['http', '0.12.0+4'],
    ['shared_preferences', '0.5.6+1'],
    ['sentry', '3.0.1'],
  ], columnSplitter: ' | ');
  print(columns);

  print('\n<<Table With Headers>>\n');
  final columns2 = dolumnify([
    ['PACKAGES', 'VERSION'],
    ['provider', '4.0.2'],
    ['http', '0.12.0+4'],
    ['shared_preferences', '0.5.6+1'],
    ['sentry', '3.0.1'],
  ], columnSplitter: ' | ', headerIncluded: true, headerSeparator: '=');
  print(columns2);

  print('\n<<Table With Multi-Character Header Separator>>\n');
  final columns3 = dolumnify([
    ['PACKAGES', 'VERSION'],
    ['http', '0.12.0+4'],
    ['shared_preferences', '0.5.6+1'],
  ], columnSplitter: ' | ', headerIncluded: true, headerSeparator: '/\\');
  print(columns3);
}
