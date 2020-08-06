import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/check_flutterapp/provide/cart.dart';
import 'package:provider/provider.dart';

import 'cart_bottom.dart';
import 'cart_item.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: FutureBuilder(
        future: _getCartInfo(context),
        builder: (context, snapshot) {
            List cartList = Provider.of<CartProvide>(context, listen: false).cartList;
          if (snapshot.hasData) {
            return Stack(
              children: <Widget>[
                Consumer<CartProvide>(builder: (context,counter,_){
                   cartList = Provider.of<CartProvide>(context, listen: false).cartList;
                  return    ListView.builder(
                      itemCount: cartList.length,
                      itemBuilder: (context, index) {
                        return CartItem(cartList[index]);
                      });
                }),

                Positioned(
                  bottom: 0,
                  left: 0,
                  child: CartBottom(),
                )
              ],
            );

            /*     return ListView.builder(
                itemCount: cartList.length,
                itemBuilder: (context, index) {
                  return  CartItem(cartList[index]);
                });*/

          } else {
            return Text('正在加载...');
          }
        },
      ),
    );
  }

  Future<String> _getCartInfo(BuildContext context) async {
    await Provider.of<CartProvide>(context, listen: false).getCartInfo();
    return 'end';
  }
}
