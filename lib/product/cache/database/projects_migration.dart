import 'package:core/core.dart';
import 'package:sqflite_common/sqlite_api.dart';

class ProjectsMigration extends Migration {
  @override
  int get version => 1; // Initial version for the Projects table migration

  @override
  Future<void> up(Transaction txn) async {
    // This method creates the 'PROJELER' table in the local Sqflite database.
    // Column names are aligned with the aliases used in your SQL SELECT query for consistency.
    await txn.execute(
      DatabaseHelper.createTableSql(
        'PROJELER', // The table name in Sqflite.
        {
          // Column definitions using the preferred aliased names
          'id': String, // Corresponds to pro_Guid AS id (GUIDs stored as String)
          'code': String, // Corresponds to pro_kodu AS code
          'name': String, // Corresponds to pro_adi AS name
          'customerCode': String, // Corresponds to pro_musterikodu AS customerCode
          'ownerCode': String, // Corresponds to pro_somerkodu AS ownerCode
          'documentCode': String, // Corresponds to pro_belgekodu AS documentCode
          'sectorCode': String, // Corresponds to pro_sektorkodu AS sectorCode
          'groupCode': String, // Corresponds to pro_grupkodu AS groupCode
          'status': int, // Corresponds to pro_durumu AS status
          'description': String, // Corresponds to pro_aciklama AS description
          'mainProjectCode': String, // Corresponds to pro_ana_projekodu AS mainProjectCode
          'plannedDuration': int, // Corresponds to pro_planlanan_sure AS plannedDuration (assuming integer duration)
          'plannedStartDate': String, // Corresponds to pro_planlanan_bastarih AS plannedStartDate
          'plannedEndDate': String, // Corresponds to pro_planlanan_bittarih AS plannedEndDate
          'actualStartDate': String, // Corresponds to pro_gerceklesen_bastarih AS actualStartDate
          'actualEndDate': String, // Corresponds to pro_gerceklesen_bittarih AS actualEndDate
          'startDelayReason': String, // Corresponds to pro_baslangic_gecikmesebep AS startDelayReason
          'endDelayReason': String, // Corresponds to pro_bitis_gecikmesebep AS endDelayReason
          'createdBy': int, // Corresponds to pro_create_user AS createdBy
          'createdAt': String, // Corresponds to pro_create_date AS createdAt
          'updatedBy': int, // Corresponds to pro_lastup_user AS updatedBy
          'updatedAt': String, // Corresponds to pro_lastup_date AS updatedAt
        },
        'id', // 'id' column is now the PRIMARY KEY for this local table.
        // autoIncrement is not needed here as 'id' will be a GUID string.
      ),
    );
    AppLogger.info('ProjectsMigration: PROJELER table successfully created with aliased columns.');
  }

  @override
  Future<void> down(Transaction txn) async {
    // This method handles the dropping (deletion) of the 'PROJELER' table.
    await txn.execute('DROP TABLE IF EXISTS PROJELER');
    AppLogger.info('ProjectsMigration: PROJELER table dropped.');
  }
}
