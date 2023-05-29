class MachineControlPointParameter {
  final int size;
  final int value;

  MachineControlPointParameter._internal(this.size, this.value);

  /// MachineControlPointParameter.stopOrPause
  ///
  /// @stop true if you want stop. false if you want to pause.
  factory MachineControlPointParameter.stopOrPause({required bool stop}) {
    return MachineControlPointParameter._internal(1, stop ? 0x1 : 0x2);
  }
}
