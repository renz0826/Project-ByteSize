import 'dart:io';
import 'package:path/path.dart' as p;

class OfflineBackupService {
  static const String _dbFileName = 'dentcity.db'; // exact file name of the database

  static Future<void> executeDualBackup() async { // function to clone the database to two places: C Drive and USB
    try {
      
      // Locate the windows folder
      final localEnvVars = Platform.environment;
      final homeDir = localEnvVars['USERPROFILE'] ?? localEnvVars['HOME'];
      
      if (homeDir == null) {
        print('Could not determine system home directory.');
        return;
      }

      // Find in the documents folder
      final liveDbFile = File(p.join(homeDir, 'Documents', _dbFileName));

      if (!await liveDbFile.exists()) {
        print('Live database not found at: ${liveDbFile.path}. Skipping backup sequence.');
        return;
      }

      // create the backup based on the calendar date
      final now = DateTime.now();
      final timestamp = '${now.year}_${now.month.toString().padLeft(2, '0')}_${now.day.toString().padLeft(2, '0')}';
      final backupName = 'dentcity_backup_$timestamp.db';

      // create folder in documents and name it 'Dentcity_Internal_Backups'
      final internalDir = Directory(p.join(homeDir, 'Documents', 'DentCity_Internal_Backups'));
      if (!await internalDir.exists()) {
        await internalDir.create(recursive: true);
      }
      
      // Confirmation Message
      final targetA = File(p.join(internalDir.path, backupName));
      await liveDbFile.copy(targetA.path);
      print(' Target A Secured Internally: ${targetA.path}');

      // find the folder path in the USB
      final usbDrivePath = 'D:\\DentCity_USB_Backups'; 
      final externalDir = Directory(usbDrivePath);

      // Confirmation to save to USB Drive D
      if (await externalDir.exists()) {
        final targetB = File(p.join(externalDir.path, backupName));
        await liveDbFile.copy(targetB.path);
        print('Target B Secured to USB Drive: ${targetB.path}');
      } else {
        print('External backup skipped: USB Flash Drive (D:\\) was not detected.');
      }

    } catch (e) {
      print('❌ Critical Error during offline data backup: $e');
    }
  }
}