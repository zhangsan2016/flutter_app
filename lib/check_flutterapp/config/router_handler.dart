

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapp/check_flutterapp/pages/details_page/details_page.dart';


var detailsHandler = Handler(handlerFunc:(BuildContext context,Map<String, dynamic> params){
  return DetailsPage(params["id"][0]);
});



/*  Handler detailsHanderl=Handler(
        handlerFunc:(BuildContext context,Map<String, List<String>>params){
        String goodsId=params['id'].first;
        print('index>details goodsID is ${goodsId}');
        return DetailsPage(goodsId);

        }
        );*/
