import '../base/provider_base.dart';

class HomeProvider extends ProviderBase {
  // final _apiServices = ApiServices();
  void notify() {
    notifyListeners();
  }
}
