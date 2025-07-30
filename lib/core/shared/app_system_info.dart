import '../../data/models/app_info.dart';
import '../../data/plugins/app_package_info.dart';

class AppSystemInfo {
  static AppSystemInfo? _instance;

  static Future<AppSystemInfo> initialize(AppPackageInfo appPackageInfo) async {
    return _instance ??= AppSystemInfo._(
      await _initialize(appPackageInfo),
    );
  }

  AppSystemInfo._(this._appInfo);

  static Future<AppInfo> _initialize(AppPackageInfo appPackageInfo) async {
    final version = await appPackageInfo.getAppVersion();
    final versionCode = await appPackageInfo.getAppVersionCode();

    return AppInfo(
      appVersionInfo: AppVersionInfo(
        appVersionName: version,
        appVersionCode: versionCode,
      ),
    );
  }

  late final AppInfo _appInfo;

  static AppInfo? get appInfo => _instance?._appInfo;
}