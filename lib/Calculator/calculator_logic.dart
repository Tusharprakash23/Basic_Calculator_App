class CalculatorLogic {

  static String evaluate(String exp) {
    try {
      final parts = exp.split(RegExp(r'([+\-*/])'));

      if (parts.length < 2) return exp;

      double num1 = double.parse(parts[0]);
      double num2 = double.parse(parts[1]);

      String operator = exp.replaceAll(RegExp(r'[0-9.]'), '');

      double result = 0;

      switch (operator) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          result = num1 / num2;
          break;
      }

      return result.toString();
    } catch (e) {
      return "Error";
    }
  }
}
