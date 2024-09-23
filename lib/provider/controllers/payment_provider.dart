import '../base/provider_base.dart';

class PaymentProvider extends ProviderBase {
  // final _apiServices = ApiServices();
  void notify() {
    notifyListeners();
  }
}
