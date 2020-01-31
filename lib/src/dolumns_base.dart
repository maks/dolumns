/// toString() will called on every object passed in
String dolumnify(List<List<Object>> data) {
  final columnLengths = columnMaxLengths(data);
  final lines = <String>[];
  for (final row in data) {
    final paddedItems =
        row.mapIndex((f, i) => f.toString().padRight(columnLengths[i]));

    lines.add(paddedItems.join('  '));
  }
  return lines.join('\n');
}

List<int> columnMaxLengths(List<List<Object>> data) {
  if (data == null || data.isEmpty) {
    return [];
  }
  final maxColumnLengths = List<int>(data[0].length);
  for (final row in data) {
    final columnCount = row.length;

    for (final column in _range(columnCount)) {
      final itemLength = row[column].toString().length;
      maxColumnLengths[column] = (itemLength > (maxColumnLengths[column] ?? 0))
          ? itemLength
          : maxColumnLengths[column] ?? 0;
    }
  }
  return maxColumnLengths;
}

Iterable<int> _range(int max) => Iterable<int>.generate(max).toList();

/// from https://stackoverflow.com/a/59447850/85472
extension ExtendedIterable<E> on Iterable<E> {
  /// Like Iterable<T>.map but callback have index as second argument
  Iterable<T> mapIndex<T>(T Function(E, int) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }

  void forEachIndex(void Function(E, int) f) {
    var i = 0;
    forEach((e) => f(e, i++));
  }
}
