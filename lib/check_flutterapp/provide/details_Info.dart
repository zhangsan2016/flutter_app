
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutterapp/check_flutterapp/entity/details_model.dart';
import 'package:flutterapp/check_flutterapp/service/service_method.dart';

class DetailsInfoProvide with ChangeNotifier {
  DetailsModel goodsInfo = null;

  bool isLeft = true;
  bool isRight = false;

//从后台获取商品信息

  getGoodsInfo(String id) async {
  /*  var formData = {
      'goodId': id,
    };

 await  request('getGoodDetailById', formData: formData).then((val) {
      var responseData = json.decode(val.toString());
      print(responseData);
      goodsInfo = DetailsModel.fromJson(responseData);
      notifyListeners();
    });*/

  await  checkData();

  }

  //改变tabBar的状态
  changeLeftAndRight(String changeState){
    if(changeState=='left'){
      isLeft=true;
      isRight=false;
    }else{
      isLeft=false;
      isRight=true;
    }
    notifyListeners();

  }


  void checkData() {
   // var data = '{\"code\": \"0\", \"message\": \"success\", 	\"data\": { 		\"goodInfo\": { 			\"image5\": \"\", 			\"amount\": 10000, 			\"image3\": \"\", 			\"image4\": \"\", 			\"goodsId\": \"ed675dda49e0445fa769f3d8020ab5e9\", 			\"isOnline\": \"yes\", 			\"image1\": \"http://images.baixingliangfan.cn/shopGoodsImg/20190116/20190116162618_2924.jpg\", 			\"image2\": \"\", 			\"goodsSerialNumber\": \"6928804011173\", 			\"oriPrice\": 3.00, 			\"presentPrice\": 2.70, 			\"comPic\": \"http://images.baixingliangfan.cn/compressedPic/20190116162618_2924.jpg\", 			\"state\": 1, 			\"shopId\": \"402880e860166f3c0160167897d60002\", 			\"goodsName\": \"可口可乐500ml/瓶\", 			\"goodsDetail\": \"<img src=\\\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081109_5060.jpg\\\" width=\\\"100%\\\" height=\\\"auto\\\" alt=\\\"\\\" /><img src=\\\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081109_1063.jpg\\\" width=\\\"100%\\\" height=\\\"auto\\\" alt=\\\"\\\" /><img src=\\\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081110_8029.jpg\\\" width=\\\"100%\\\" height=\\\"auto\\\" alt=\\\"\\\" /><img src=\\\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081110_1074.jpg\\\" width=\\\"100%\\\" height=\\\"auto\\\" alt=\\\"\\\" /><img src=\\\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081110_8439.jpg\\\" width=\\\"100%\\\" height=\\\"auto\\\" alt=\\\"\\\" /><img src=\\\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081110_6800.jpg\\\" width=\\\"100%\\\" height=\\\"auto\\\" alt=\\\"\\\" />\" 		}, 		\"goodComments\": [{ 			\"SCORE\": 5, 			\"comments\": \"果断卸载，2.5个小时才送到\", 			\"userName\": \"157******27\", 			\"discussTime\": 1539491266336 		}], 		\"advertesPicture\": { 			\"PICTURE_ADDRESS\": \"http://images.baixingliangfan.cn/advertesPicture/20190113/20190113134955_5825.jpg\", 			\"TO_PLACE\": \"1\" 		} 	} }
    var data = '{\"code\": \"0\", \"message\": \"success\", 	\"data\": { 		\"goodInfo\": { 			\"image5\": \"\", 			\"amount\": 10000, 			\"image3\": \"\", 			\"image4\": \"\", 			\"goodsId\": \"ed675dda49e0445fa769f3d8020ab5e1\", 			\"isOnline\": \"yes\", 			\"image1\": \"http://images.baixingliangfan.cn/shopGoodsImg/20190116/20190116162618_2924.jpg\", 			\"image2\": \"\", 			\"goodsSerialNumber\": \"6928804011173\", 			\"oriPrice\": 3.00, 			\"presentPrice\": 2.70, 			\"comPic\": \"http://images.baixingliangfan.cn/compressedPic/20190116162618_2924.jpg\", 			\"state\": 1, 			\"shopId\": \"402880e860166f3c0160167897d60002\", 			\"goodsName\": \"可口可乐500ml/瓶\", 			\"goodsDetail\": \"<img src=\\\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081109_5060.jpg\\\" width=\\\"100%\\\" height=\\\"auto\\\" alt=\\\"\\\" /><img src=\\\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081109_1063.jpg\\\" width=\\\"100%\\\" height=\\\"auto\\\" alt=\\\"\\\" /><img src=\\\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081110_8029.jpg\\\" width=\\\"100%\\\" height=\\\"auto\\\" alt=\\\"\\\" /><img src=\\\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081110_1074.jpg\\\" width=\\\"100%\\\" height=\\\"auto\\\" alt=\\\"\\\" /><img src=\\\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081110_8439.jpg\\\" width=\\\"100%\\\" height=\\\"auto\\\" alt=\\\"\\\" /><img src=\\\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081110_6800.jpg\\\" width=\\\"100%\\\" height=\\\"auto\\\" alt=\\\"\\\" />\" 		}, 		\"goodComments\": [{ 			\"SCORE\": 5, 			\"comments\": \"果断卸载，2.5个小时才送到\", 			\"userName\": \"157******27\", 			\"discussTime\": 1539491266336 		}], 		\"advertesPicture\": { 			\"PICTURE_ADDRESS\": \"http://images.baixingliangfan.cn/advertesPicture/20190113/20190113134955_5825.jpg\", 			\"TO_PLACE\": \"1\" 		} 	} }';
    var responseData = json.decode(data);
    goodsInfo = DetailsModel.fromJson(responseData);
 //   print(responseData.toString());
  }
}
