//Thisnis the class used by the rest of your  codebase
import 'package:mobx/mobx.dart';
import 'package:package_info/package_info.dart';

part "app.state.g.dart";

class AppState = _AppState with _$AppState;

//This is your store class
abstract class _AppState with Store {
  @observable
  String appName;

  @observable
  String packageName;

  @observable
  String version;

  @observable
  String buildNumber;

  @observable
  int num = 0;

  @observable
  double deviceWidth = 0;

  @observable
  bool isLoading = false;

  // computed props
  @computed
  Future<PackageInfo> get appInfo async => await PackageInfo.fromPlatform();

  // Actions
  @action
  void setLoading(bool status) {
    isLoading = status;
  }

  @action
  void setPackageInfo() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      appName = packageInfo.appName;
      packageName = packageInfo.packageName;
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    });
  }
}
