import 'package:flutter/material.dart';
import 'package:genre_list_flutter/bloc/genre_bloc.dart';
import 'package:genre_list_flutter/models/genre_response.dart';
import 'package:genre_list_flutter/repository/genre_repository/genre_repository.dart';
import 'package:genre_list_flutter/repository/genre_repository/genre_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genre_list_flutter/ui/screens/errors/error_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genre_list_flutter/ui/screens/genre_item.dart';
import 'package:genre_list_flutter/ui/screens/genres_selected.dart';

class GenreSelectionScreen extends StatefulWidget {
  @override
  State<GenreSelectionScreen> createState() => _GenreSelectionScreenState();
}

class _GenreSelectionScreenState extends State<GenreSelectionScreen> {
  late GenreRepository genreRepository;
  int selectedIndex = -1;

  late bool selected;
  bool _enabled = false;
  late List<int> idsSelected = [];

  addToList(genreSelectedId) {
    setState(() {
      idsSelected.add(genreSelectedId);
    });
  }

  removeFromList(genreSelectedId) {
    setState(() {
      idsSelected.remove(genreSelectedId);
    });
  }

  selectAll(bool){
    selected = true;
  }

  String getIconGenre(Genres genres) {
    return "assets/${genres.id}.svg";
  }

  @override
  void initState() {
    super.initState();
    selected = false;
    genreRepository = GenreRepositoryImpl();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _onpressed;
    late bool isButtonActive;
    if (_enabled) {
      _onpressed;
    }
    return BlocProvider(
      create: (context) {
        return GenreBloc(genreRepository)..add(FetchGenre());
      },
      child: Scaffold(body: _createGenre(context)),
    );
  }

  Widget _createGenre(BuildContext context) {
    return BlocBuilder<GenreBloc, GenresState>(builder: (context, state) {
      if (state is GenresInitial) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is GenreFetchError) {
        return ErrorPage(
          message: state.message,
          retry: () {
            context.watch<GenreBloc>().add(FetchGenre());
          },
        );
      } else if (state is GenresFetched) {
        return _createGenreView(context, state.genres);
      } else {
        return const Text('Not support');
      }
    });
  }

  Widget _createGenreView(BuildContext context, List<Genres> genres) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 20.0, right: 16.0),
          height: 48.0,
          child: Row(
            children: [
              const Icon(Icons.arrow_back, color: Colors.blue),
              const Expanded(
                flex: 1,
                child: Text(
                  '   Select Your Interest',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontFamily: 'Muli',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.focused))
                      return Colors.red;
                    return null; // Defer to the widget's default.
                  }),
                ),
                onPressed:() => setState(() {

                  selectAll(true);
                }),
                child: Text('Select All'),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 0),
          height: 490,
          child: GridView.builder(
            addAutomaticKeepAlives: true,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return GenreItem(
                   genres[index], addToList, removeFromList, );
            },
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20),
            scrollDirection: Axis.vertical,
            itemCount: genres.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          ),
        ),
        ElevatedButton(
            child: Container(
                width: 300,
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                )),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 39, 61, 184)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ))),
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GenresSelected(
                      idsSelected: idsSelected,
                    ),
                  ),
                ))
      ],
    );
  }

  Widget _createGenresViewItem(BuildContext context, Genres genres) {
    return Ink(
      child: InkWell(
        onTap: (() {
          setState(() {
            selected = !selected;
          });
        }),
        borderRadius: BorderRadius.circular(25),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                color: selected ? Colors.blue : Colors.white),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            margin: EdgeInsets.only(right: 10, left: 15, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  getIconGenre(genres),
                  color: selected ? Colors.white : Colors.blue,
                  width: 50,
                  height: 50,
                ),
                Text(
                  genres.name,
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
