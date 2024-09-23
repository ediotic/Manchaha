import '../base/provider_base.dart';

class CartProvider extends ProviderBase {
  // final _apiServices = ApiServices();
  void notify() {
    notifyListeners();
  }
}
