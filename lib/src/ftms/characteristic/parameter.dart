class Parameter {
  final int size;
  final String unit;
  final num factor;
  final bool signed;

  const Parameter(this.size, this.unit, this.factor, {this.signed = false});
}
