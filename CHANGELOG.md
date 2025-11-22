## 1.3.0

- fix critical Treadmill data parsing bug where missing energy parameters caused incorrect parsing of heart rate and elapsed time
- add missing energyPerHour and energyPerMinute parameters when expendedEnergyFlag is set
- BREAKING CHANGE: rename expendedEnergy to totalEnergy for consistency with other device types

## 1.2.0

- update dependencies
- add MacOS runner for the example app

## 1.1.3

- only scan for bluetooth devices with FTMS service

## 1.1.2

- fix getDeviceDataTypeWithoutConnecting for anonymous bluetooth mac addresses on iOS

## 1.1.1

- fix bluetooth service uuid not parsed correctly
- upgrade flutter version to >=3.16.0

## 1.1.0

- fix machine control point parameters not working

## 1.0.2

- fix control point not working

## 1.0.1

- upgrade dependencies

## 1.0.0

- FIRST STABLE RELEASE
- upgrade dependencies

## 0.9.0

- BREAKING CHANGE: upgrade flutter_blue_plus to 1.12.9

## 0.8.1

- add BluetoothState stream
- add isBluetoothEnabled function

## 0.8.0

- merge DeviceData features correctly
- allow ftms data in multiple packages (moreDataFlag)
- fix wrong rower configuration

## 0.7.1

- implement more MachineControlPoints

## 0.7.0

- fix MachineControlPoint stopOrPause
- change MachineControlPoint architecture

## 0.6.4

- detect device type before connecting

## 0.6.3

- add example project

## 0.6.2

- add characteristics overview to README.md

## 0.6.1

- fix control point opcode value

## 0.6.0

- change project structure

## 0.5.0

- implement basic Control Point characteristic

## 0.4.1

- fix wrong function name

## 0.4.0

- implement machine status characteristic
- add getParameterValueByName to FTMSData

## 0.3.0

- implemented: Cross Trainer

## 0.2.0

- implemented: Rower

## 0.1.6

- update README

## 0.1.5

- refactor: change FTMSData visibility

## 0.1.4

- under development: Treadmill

## 0.1.3

- only export necessary parts of flutter_blue_plus

## 0.1.2

- remove unused dependency
- update README

## 0.1.1

- update README

## 0.1.0

- implemented: Indoor Bike
- under development: Cross Trainer
