class StringCalculator {
  static int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiterPattern = r',|\n';
    String numberSection = numbers;

    if (numbers.startsWith('//')) {
      final match = RegExp(r'^//(.+)\n').firstMatch(numbers)!;
      final customDelimiter = RegExp.escape(match.group(1)!);

      delimiterPattern = '$delimiterPattern|$customDelimiter';
      numberSection = numbers.substring(match.end);
    }

    final values =
        numberSection.split(RegExp(delimiterPattern)).map(int.parse).toList();

    final negatives = values.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed ${negatives.join(',')}');
    }

    return values.fold(0, (sum, n) => sum + n);
  }
}
