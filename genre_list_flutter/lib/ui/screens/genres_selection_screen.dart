import 'package:flutter/material.dart';
import 'package:genre_list_flutter/bloc/genre_bloc.dart';
import 'package:genre_list_flutter/models/genre_response.dart';
import 'package:genre_list_flutter/repository/genre_repository/genre_repository.dart';
import 'package:genre_list_flutter/repository/genre_repository/genre_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genre_list_flutter/ui/screens/errors/error_page.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GenreSelectionScreen extends StatefulWidget {
  GenreSelectionScreen({Key? key}) : super(key: key);

  @override
  State<GenreSelectionScreen> createState() => _GenreSelectionScreenState();
}

class _GenreSelectionScreenState extends State<GenreSelectionScreen> {
  late GenreRepository genreRepository;

  @override
  void initState() {
    super.initState();
    genreRepository = GenreRepositoryImpl();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        return BlocProvider(create: (context) { return GenreBloc(genreRepository)..add(FetchGenre()); },
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
    final contentHeight = 4.0 * (MediaQuery.of(context).size.width / 2.4) / 3;
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 20.0, right: 16.0),
          height: 48.0,
          child: Row(
            children: [
              const Icon(Icons.arrow_back, color: Colors.red),
              const Expanded(
                flex: 1,
                child: Text(
                  'Select Your Interest',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontFamily: 'Muli',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: contentHeight,
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return _createGenresViewItem(context, genres[index]);
            },
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const VerticalDivider(
              color: Colors.transparent,
              width: 6.0,
            ),
            itemCount: genres.length,
          ),
        ),
        ElevatedButton(
            child: Text("Next", style: TextStyle(fontSize: 14)),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 36, 73, 103)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(color: Colors.red)))),
            onPressed: () => null)
      ],
    );
  }

  Widget _createGenresViewItem(BuildContext context, Genres genres) {
    return GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)
  }
}
