import 'dart:async';

import 'package:audacity_test/api_calls/homePage_apiCalls.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  HomeApiProvider _homeApiProvider = HomeApiProvider();
  CompositeSubscription _compositeSubscription = CompositeSubscription();

  final sellersController = BehaviorSubject<List<dynamic>>();
  Stream<List<dynamic>> get sellerStream => sellersController.stream;

  final trendingProductsController = BehaviorSubject<List<dynamic>>();
  Stream<List<dynamic>> get trendingProductStream =>
      trendingProductsController.stream;

  final arrivalController = BehaviorSubject<List<dynamic>>();
  Stream<List<dynamic>> get arrivalrStream => arrivalController.stream;

  final shopController = BehaviorSubject<List<dynamic>>();
  Stream<List<dynamic>> get shopStream => shopController.stream;

  final productsController = BehaviorSubject<List<dynamic>>();
  Stream<List<dynamic>> get productStream => productsController.stream;

  void loadSellerList() {
    StreamSubscription subscription =
        _homeApiProvider.sellerList().listen((List<dynamic> sellers) {
      sellersController.add(sellers);
    });
    _compositeSubscription.add(subscription);
  }

  void loadTrendingProductsList() {
    StreamSubscription subscription = _homeApiProvider
        .trendingProductsList()
        .listen((List<dynamic> products) {
      trendingProductsController.add(products);
    });
    _compositeSubscription.add(subscription);
  }

  void loadArrivalList() {
    StreamSubscription subscription =
        _homeApiProvider.arrivalsList().listen((List<dynamic> arrivals) {
      arrivalController.add(arrivals);
    });
    _compositeSubscription.add(subscription);
  }

  void loadShopList() {
    StreamSubscription subscription =
        _homeApiProvider.shopsList().listen((List<dynamic> shops) {
      shopController.add(shops);
    });
    _compositeSubscription.add(subscription);
  }

  void loadProductList() {
    StreamSubscription subscription =
        _homeApiProvider.productsList().listen((List<dynamic> products) {
      productsController.add(products);
    });
    _compositeSubscription.add(subscription);
  }

  void dispose() {
    _compositeSubscription.clear();
    sellersController.close();
    trendingProductsController.close();
    productsController.close();
    shopController.close();
    arrivalController.close();
  }
}
