import 'package:flutter/material.dart';

import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
export 'package:flutter_custom_dialog/flutter_custom_dialog_widget.dart';

class YYRadioListTile extends StatefulWidget {
  YYRadioListTile({
    Key key,
    this.items,
    this.activeColor,
    this.onChanged,
    this.selectedItem,
  })  : assert(items != null),
        super(key: key);

  final List<RadioItem> items;
  final Color activeColor;
  final Function(int) onChanged;
  final String selectedItem;

  @override
  State<StatefulWidget> createState() {
    return YYRadioListTileState();
  }
}

class YYRadioListTileState extends State<YYRadioListTile> {
  String selectedItem;
  int groupId = 0;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedItem;
    groupId = widget.items.indexWhere((item) => item.text?.toLowerCase() == widget.selectedItem?.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0.0),
      shrinkWrap: true,
      itemCount: widget.items.length,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          child: RadioListTile(
            title: Text(widget.items[index].text),
            value: index,
            selected: widget.items[index].text?.toLowerCase() == selectedItem?.toLowerCase(),
            groupValue: groupId,
            activeColor: widget.activeColor,
            onChanged: (int value) {
              setState(() {
                widget.onChanged(value);
                groupId = value;
                selectedItem = widget.items[value].text;
              });
            },
          ),
        );
      },
    );
  }
}
