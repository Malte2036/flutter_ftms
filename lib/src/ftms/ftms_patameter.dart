class FTMSDataParameter {
  final String name;
  final String flagName;
  final String unit;
  final num factor;
  final int size;
  final bool signed;

  const FTMSDataParameter(
      this.name, this.flagName, this.size, this.unit, this.factor,
      {this.signed = false});

  FTMSDataParameterValue toFTMSDataParameterValue(int value) {
    return FTMSDataParameterValue(
        name, flagName, size, unit, factor, signed, value);
  }
}

class FTMSDataParameterValue extends FTMSDataParameter {
  final int value;
  const FTMSDataParameterValue(
    String name,
    String flagName,
    int size,
    String unit,
    num factor,
    bool signed,
    int this.value,
  ) : super(name, flagName, size, unit, factor, signed: signed);

  @override
  String toString() {
    return '$name: ${(value * factor).toStringAsFixed(2)} $unit';
  }
}
