import 'dart:io';

import 'package:excel/excel.dart';
import 'package:fpdart/fpdart.dart';
import 'package:intl/intl.dart';
import 'package:naviquezon/src/core/abstracts/failure_abstract.dart';
import 'package:naviquezon/src/core/utils/constants/failures/default_failure.dart';
import 'package:naviquezon/src/core/utils/extensions/num_extensions.dart';
import 'package:naviquezon/src/core/utils/keys/string_keys.dart';
import 'package:naviquezon/src/features/admin/report/domain/models/report_model.dart';
import 'package:naviquezon/src/features/admin/report/domain/models/report_record_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_report_model.dart';
import 'package:permission_handler/permission_handler.dart';

class ReportService {
  /// Future method to convert the report to excel and export to device.
  ///
  Future<Either<Failure, void>> downloadReport({
    required List<EstablishmentModel> establishmentList,
    required String municipality,
    required DateTime dateTime,
  }) async {
    try {
      // Create a new Excel document
      final excel = Excel.createExcel();
      final sheetObject = excel['Sheet1'];
      final monthYear = DateFormat('MMMM yyyy').format(dateTime);

      //  Add the title of the sheet
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0))
        ..value = TextCellValue('Tourism Attraction Visitor Record')
        ..cellStyle = CellStyle(
          bold: true,
          horizontalAlign: HorizontalAlign.Center,
        );

      sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 1))
          .value = TextCellValue('Month/Year:');
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 1))
        ..value = TextCellValue(monthYear)
        ..cellStyle = CellStyle(
          bold: true,
        );

      sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 2))
          .value = TextCellValue('Name of the Municipality:');

      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 2))
        ..value = TextCellValue(municipality)
        ..cellStyle = CellStyle(
          bold: true,
        );

      // Add the headers to the sheet
      final headers = [
        'Male',
        'Female',
        'Total',
        'Male',
        'Female',
        'Total',
        'Male',
        'Female',
        'Total',
        'Male',
        'Female',
        'Total',
        'Male',
        'Female',
        'Total',
      ];

      sheetObject
        ..merge(
          CellIndex.indexByString('A4'),
          CellIndex.indexByString('A5'),
          customValue: TextCellValue('Name'),
        )
        ..merge(
          CellIndex.indexByString('B4'),
          CellIndex.indexByString('D4'),
          customValue: TextCellValue('This Municipality'),
        )
        ..merge(
          CellIndex.indexByString('E4'),
          CellIndex.indexByString('G4'),
          customValue: TextCellValue('Other Municipalities'),
        )
        ..merge(
          CellIndex.indexByString('H4'),
          CellIndex.indexByString('J4'),
          customValue: TextCellValue('Other Province'),
        )
        ..merge(
          CellIndex.indexByString('K4'),
          CellIndex.indexByString('L4'),
          customValue: TextCellValue('Foreign Country Residence'),
        )
        ..merge(
          CellIndex.indexByString('N4'),
          CellIndex.indexByString('P4'),
          customValue: TextCellValue('Total Number of Visitors'),
        );

      //  Loop through the headers to add to the sheet
      for (var i = 0; i < headers.length; i++) {
        sheetObject
            .cell(CellIndex.indexByColumnRow(rowIndex: 4, columnIndex: i + 1))
            .value = TextCellValue(headers[i]);
      }

      final reportList = _getReportModel(
        establishmentList,
        municipality,
        dateTime,
      );

      for (var i = 0; i < reportList.recordList.length; i++) {
        final record = reportList.recordList[i];
        final rowIndex = i + 5;

        sheetObject
          ..cell(
            CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: rowIndex),
          ).value = TextCellValue(record.name)
          ..cell(
            CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: rowIndex),
          ).value = IntCellValue(record.thisMunicipalityMale)
          ..cell(
            CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: rowIndex),
          ).value = IntCellValue(record.thisMunicipalityFemale)
          ..cell(
            CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: rowIndex),
          ).value = IntCellValue(record.thisMunicipalityTotal)
          ..cell(
            CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: rowIndex),
          ).value = IntCellValue(record.otherMunicipalityMale)
          ..cell(
            CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: rowIndex),
          ).value = IntCellValue(record.otherMunicipalityFemale)
          ..cell(
            CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: rowIndex),
          ).value = IntCellValue(record.otherMunicipalityTotal)
          ..cell(
            CellIndex.indexByColumnRow(columnIndex: 7, rowIndex: rowIndex),
          ).value = IntCellValue(record.otherProvinceMale)
          ..cell(
            CellIndex.indexByColumnRow(columnIndex: 8, rowIndex: rowIndex),
          ).value = IntCellValue(record.otherProvinceFemale)
          ..cell(
            CellIndex.indexByColumnRow(columnIndex: 9, rowIndex: rowIndex),
          ).value = IntCellValue(record.otherProvinceTotal)
          ..cell(
            CellIndex.indexByColumnRow(columnIndex: 10, rowIndex: rowIndex),
          ).value = IntCellValue(record.otherCountryMale)
          ..cell(
            CellIndex.indexByColumnRow(columnIndex: 11, rowIndex: rowIndex),
          ).value = IntCellValue(record.otherCountryFemale)
          ..cell(
            CellIndex.indexByColumnRow(columnIndex: 12, rowIndex: rowIndex),
          ).value = IntCellValue(record.otherCountryTotal)
          ..cell(
            CellIndex.indexByColumnRow(columnIndex: 13, rowIndex: rowIndex),
          ).value = IntCellValue(record.totalMale)
          ..cell(
            CellIndex.indexByColumnRow(columnIndex: 14, rowIndex: rowIndex),
          ).value = IntCellValue(record.totalFemale)
          ..cell(
            CellIndex.indexByColumnRow(columnIndex: 15, rowIndex: rowIndex),
          ).value = IntCellValue(record.totalTotal);
      }

      final permStatus = await Permission.manageExternalStorage.request();

      if (permStatus.isGranted) {
        // Get the directory to save the file
        const directory = '/storage/emulated/0';

        // Create the app directory if it doesn't exist
        const appDirPath = '$directory/NaviQuezon/Reports';
        final appDir = Directory(appDirPath);
        final appDirExists = appDir.existsSync();
        if (!appDirExists) {
          await appDir.create(recursive: true);
        }

        final fileName = '${reportList.municipality} ${reportList.monthYear}';

        // Format the current date
        final formattedDate = DateFormat('yyyyMMdd_HHmmss').format(
          DateTime.now(),
        );

        // Save the file
        final filePath = '$appDirPath/$fileName-$formattedDate.xlsx';
        final file = File(filePath);
        await file.writeAsBytes(excel.encode() ?? []);

        return const Right(null);
      } else {
        return const Left(DefaultFailure(message: 'Permission denied'));
      }
    } on Exception catch (_) {
      return const Left(DefaultFailure());
    }
  }

  ReportModel _getReportModel(
    List<EstablishmentModel> establishmentList,
    String municipality,
    DateTime dateTime,
  ) {
    final recordList = <ReportRecordModel>[];
    final monthYear = DateFormat('MMMM yyyy').format(dateTime);

    for (final establishment in establishmentList) {
      final reportList = _reportList(establishment, dateTime);

      var recordModel = ReportRecordModel(
        name: establishment.name,
        thisMunicipalityMale: 0,
        thisMunicipalityFemale: 0,
        thisMunicipalityTotal: 0,
        otherMunicipalityMale: 0,
        otherMunicipalityFemale: 0,
        otherMunicipalityTotal: 0,
        otherProvinceMale: 0,
        otherProvinceFemale: 0,
        otherProvinceTotal: 0,
        otherCountryMale: 0,
        otherCountryFemale: 0,
        otherCountryTotal: 0,
        totalMale: 0,
        totalFemale: 0,
        totalTotal: 0,
      );

      //  Loop through the report list
      for (final report in reportList) {
        final reportCountry = report.country;
        final reportProvince = report.province;
        final reportMunicipality = report.municipality;

        //  Check if the country is not null
        if (reportCountry != null) {
          //  Add the total
          recordModel = recordModel.copyWith(
            totalTotal: report.total as int,
            totalMale: report.male as int,
            totalFemale: report.female as int,
          );
        }

        //  Check if the report is from the same municipality
        if (reportMunicipality == municipality) {
          recordModel = recordModel.copyWith(
            thisMunicipalityTotal: report.total as int,
            thisMunicipalityFemale: report.female as int,
            thisMunicipalityMale: report.male as int,
          );
        }

        //  Check if the report is from the same country
        if (reportCountry == sPhilippines) {
          //  Check if the report is from the same province
          if (reportProvince == sQuezonProvince) {
            //  Check if the report is from  other municipality
            if (reportMunicipality != municipality) {
              recordModel = recordModel.copyWith(
                otherMunicipalityTotal: report.total as int,
                otherMunicipalityFemale: report.female as int,
                otherMunicipalityMale: report.male as int,
              );
            }
          }
        }

        //  Check if the report is from the same country
        if (reportCountry == sPhilippines) {
          //  Check if the report is from other province
          if (reportProvince != sQuezonProvince) {
            recordModel = recordModel.copyWith(
              otherProvinceTotal: report.total as int,
              otherProvinceFemale: report.female as int,
              otherProvinceMale: report.male as int,
            );
          }
        }

        //  Check if the country is not null
        if (reportCountry != null) {
          //  Check if the report is from other country
          if (reportCountry != sPhilippines) {
            recordModel = recordModel.copyWith(
              otherCountryTotal: report.total as int,
              otherCountryFemale: report.female as int,
              otherCountryMale: report.male as int,
            );
          }
        }
      }

      //  Add the record to the list
      recordList.add(recordModel);
    }

    return ReportModel(
      municipality: municipality,
      monthYear: monthYear,
      recordList: recordList,
    );
  }

  /// Get the report list.
  ///
  List<EstablishmentReportModel> _reportList(
    EstablishmentModel establishment,
    DateTime dateTime,
  ) {
    //  Get the report list
    final reportList = <EstablishmentReportModel>[];

    //  Get the establishment report
    final reports = establishment.report ?? [];

    //  Loop through the reports
    if (reports.isNotEmpty) {
      for (final report in reports) {
        final reportDate = report.date.toUnixTime(isSeconds: true);
        final reportMonth = reportDate.month;

        //  Check if the report is from the same month
        if (dateTime.month == reportMonth) {
          reportList.add(report);
        }
      }
    }

    return reportList;
  }
}
