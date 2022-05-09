import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genre_list_flutter/models/genre_response.dart';

class GenreItem extends StatefulWidget {
  final Genres genres;
  Function(int) addToList;
  Function(int) removeFromList;
  Function(bool) selectAll;

  GenreItem( this.genres, this.addToList, this.removeFromList, this.selectAll);

  @override
  State<GenreItem> createState() => _GenreItemState();
}

class _GenreItemState extends State<GenreItem> {
  String getIconGenre(Genres genres) {
    return "assets/${genres.id}.svg";
  }

  late bool selected;

  @override
  void initState() {
    super.initState();
    setState(() {
      selected = false;
      if(widget.selectAll){
        selected = true;
      }
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Ink(
      child: InkWell(
        onTap: (() {
          setState(() {
            selected = !selected;
            if (selected) {
              widget.addToList(widget.genres.id);
            } else {
              widget.removeFromList(widget.genres.id);
            }
         
          });
        }),
        borderRadius: BorderRadius.circular(25),
        child: Container(
            decoration: BoxDecoration(
                border: selected
                    ? null
                    : Border.all(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(18.0),
                color: selected ? Colors.blue : Colors.white),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            margin: EdgeInsets.only(right: 10, left: 15, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  getIconGenre(widget.genres),
                  color: selected ? Colors.white : Colors.blue,
                  width: 50,
                  height: 50,
                ),
                Text(
                  widget.genres.name,
                  style: TextStyle(
                      color: selected ? Colors.white : Colors.blue,
                      fontWeight: FontWeight.bold),
                )
              ],
            )),
      ),
    );
  }
}
