extension StringExtension on String {
  // String someString = "some string";
  // someString.capitalizeFirst() => "Some string";
  String capitalizeFirst() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  // String someString = "some string";
  // someString.capitalizeEach() => "Some String";
  String capitalizeEach() {
    final String string =
        split(' ').map((String e) => e.capitalizeFirst()).join(' ');
    return string;
  }

  String get drAsPrefix {
    final String lowercase = toLowerCase();
    if (!(lowercase.startsWith('dr.') || lowercase.startsWith('dr'))) {
      return 'Dr. $this';
    } else {
      return this;
    }
  }
}

extension AgeCalculator on DateTime {
  int calculateAge() {
    final DateTime now = DateTime.now();
    int age = now.year - year;
    if (now.month < month || (now.month == month && now.day < day)) {
      age--;
    }
    return age;
  }
}
