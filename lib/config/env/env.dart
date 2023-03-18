import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Env {
  late final String appBaseUrl;
  late final String apiBaseUrl;
  late final String socketApiBaseUrl;
  late final String eternalRoomId;
  late final String chatExpirationTime;
  late final String discordClientId;
  late final String discordClientSecret;
  late final String twitchClientId;
  late final String twitchClientSecret;
}

class EnvImpl implements Env {
  @override
  String appBaseUrl = dotenv.get('APP_BASE_URL');

  @override
  String apiBaseUrl = Platform.isAndroid
      ? dotenv.get('ANDROID_API_BASE_URL')
      : dotenv.get('IOS_API_BASE_URL');

  @override
  String socketApiBaseUrl = Platform.isAndroid
      ? dotenv.get('ANDROID_SOCKET_API_BASE_URL')
      : dotenv.get('IOS_SOCKET_API_BASE_URL');

  @override
  String chatExpirationTime = dotenv.get("CHAT_EXPIRATION_TIME");

  @override
  String discordClientId = dotenv.get("DISCORD_CLIENT_ID");

  @override
  String discordClientSecret = dotenv.get("DISCORD_CLIENT_SECRET");

  @override
  String eternalRoomId = dotenv.get("ETERNAL_ROOM_ID");

  @override
  String twitchClientId = dotenv.get("TWITCH_CLIENT_ID");

  @override
  String twitchClientSecret = dotenv.get("TWITCH_CLIENT_SECRET");
}

final env = EnvImpl();
