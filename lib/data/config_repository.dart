import 'package:firebase_remote_config/firebase_remote_config.dart';

abstract class _ConfigFields {
  static const darkTheme = 'dark_theme';
}

class ConfigRepository {
  const ConfigRepository(this._remoteConfig);

  final FirebaseRemoteConfig _remoteConfig;

  bool get useDarkTheme => _remoteConfig.getBool(_ConfigFields.darkTheme);

  Future<void> init() async {
    _remoteConfig.setDefaults({
      _ConfigFields.darkTheme: false,
    });

    await _remoteConfig.fetchAndActivate();
  }

  Future<void> changeTheme() async {
    // _remoteConfig.setConfigSettings(remoteConfigSettings)
  }
}
