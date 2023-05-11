class Flag {
  final String name;

  const Flag(this.name);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is Flag && other.name == name;
  }
}
