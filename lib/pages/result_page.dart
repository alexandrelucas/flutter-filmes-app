import 'package:filmesApp/controllers/movie_search_controller.dart';
import 'package:filmesApp/pages/movie_detail_page.dart';
import 'package:filmesApp/widgets/utils/centered_message.dart';
import 'package:filmesApp/widgets/utils/centered_progress.dart';
import 'package:filmesApp/widgets/utils/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:filmesApp/widgets/result/search_button.dart';
import 'package:filmesApp/widgets/result/searchbar.dart';

// ignore: must_be_immutable
class ResultPage extends StatefulWidget {
  String title;
  ResultPage(this.title);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool _isSearching = false;
  TextEditingController _textCtrl = TextEditingController();
  final _movieCtrl = MovieSearchController();
  final _scrollController = ScrollController();
  int lastPage = 1;

  @override
  void initState() {
    super.initState();
    _fetchSearch();
    _initScrollListener();
  }

  @override
  void dispose() {
    _textCtrl.dispose();
    super.dispose();
  }

  _initScrollListener() {
    _scrollController.addListener(() async {
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent) {
        if (_movieCtrl.currentPage == lastPage) {
          lastPage++;
          await _movieCtrl.fetchMoviesBySearch(
              query: widget.title, page: lastPage);
        }
      }
    });
  }

  _fetchSearch() async {
    setState(() => _movieCtrl.loading = true);
    await _movieCtrl.fetchMoviesBySearch(query: widget.title);
    setState(() => _movieCtrl.loading = false);
  }

  void _onSubmit(String value) {
    setState(() {
      _isSearching = false;
    });
    if (value.isEmpty) return;
    this.widget.title = value;
    _movieCtrl.movies.clear();
    _fetchSearch();
    _initScrollListener();
  }

  void _onClickSearch() {
    setState(() {
      this._isSearching = !this._isSearching;

      // Se tiver pesquisando significa que o botão tem o ícone de cancelar logo limpa o input
      if (this._isSearching) _textCtrl.text = "";
    });
  }

  Widget _buildMovieGrid() {
    if (_movieCtrl.loading) {
      return CenteredProgress();
    }

    if (_movieCtrl.movieError != null) {
      return CenteredMessage(
        message: _movieCtrl.movieError.message,
        icon: Icons.warning,
      );
    }

    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(2.0),
      itemCount: _movieCtrl.moviesCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.65,
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2),
      itemBuilder: _buildMovieCard,
    );
  }

  Widget _buildMovieCard(context, index) {
    final movie = _movieCtrl.movies[index];
    return MovieCard(
      posterPath: movie.posterPath ?? Icons.warning,
      onTap: () => _movieDetailPage(movie.id),
    );
  }

  void _movieDetailPage(int id) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => MovieDetailPage(movieId: id)));
  }

  Widget _buildAppBar() {
    return AppBar(
      title: !this._isSearching
          ? Text(this.widget.title)
          : SearchBar(
              controller: this._textCtrl,
              onSubmited: this._onSubmit,
            ),
      actions: [SearchButton(this._onClickSearch, _isSearching)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildMovieGrid(),
    );
  }
}
