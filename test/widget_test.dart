import 'package:flutter_test/flutter_test.dart';

import 'package:tdd_assessment/string_calculator.dart';

void main() {
  test('Return 0 if String is empty', () {
    expect(StringCalculator.add(''), 0);
  });

  test('Return number if value is only single number', () {
    expect(StringCalculator.add('1'), 1);
  });

  test('Return sum of value in string', () {
    expect(StringCalculator.add('1,5'), 6);
  });

  test('Test sum of any number of value', () {
    expect(StringCalculator.add('1,5,4,9'), 19);
  });

  test('Allow add method to handle new line', () {
    expect(StringCalculator.add('1\n2,3'), 6);
  });

  test('Test different delimiter', () {
    expect(StringCalculator.add('//;\n1;2'), 3);
  });

  test('Test exception on negative number input', () {
    expect(() => StringCalculator.add('//;\n-1;-2'), throwsException);
  });

  test('Throws exception with all negative numbers', () {
    expect(
      () => StringCalculator.add('//;\n-1;-2'),
      throwsA(
        predicate(
          (e) =>
              e is Exception &&
              e.toString().contains('negative numbers not allowed -1,-2'),
        ),
      ),
    );
  });
}
