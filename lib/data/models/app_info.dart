class AppInfo {
  final AppVersionInfo appVersionInfo;

  AppInfo({required this.appVersionInfo});

  @override
  String toString() => 'AppInfo{'
      'appVersionInfo: $appVersionInfo'
      '}';
}

class AppVersionInfo {
  final String appVersionName;
  final String appVersionCode;

  AppVersionInfo({required this.appVersionName, required this.appVersionCode});

  @override
  String toString() => 'AppVersionInfo{'
      'appVersionName: $appVersionName, '
      'appVersionCode: $appVersionCode'
      '}';
}