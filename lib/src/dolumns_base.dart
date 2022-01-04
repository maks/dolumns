/// toString() will called on every object passed in
String dolumnify(List<List<Object>> data,
    {String? columnSplitter,
    bool headerIncluded = false,
    String? headerSeparator}) {
  final columnLengths = columnMaxLengths(data);
  final columnSep = columnSplitter ?? '  ';
  final headerSep = headerSeparator ?? ' ';
  final lines = <String>[];
  for (var index = 0; index < data.length; index++) {
    final paddedItems = data[index]
        .mapIndex((f, i) => f.toString().padRight(columnLengths[i]!));
    lines.add(paddedItems.join(columnSep));

    if ((index == 0) && (headerIncluded == true)) {
      final headerSeparatorLine = data[index].mapIndex((f, i) => headerSep
          .padRight(columnLengths[i]!, headerSep)
          .truncate(size: columnLengths[i]!));
      final headerSeparatorJoiner =
          headerSep.padRight(columnSep.length, headerSep);
      lines.add(headerSeparatorLine.join(headerSeparatorJoiner));
    }
  }
  return lines.join('\n');
}

List<int?> columnMaxLengths(List<List<Object>> data) {
  if (data.isEmpty) {
    return [];
  }
  final maxColumnLengths =
      List<int?>.filled(data[0].length, null, growable: false);
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

extension DolumnsStringParser on String {
  String truncate({int size = 10}) {
    // returns truncated string
    // the max returned length of string is 'size'
    // if size is 0 or less or size greater than string length, then returns empty string
    return (size <= 0) || (size > length) ? '' : '${substring(0, size)}';
  }
}
