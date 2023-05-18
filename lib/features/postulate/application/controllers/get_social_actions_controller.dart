import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/error/failure.dart';
import '../../domain/models/social_action.dart';
import '../../providers.dart';

part 'generated/get_social_actions_controller.g.dart';

@riverpod
class GetSocialActionsController extends _$GetSocialActionsController {
  @override
  Future<List<SocialAction>> build() async {
    final socialActionsEither = await _getSocialActions();

    return socialActionsEither.fold(
      (l) => throw l,
      (r) => r,
    );
  }

  Future<Either<Failure, List<SocialAction>>> _getSocialActions() async {
    final socialActionsRepository = ref.read(socialActionsRepositoryProvider);

    final socialActionsEither =
        await socialActionsRepository.getSocialActions();

    return socialActionsEither;
  }
}
