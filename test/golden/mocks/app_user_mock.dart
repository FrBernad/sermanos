import 'package:sermanos/features/user/domain/models/app_user_model.dart';
import 'package:sermanos/features/user/domain/models/gender.dart';

AppUser userMock = AppUser(
  id: '',
  name: '',
  surname: '',
  email: '',
  phone: '',
  gender: Gender.male,
  birthdate: DateTime.now(),
  profileImageUrl: null,
  emailContact: '',
);
