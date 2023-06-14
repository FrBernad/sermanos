import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/features/postulate/providers.dart';
import 'package:sermanos/features/user/domain/models/app_user_model.dart';
import 'package:sermanos/features/user/providers.dart';

part 'generated/postulate_controller.g.dart';

@riverpod
class PostulateController extends _$PostulateController {
  @override
  Future<void> build() async {}

  Future<void> subscribeToVolunteering({
    required String volunteeringId,
  }) async {
    state = const AsyncLoading();

    final AppUser currentUser = ref.read(currentUserProvider)!;

    final userDataEither =
        await ref.read(volunteeringRepositoryProvider).subscribeToVolunteering(
              user: currentUser,
              volunteeringId: volunteeringId,
            );

    state = userDataEither.fold(
      (l) => AsyncValue.error(l.toString(), StackTrace.current),
      (_) {
        return const AsyncValue.data(null);
      },
    );
  }
//
// Future<void> unsuscribeFromVolunteering({
//   required String volunteeringId,
// }) async {
//   state = const AsyncLoading();
//
//   final AppUser currentUser = ref.read(currentUserProvider)!;
//
//   final userDataEither = await ref
//       .read(volunteeringRepositoryProvider)
//       .unsuscribeFromVolunteeringById(
//           user: currentUser, volunteeringId: volunteeringId);
//
//   state = userDataEither.fold(
//     (l) => AsyncValue.error(l.toString(), StackTrace.current),
//     (user) {
//       return const AsyncValue.data(null);
//     },
//   );
// }
//
// Future<void> getPostulationStatus({
//   required String volunteeringId,
// }) async {
//   state = const AsyncLoading();
//
//   final AppUser currentUser = ref.read(currentUserProvider)!;
//
//   final userDataEither = await ref
//       .read(volunteeringRepositoryProvider)
//       .getPostulationByVolunteeringId(
//           user: currentUser, volunteeringId: volunteeringId);
//
//   state = userDataEither.fold(
//     (l) => AsyncValue.error(l.toString(), StackTrace.current),
//     (user) {
//       return const AsyncValue.data(null);
//     },
//   );
// }
//
// Future<void> getCurrentSubscribedVolunteeringByUserId() async {
//   state = const AsyncLoading();
//
//   final AppUser currentUser = ref.read(currentUserProvider)!;
//
//   final userDataEither = await ref
//       .read(volunteeringRepositoryProvider)
//       .getCurrentSuscribedVolunteeringsByUserId(userId: currentUser.id);
//
//   state = userDataEither.fold(
//     (l) => AsyncValue.error(l.toString(), StackTrace.current),
//     (user) {
//       return const AsyncValue.data(null);
//     },
//   );
// }
}
