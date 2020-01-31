import 'package:dolumns/dolumns.dart';
import 'package:test/test.dart';

void main() {
  group('format simple lists', () {
    test('correct column max lengths from data', () {
      final columnmaxLengths = columnMaxLengths([
        ['http', '0.12.0+4'],
        ['shared_preferences', '0.5.6+1'],
        ['sentry', '3.0.1'],
      ]);
      expect(columnmaxLengths, [18, 8]);
    });

    test('format single entry', () {
      final columns = dolumnify([
        ['provider', '4.0.2'],
      ]);
      expect(columns, 'provider  4.0.2');
    });

    test('format multiple entries', () {
      final columns = dolumnify([
        ['http', '0.12.0+4'],
        ['shared_preferences', '0.5.6+1'],
        ['sentry', '3.0.1'],
      ]);
      expect(columns,
          'http                0.12.0+4\nshared_preferences  0.5.6+1 \nsentry              3.0.1   ');
    });
  });
}
