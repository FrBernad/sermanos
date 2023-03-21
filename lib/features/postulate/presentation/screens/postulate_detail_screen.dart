import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sermanos/config/theme/app_colors.dart';
import 'package:sermanos/config/theme/app_text_styles.dart';
import 'package:sermanos/features/postulate/presentation/widgets/postulation_confirmation_dialog.dart';

class PostulateDetailScreen extends HookConsumerWidget {
  static const route = "/postulate/:id";

  static String routeFromId(String id) => '/postulate/$id';

  static const routeName = "postulateDetail";

  const PostulateDetailScreen({
    Key? key,
    required this.postulateId,
  }) : super(key: key);

  final String postulateId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String imageUrl =
        "https://s3-alpha-sig.figma.com/img/6160/48a8/56fafc1f797d16aeaaa7f76477bdc239?Expires=1680480000&Signature=aWk2j9v609VGMNfCiuM6N0PDksdpCRH0KWj-Rj-8qa5uVsQkaI1vbK-X2lsoV7mnnA3hj-jwaHwb89cBig-KdkIdRUIBsbBpdBHp9pA-7Hzi9vxEkI622c6D2UoI9vrDHAtlUUVyxtyWqom3i9GpXWpjQXzdMww3UIGx8F52PK6bIv5tVcVP1~Jqx0UD0vUE34Yh04ONKE1820jWxcHOAq9oTJShXH3PPBUN90rC6VFRMgonQDnRjYEoM4lpvOOSrfRdOefd3yyFzfs8tDOJ64lve1SA6fQ9baeVRWRrkMzyrbVkqzJEdRSZ7I9jWB0kick3-77ieLNf94Ti-WXFbQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4";

    useEffect(() {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersive,
      );
      return () {
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual,
          overlays: SystemUiOverlay.values,
        );
      };
    }, []);

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Image(
                image: NetworkImage(imageUrl),
                height: 243,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                      stops: [0.0, 0.3555],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 24,
                left: 24,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.neutral0,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 32),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Un Techo para mi País',
                        style: AppTextStyles.headline01,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'A dos horas al sur de Vicente López en la ciudad de Buenos Aires.',
                        style: AppTextStyles.body01.copyWith(
                          color: AppColors.neutral75,
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FilledButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.primary100),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 8,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          final bool? confirmed =
                              await _showConfirmationDialog(context);
                        },
                        child: Text(
                          'Postularme',
                          style: AppTextStyles.button.copyWith(
                            color: AppColors.neutral0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 56),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> _showConfirmationDialog(BuildContext context) async {
    return await showDialog<bool?>(
      barrierDismissible: false,
      // barrierColor: AppColors.neutral0.withOpacity(0.1),
      context: context,
      builder: (BuildContext c) {
        return PostulationConfirmationDialog();
      },
    );
  }
}
