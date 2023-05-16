class ParameterName {
  final String name;

  const ParameterName(this.name);

  @override
  int get hashCode => Object.hash(name, name);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is ParameterName && other.name == name;
  }
}
