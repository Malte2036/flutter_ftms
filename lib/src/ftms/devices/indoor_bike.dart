import 'package:flutter_ftms/src/ftms/ftms_data.dart';
import 'package:flutter_ftms/src/ftms/ftms_patameter.dart';

class IndoorBike extends FTMSData {
  @override
  List<String> get allFTMSDataFlags => [
        "More Data",
        "Average Speed",
        "Instantaneous Cadence",
        "Average Cadence",
        "Total Distance",
        "Resistance Level",
        "Instantaneous Power",
        "Average Power",
        "Expended Energy",
        "Heart Rate",
        "Metabolic Equivalent",
        "Elapsed Time",
        "Remaining Time"
      ];

  @override
  List<FTMSDataParameter> get allFTMSDataParameters => [
        const FTMSDataParameter("Instantaneous Speed", "", 1, "Km/h", 0.01),
        const FTMSDataParameter(
            "Average Speed", "Average Speed", 2, "Km/h", 0.01),
        const FTMSDataParameter(
            "Instantaneous Cadence", "Instantaneous Cadence", 2, "/min", 0.5),
        const FTMSDataParameter(
            "Average Cadence", "Average Cadence", 2, "/min", 0.5),
        const FTMSDataParameter(
            "Total Distance", "Total Distance", 3, "metre", 1),
        const FTMSDataParameter(
            "Resistance Level", "Resistance Level", 2, "unitless", 1),
        const FTMSDataParameter(
            "Instantaneous Power", "Instantaneous Power", 2, "watt", 1),
        const FTMSDataParameter("Average Power", "Average Power", 2, "watt", 1),
        const FTMSDataParameter(
            "Total Energy", "Expended Energy", 2, "kcal", 1),
        const FTMSDataParameter(
            "Energy Per Hour", "Expended Energy", 2, "kcal", 1),
        const FTMSDataParameter(
            "Energy Per Minute", "Expended Energy", 1, "kcal", 1),
        const FTMSDataParameter("Heart Rate", "Heart Rate", 1, "Beats/m", 1),
        const FTMSDataParameter(
            "Metabolic Equivalent", "Metabolic Equivalent", 1, "meta", 0.1),
        const FTMSDataParameter("Elapsed Time", "Elapsed Time", 2, "second", 1),
        const FTMSDataParameter(
            "Remaining Time", "Remaining Time", 2, "second", 1),
      ];

  IndoorBike(ftmsData) : super(ftmsData);
}
