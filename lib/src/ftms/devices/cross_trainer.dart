import 'package:flutter_ftms/src/ftms/ftms_data.dart';
import 'package:flutter_ftms/src/ftms/ftms_patameter.dart';

class FTMSCrossTrainer extends FTMSData {
  @override
  List<String> allFTMSDataFlags = [
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

  List<FTMSDataParameter> allFTMSDataParameters = [
    const FTMSDataParameter(
        "Instantaneous Speed", "Average Speed", 2, "Km/h", 0.01),
    const FTMSDataParameter("Average Speed", "Average Speed", 2, "Km/h", 0.01),
    const FTMSDataParameter(
        "Total Distance", "Total Distance", 3, /*"metre", 1*/ "km", 0.000001),
    //FTMSDataParameter("Step Per Minute", "Step Count", 2, "step_per_minute", 1),
    //FTMSDataParameter(
    //    "Average Step Rate", "Step Count", 2, "step_per_minute", 1),
    const FTMSDataParameter(
        "Stride Count", "Stride Count", 2, "" /*"unitless"*/, 1),
    //FTMSDataParameter(
    //    "Inclination", "Inclination and Ramp Angle Setting", 2, "percent", 0.1),
    //FTMSDataParameter("Ramp Angle Setting",
    //    "Inclination and Ramp Angle Setting", 2, "degree", 0.1),
    //FTMSDataParameter(
    //    "Positive Elevation Gain", "Elevation Gain", 2, "metre", 1),
    //FTMSDataParameter(
    //    "Negative Elevation Gain", "Elevation Gain", 2, "metre", 1),
    const FTMSDataParameter(
        "Resistance Level", "Resistance Level", 2, "" /*"unitless"*/, 0.1,
        signed: true),
    const FTMSDataParameter(
        "Instantaneous Power", "Instantaneous Power", 2, "Watt", 1,
        signed: true),
    const FTMSDataParameter("Average Power", "Average Power", 2, "Watt", 1,
        signed: true),
    const FTMSDataParameter("Total Energy", "Expended Energy", 2, "kcal", 1),
    const FTMSDataParameter("Energy Per Hour", "Expended Energy", 2, "kcal", 1),
    const FTMSDataParameter(
        "Energy Per Minute", "Expended Energy", 1, "kcal", 1),
    const FTMSDataParameter("Heart Rate", "Heart Rate", 1, "beats/m", 1),
    const FTMSDataParameter(
        "Metabolic Equivalent", "Metabolic Equivalent", 1, "meta", 0.1),
    const FTMSDataParameter("Elapsed Time", "Elapsed Time", 2, "second", 1),
    const FTMSDataParameter("Remaining Time", "Remaining Time", 2, "second", 1),
  ];

  FTMSCrossTrainer(ftmsData) : super(ftmsData);
}
