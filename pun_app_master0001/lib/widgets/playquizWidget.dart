

import 'package:flutter/material.dart';

class OptionTile extends StatefulWidget {
  final String option, description, correctAnsweer, optionSelected;
  OptionTile({@required this.option, @required this. description, @required this.correctAnsweer, @required this.optionSelected});
  
  @override
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: widget.description == widget.optionSelected ? widget.optionSelected == widget.correctAnsweer ? 
              Colors.green.withOpacity(0.7) : Colors.red.withOpacity(0.7) : Colors.grey, width: 3), 
            borderRadius: BorderRadius.circular(40)
            ),
            alignment: Alignment.center,
            child: Text("${widget.option}", style: TextStyle(
              color: widget.optionSelected == widget.description ?
              widget.correctAnsweer == widget.optionSelected ? Colors.green.withOpacity(0.7) :
              Colors.red.withOpacity(0.7) : Colors.black54
            ),),
          ),
          SizedBox(width: 8,),
          Text(widget.description, style: TextStyle(fontSize: 17, color: Colors.black54),)

        ],
      ),
    );
  }
}