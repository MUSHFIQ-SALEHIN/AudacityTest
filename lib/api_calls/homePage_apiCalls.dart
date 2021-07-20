import 'dart:async';
import 'dart:convert';
import 'package:audacity_test/network/base_api_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class HomeApiProvider extends BaseApiProvider {
  static const String _TRENDING_SELLERS = 'trending_seller';
  static const String _TRENDING_PRODUCTS = 'trendingProducts';
  static const String _ARRIVALS = 'newArrivals';
  static const String _SHOPS = 'newShops';
  static const String _PRODUCTS = 'stories';

  Stream<List<dynamic>> sellerList() {
    return Stream.fromFuture(getSellerList());
  }

  Stream<List<dynamic>> trendingProductsList() {
    return Stream.fromFuture(getTrendingProductList());
  }

  Stream<List<dynamic>> arrivalsList() {
    return Stream.fromFuture(getArrivalList());
  }

  Stream<List<dynamic>> shopsList() {
    return Stream.fromFuture(getShopList());
  }

  Stream<List<dynamic>> productsList() {
    return Stream.fromFuture(getProductList());
  }

  Future<List<dynamic>> getSellerList() async {
    try {
      //Response response = await getDio().get(_SELLERS);
      var file = await DefaultCacheManager().getSingleFile(
          'https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=$_TRENDING_SELLERS');
      final String response = await file.readAsString();
      var data = await json.decode(response);
      List<dynamic> list1 = data.elementAt(0);
      return list1;
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<List<dynamic>> getTrendingProductList() async {
    try {
      //Response response = await getDio().get(_PRODUCTS);
      var file = await DefaultCacheManager().getSingleFile(
          'https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=$_TRENDING_PRODUCTS');
      final String response = await file.readAsString();
      var data = await json.decode(response);
      List<dynamic> list1 = data.elementAt(0);
      return list1;
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<List<dynamic>> getArrivalList() async {
    try {
      //Response response = await getDio().get(_ARRIVALS);
      var file = await DefaultCacheManager().getSingleFile(
          'https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=$_ARRIVALS');
      final String response = await file.readAsString();
      var data = await json.decode(response);
      List<dynamic> list1 = data.elementAt(0);
      return list1;
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<List<dynamic>> getShopList() async {
    try {
      //Response response = await getDio().get(_SHOPS);
      var file = await DefaultCacheManager().getSingleFile(
          'https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=$_SHOPS');
      final String response = await file.readAsString();
      var data = await json.decode(response);
      List<dynamic> list1 = data.elementAt(0);
      return list1;
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<List<dynamic>> getProductList() async {
    try {
      //Response response = await getDio().get(_SHOPS);
      var file = await DefaultCacheManager().getSingleFile(
          'https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=$_PRODUCTS');
      final String response = await file.readAsString();
      var data = await json.decode(response);
      List<dynamic> list1 = data.elementAt(0);
      return list1;
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stackTrace: $stacktrace");
      return null;
    }
  }
}
