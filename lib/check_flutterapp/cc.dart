import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class SeekToView extends StatefulWidget {
  final Function(double) onDragStart;
  final Function(double) onDragEnd;
  final Function(double) onDragUpdate;
  final Function(double value) onChange;
  double value ;

  SeekToView(
      {Key key,
      this.onDragStart,
      this.onDragEnd,
      this.onDragUpdate,
      this.value,
      this.onChange})
      : super(key: key);

  @override
  _VideoProgressBarState createState() {
    return _VideoProgressBarState();
  }
}

class _VideoProgressBarState extends State<SeekToView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  void seekToRelativePosition(Offset globalPosition) {
    final box = context.findRenderObject() as RenderBox;
    final Offset tapPos = box.globalToLocal(globalPosition);
    final double relative = tapPos.dx / box.size.width;
    if (relative >= 0 && relative <= 1) {
      widget.value = relative;
      if (widget.onChange != null) {
        widget.onChange(relative);
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Container(
          height: 16,
          width: 180,
          color: Colors.transparent,
          child: CustomPaint(
            painter: _ProgressBarPainter(
              widget.value,
            ),
          ),
        ),
      ),
      onHorizontalDragStart: (DragStartDetails details) {
        if (widget.onDragStart != null) {
          widget.onDragStart(widget.value);
        }
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        seekToRelativePosition(details.globalPosition);
        if (widget.onDragUpdate != null) {
          widget.onDragUpdate(widget.value);
        }
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        if (widget.onDragEnd != null) {
          widget.onDragEnd(widget.value);
        }
      },
      onTapDown: (TapDownDetails details) {
        seekToRelativePosition(details.globalPosition);
      },
    );
  }
}

class _ProgressBarPainter extends CustomPainter {
  _ProgressBarPainter(
    this.value,
  );

  double value;

  @override
  bool shouldRepaint(CustomPainter painter) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final height = 5.0;
    Paint paint = Paint();
    paint.color = Colors.white;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromPoints(
          Offset(0.0, size.height / 2),
          Offset(size.width, size.height / 2 + height),
        ),
        Radius.circular(4.0),
      ),
      paint,
    );
    paint.color = Colors.blue;

    final double playedPart = value > 1 ? size.width : value * size.width;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromPoints(
          Offset(0.0, size.height / 2),
          Offset(playedPart, size.height / 2 + height),
        ),
        Radius.circular(4.0),
      ),
      paint,
    );
    Path path = Path()
      ..addOval(Rect.fromCircle(
          center: Offset(playedPart, size.height / 2 + height / 2),
          radius: height * 3 + 1));
  //  canvas.drawShadow(path, Colors.black26, 1, true);
    paint.color = Colors.blue;
    canvas.drawCircle(
      Offset(playedPart, size.height / 2 + height / 2),
      height * 1.5,
      paint,
    );
  }
}
