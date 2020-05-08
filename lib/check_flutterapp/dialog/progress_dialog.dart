import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///加载弹框
class ProgressDialog {
  static bool _isShowing = false;

  ///展示  {Widget child = const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.red),)}
  static void showProgress(BuildContext context) {
    if (!_isShowing) {
      _isShowing = true;
      Navigator.push(
        context,
        _PopRoute(
          child: _Progress(
            child: new Padding(
              padding: const EdgeInsets.all(12.0),
              child: new Center(
                //保证控件居中效果
                child: new SizedBox(
                  width: 120.0,
                  height: 120.0,
                  child: new Container(
                    decoration: ShapeDecoration(
                      color: Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                    ),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          strokeWidth: 4.0,
                          valueColor:
                              new AlwaysStoppedAnimation(Colors.black38),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                          ),
                          child: new Text(
                            "加载中...",
                            style: new TextStyle(
                                fontSize: ScreenUtil().setSp(32),
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  ///隐藏
  static void hideProgress(BuildContext context) {
    if (_isShowing) {
      Navigator.of(context).pop();
      _isShowing = false;
    }
  }
}

///Widget
class _Progress extends StatelessWidget {
  final Widget child;

  _Progress({
    Key key,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Center(
          child: child,
        ));
  }
}

///Route
class _PopRoute extends PopupRoute {
  final Duration _duration = Duration(milliseconds: 300);
  Widget child;

  _PopRoute({@required this.child});

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}
