import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/providers.g.dart';

///
/// Application dependencies
///
@riverpod
Future<PermissionStatus> galleryPermission(
  GalleryPermissionRef ref,
) async =>
    await Permission.photos.status;

@riverpod
Future<PermissionStatus> eventPermission(
  EventPermissionRef ref,
) async =>
    await Permission.appTrackingTransparency.status;
