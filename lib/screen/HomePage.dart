import 'package:audacity_test/CustomWidgets/NewArrivalsGrid.dart';
import 'package:audacity_test/CustomWidgets/NewShopsGrid.dart';
import 'package:audacity_test/CustomWidgets/ProductsList.dart';
import 'package:audacity_test/CustomWidgets/TrendingProductsGrid.dart';
import 'package:audacity_test/CustomWidgets/TrendingSellersGrid.dart';
import 'package:audacity_test/bloc/seller_bloc.dart';
import 'package:audacity_test/responseModels/NewArrival.dart';
import 'package:audacity_test/responseModels/NewShop.dart';
import 'package:audacity_test/responseModels/Products.dart';
import 'package:audacity_test/responseModels/TrendingProducts.dart';
import 'package:audacity_test/responseModels/TrendingSellers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _controller;
  HomeBloc _homeBloc;
  int _index = 0;
  @override
  void initState() {
    _controller = ScrollController();
    _homeBloc = HomeBloc();
    _homeBloc.loadSellerList();
    _homeBloc.loadTrendingProductsList();
    _homeBloc.loadArrivalList();
    _homeBloc.loadShopList();
    _homeBloc.loadProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        controller: _controller,
        shrinkWrap: true,
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Trending Sellers",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 2),
                    child: buildSellersList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Trending Products",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 2),
                    child: buildTrendingProductsList(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 2),
                    child: buildLimitedProductList(0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "New Arrivals",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 2),
                    child: buildArrivalsList(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 2),
                    child: buildLimitedProductList(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "New Shops",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 2),
                    child: buildShopList(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 2),
                    child: buildProductList(6),
                  ),
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }

  Widget buildSellersList() {
    return StreamBuilder(
      stream: _homeBloc.sellerStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<dynamic> sellerList = snapshot.data;
          return Container(
            height: 170,
            child: Center(
              child: GridView.builder(
                  shrinkWrap: false,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.5,
                    crossAxisCount: 1,
                    mainAxisSpacing: 0,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TrendingSellersGrid(
                          profileUrl: TrendingSellers.fromJson(
                                  sellerList.elementAt(index))
                              .sellerProfilePhoto,
                          bannerUrl: TrendingSellers.fromJson(
                                  sellerList.elementAt(index))
                              .sellerItemPhoto,
                          title: TrendingSellers.fromJson(
                                  sellerList.elementAt(index))
                              .sellerName,
                        ),
                      ),
                  itemCount: sellerList.length,
                  padding: new EdgeInsets.symmetric(vertical: 2)),
            ),
          );
        } else if (snapshot.hasError) {
          debugPrint(snapshot.error);
          return Center(child: CircularProgressIndicator());
        } else
          return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildTrendingProductsList() {
    return StreamBuilder(
      stream: _homeBloc.trendingProductStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<dynamic> productList = snapshot.data;
          return Container(
            height: 170,
            child: Center(
              child: GridView.builder(
                  shrinkWrap: false,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.5,
                    crossAxisCount: 1,
                    mainAxisSpacing: 0,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => TrendingProductGrid(
                        profileUrl: TrendingProducts.fromJson(
                                productList.elementAt(index))
                            .productImage,
                        price: TrendingProducts.fromJson(
                                productList.elementAt(index))
                            .unitPrice
                            .toString(),
                        title: TrendingProducts.fromJson(
                                productList.elementAt(index))
                            .productName,
                      ),
                  itemCount: productList.length,
                  padding: new EdgeInsets.symmetric(vertical: 2)),
            ),
          );
        } else if (snapshot.hasError) {
          debugPrint(snapshot.error);
          return Center(child: CircularProgressIndicator());
        } else
          return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildArrivalsList() {
    return StreamBuilder(
      stream: _homeBloc.arrivalrStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<dynamic> arrivalList = snapshot.data;
          return Container(
            height: 170,
            child: Center(
              child: GridView.builder(
                  shrinkWrap: false,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.5,
                    crossAxisCount: 1,
                    mainAxisSpacing: 0,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => NewArrivalGrid(
                          profileUrl:
                              NewArrivals.fromJson(arrivalList.elementAt(index))
                                  .productImage,
                          price:
                              NewArrivals.fromJson(arrivalList.elementAt(index))
                                  .unitPrice
                                  .toString(),
                          title:
                              NewArrivals.fromJson(arrivalList.elementAt(index))
                                  .productName,
                        ),
                  itemCount: arrivalList.length,
                  padding: new EdgeInsets.symmetric(vertical: 2)),
            ),
          );
        } else if (snapshot.hasError) {
          debugPrint(snapshot.error);
          return Center(child: CircularProgressIndicator());
        } else
          return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildShopList() {
    return StreamBuilder(
      stream: _homeBloc.shopStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<dynamic> shopList = snapshot.data;
          return Container(
            height: 170,
            child: Center(
              child: GridView.builder(
                  shrinkWrap: false,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.5,
                    crossAxisCount: 1,
                    mainAxisSpacing: 0,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NewShopsGrid(
                          profileUrl:
                              NewShops.fromJson(shopList.elementAt(index))
                                  .sellerProfilePhoto,
                          bannerUrl:
                              NewShops.fromJson(shopList.elementAt(index))
                                  .sellerItemPhoto,
                          title: NewShops.fromJson(shopList.elementAt(index))
                              .sellerName,
                        ),
                      ),
                  itemCount: shopList.length,
                  padding: new EdgeInsets.symmetric(vertical: 2)),
            ),
          );
        } else if (snapshot.hasError) {
          debugPrint(snapshot.error);
          return Center(child: CircularProgressIndicator());
        } else
          return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildLimitedProductList(int items) {
    return StreamBuilder(
      stream: _homeBloc.productStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<dynamic> productList = snapshot.data;
          return Container(
            height: 950,
            child: Center(
              child: ListView.builder(
                  shrinkWrap: false,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    print(index + items);
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ProductsListItem(
                        bannerUrl: Products.fromJson(
                                productList.elementAt(index + items))
                            .storyImage,
                        title: Products.fromJson(
                                productList.elementAt(index + items))
                            .shopName,
                        description: Products.fromJson(
                                productList.elementAt(index + items))
                            .story,
                        imageUrl: Products.fromJson(
                                productList.elementAt(index + items))
                            .companyLogo,
                        orderItems: Products.fromJson(
                                productList.elementAt(index + items))
                            .orderQty
                            .toString(),
                        price: Products.fromJson(
                                productList.elementAt(index + items))
                            .unitPrice
                            .toString(),
                        stock: Products.fromJson(
                                productList.elementAt(index + items))
                            .availableStock
                            .toString(),
                        time: Products.fromJson(
                                productList.elementAt(index + items))
                            .friendlyTimeDiff,
                      ),
                    );
                  },
                  itemCount: 3,
                  padding: new EdgeInsets.symmetric(vertical: 2)),
            ),
          );
        } else if (snapshot.hasError) {
          debugPrint(snapshot.error);
          return Center(child: CircularProgressIndicator());
        } else
          return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildProductList(int items) {
    return StreamBuilder(
      stream: _homeBloc.productStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<dynamic> productList = snapshot.data;
          return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                print(index + items);
                return Padding(
                  padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 0.0),
                  child: ProductsListItem(
                    bannerUrl:
                        Products.fromJson(productList.elementAt(index + items))
                            .storyImage,
                    title:
                        Products.fromJson(productList.elementAt(index + items))
                            .shopName,
                    description:
                        Products.fromJson(productList.elementAt(index + items))
                            .story,
                    imageUrl:
                        Products.fromJson(productList.elementAt(index + items))
                            .companyLogo,
                    orderItems:
                        Products.fromJson(productList.elementAt(index + items))
                            .orderQty
                            .toString(),
                    price:
                        Products.fromJson(productList.elementAt(index + items))
                            .unitPrice
                            .toString(),
                    stock:
                        Products.fromJson(productList.elementAt(index + items))
                            .availableStock
                            .toString(),
                    time:
                        Products.fromJson(productList.elementAt(index + items))
                            .friendlyTimeDiff,
                  ),
                );
              },
              itemCount: productList.length - items,
              padding: new EdgeInsets.symmetric(vertical: 2));
        } else if (snapshot.hasError) {
          debugPrint(snapshot.error);
          return Center(child: CircularProgressIndicator());
        } else
          return Center(child: CircularProgressIndicator());
      },
    );
  }
}