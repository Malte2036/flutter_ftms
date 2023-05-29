class MachineControlPointParameter {
  final int size;
  final int value;

  MachineControlPointParameter._internal(this.size, this.value);

  /// MachineControlPointParameter.stopOrPause
  ///
  /// @pause true if you want pause. false if you want to stop.
  factory MachineControlPointParameter.stopOrPause({required bool pause}) {
    return MachineControlPointParameter._internal(1, pause ? 0x2 : 0x1);
  }
}
