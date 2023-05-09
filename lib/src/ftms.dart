import 'dart:typed_data';

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

class FTMSCrossTrainer {
  final List<int> ftmsData;
  late final List<FTMSDataParameterValue> parameterValues;

  static const List<String> allFTMSDataFlags = [
    "More Data",
    "Average Speed",
    "Total Distance",
    "Step Count",
    "Stride Count",
    "Elevation Gain",
    "Inclination and Ramp Angle Setting",
    "Resistance Level",
    "Instantaneous Power",
    "Average Power",
    "Expended Energy",
    "Heart Rate",
    "Metabolic Equivalent",
    "Elapsed Time",
    "Remaining Time",
    "Movement Direction"
  ];

  static const List<FTMSDataParameter> allFTMSDataParameters = [
    FTMSDataParameter("Instantaneous Speed", "Average Speed", 2, "Km/h", 0.01),
    FTMSDataParameter("Average Speed", "Average Speed", 2, "Km/h", 0.01),
    FTMSDataParameter(
        "Total Distance", "Total Distance", 3, /*"metre", 1*/ "km", 0.000001),
    //FTMSDataParameter("Step Per Minute", "Step Count", 2, "step_per_minute", 1),
    //FTMSDataParameter(
    //    "Average Step Rate", "Step Count", 2, "step_per_minute", 1),
    FTMSDataParameter("Stride Count", "Stride Count", 2, "" /*"unitless"*/, 1),
    //FTMSDataParameter(
    //    "Inclination", "Inclination and Ramp Angle Setting", 2, "percent", 0.1),
    //FTMSDataParameter("Ramp Angle Setting",
    //    "Inclination and Ramp Angle Setting", 2, "degree", 0.1),
    //FTMSDataParameter(
    //    "Positive Elevation Gain", "Elevation Gain", 2, "metre", 1),
    //FTMSDataParameter(
    //    "Negative Elevation Gain", "Elevation Gain", 2, "metre", 1),
    FTMSDataParameter(
        "Resistance Level", "Resistance Level", 2, "" /*"unitless"*/, 0.1,
        signed: true),
    FTMSDataParameter(
        "Instantaneous Power", "Instantaneous Power", 2, "Watt", 1,
        signed: true),
    FTMSDataParameter("Average Power", "Average Power", 2, "Watt", 1,
        signed: true),
    FTMSDataParameter("Total Energy", "Expended Energy", 2, "kcal", 1),
    FTMSDataParameter("Energy Per Hour", "Expended Energy", 2, "kcal", 1),
    FTMSDataParameter("Energy Per Minute", "Expended Energy", 1, "kcal", 1),
    FTMSDataParameter("Heart Rate", "Heart Rate", 1, "beats/m", 1),
    FTMSDataParameter(
        "Metabolic Equivalent", "Metabolic Equivalent", 1, "meta", 0.1),
    FTMSDataParameter("Elapsed Time", "Elapsed Time", 2, "second", 1),
    FTMSDataParameter("Remaining Time", "Remaining Time", 2, "second", 1),
  ];

  FTMSCrossTrainer(this.ftmsData) {
    var features = getFTMSDataFeatures();
    var parameterValues = List<FTMSDataParameterValue>.empty(growable: true);

    print("---------------");

    var dataIndex = 2;
    var flagIndex = 0;
    while (dataIndex < ftmsData.length && flagIndex < features.length) {
      var flag = features.entries.elementAt(flagIndex);
      if (flag.value == true) {
        var parameters = allFTMSDataParameters
            .where((parameter) => parameter.flagName == flag.key)
            .toList();

        if (parameters.length == 0) print('empty: ${flag.key}');

        for (var parameter in parameters) {
          var value = 0;
          try {
            var d = ftmsData
                .getRange(dataIndex, dataIndex + parameter.size)
                .toList();
            print(d);
            value = intArrayToLittleEndian(d);
          } catch (e) {
            value = -1;
          }
          if (parameter.signed &&
              ((value >> (parameter.size * 8 - 1)) & 1) == 1) {
            // Das Ergebnis ist negativ
            value = value - (1 << (parameter.size * 8));
          }
          print(
              '${parameter.name}: ${value} [${(value * parameter.factor).toInt()}${parameter.unit}]');

          dataIndex += parameter.size;

          parameterValues.add(parameter.toFTMSDataParameterValue(value));
        }
      }
      flagIndex++;
    }
    this.parameterValues = parameterValues;
    print('flagIndex $flagIndex and ftmsData.length ${ftmsData.length}');
  }

  String _getFlagsBinary() {
    Uint8List byteList = Uint8List.fromList(
        List.from(ftmsData.getRange(0, 2).toList().reversed));
    ByteData byteData = ByteData.sublistView(byteList);
    var binary =
        byteData.getUint16(0, Endian.little).toRadixString(2).padLeft(16, "0");
    return binary;
  }

  Map<String, bool> getFTMSDataFeatures() {
    var flagsBinary = _getFlagsBinary();
    //print(flagsBinary);

    Map<String, bool> featureMap = {};

    for (var i = 0; i < flagsBinary.length; i++) {
      var flag = allFTMSDataFlags[i];
      var isEnabled = flagsBinary[flagsBinary.length - 1 - i] == "1";
      //print('$flag: $isEnabled');

      featureMap.putIfAbsent(flag, () => isEnabled);
    }
    return featureMap;
  }

  List<FTMSDataParameterValue> getFTMSDataParameterValues() {
    return parameterValues;
  }
}

int intArrayToLittleEndian(List<int> byteArray) {
  List<int> filledByteArray = [
    ...List.filled(4 - byteArray.length, 0),
    ...byteArray
  ];
  List<int> reversedByteArray = List<int>.from(filledByteArray.reversed);
  ByteData byteData =
      ByteData.sublistView(Uint8List.fromList(reversedByteArray));
  int intValue = byteData.getInt32(0, Endian.little);
  return intValue;
}
