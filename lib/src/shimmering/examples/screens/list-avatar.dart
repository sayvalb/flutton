import 'package:flutter/material.dart';
import 'package:flutton/src/shimmering/helpers/helpers.dart';
import 'package:flutton/src/shimmering/shimmering.dart';
import 'package:flutton/src/shimmering/values/avatar_position.dart';
import 'package:flutton/src/shimmering/values/type_list.dart';

///
/// Simple Using FluttonShimerringListLine
///

class ListAvatarLineScreen extends StatefulWidget
    with FluttonShimmeringHelpers {
  @override
  _ListAvatarLineScreenState createState() => _ListAvatarLineScreenState();
}

class _ListAvatarLineScreenState extends State<ListAvatarLineScreen> {
  bool _loading;

  @override
  void initState() {
    _loading = true;
    _stopLoadingAfterThreeSecond();
    super.initState();
  }

  void _stopLoadingAfterThreeSecond() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Flutton Shimerring'),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: widget.determineValueByComparasion<bool, bool>(_loading, true)(
          FluttonShimmering.list(
            count: 10,
            countLine: 3,
            heightAvatar: 48,
            widthAvatar: 48,
            heightLine: 8,
            widthLine: 220,
            avatarPosition: FluttonShimmeringAvatarPosition.MIDDLE,
            radiusAvatar: 5,
            typeList: FluttonShimmeringTypeList.ITEM_AVATAR,
          ),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
