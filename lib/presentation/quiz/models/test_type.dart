enum TestType {
  multipleChoice('Multiple Choice'),
  trueFalse('True or False');

  const TestType(this.value);
  final String value;

  factory TestType.fromValue(String value) {
    return values.firstWhere(
      (result) => result.value == value,
      orElse: () => TestType.multipleChoice,
    );
  }

  bool get isMultipleChoice => this == TestType.multipleChoice;
  bool get isTrueFalse => this == TestType.trueFalse;
}
