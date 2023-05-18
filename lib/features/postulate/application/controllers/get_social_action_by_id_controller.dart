import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sermanos/features/postulate/domain/models/social_action.dart';

import '../../providers.dart';

part 'generated/get_social_action_by_id_controller.g.dart';

@riverpod
Future<SocialAction> getSocialActionByIdController(
  GetSocialActionByIdControllerRef ref, {
  required String socialActionId,
}) async {
  final socialActionRepository = ref.read(socialActionsRepositoryProvider);

  final socialActionEither = await socialActionRepository.getSocialActionById(
      socialActionId: socialActionId);

  return socialActionEither.fold((l) => throw Exception(l.message), (r) => r);
}
