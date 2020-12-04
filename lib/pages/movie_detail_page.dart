import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:filmesApp/controllers/movie_detail_controller.dart';
import 'package:filmesApp/widgets/utils/centered_message.dart';
import 'package:filmesApp/widgets/utils/centered_progress.dart';
import 'package:filmesApp/widgets/movie_detail/chip_date.dart';
import 'package:filmesApp/widgets/movie_detail/rate.dart';

// ignore: must_be_immutable
class MovieDetailPage extends StatefulWidget {
  int movieId;

  MovieDetailPage({this.movieId = 475557});

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final _controller = MovieDetailController();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  _initialize() async {
    setState(() => _controller.loading = true);
    await _controller.fetchMovieById(widget.movieId);
    setState(() => _controller.loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    if (_controller.loading) return CenteredProgress();

    if (_controller.movieError != null)
      return CenteredMessage(
        message: _controller.movieError.message,
        icon: Icons.warning,
      );

    return CustomScrollView(slivers: [
      _buildSliverAppBar(),
      SliverList(delegate: SliverChildListDelegate(_buildList()))
    ]);
  }

  List<Widget> _buildList() {
    List<Widget> listItems = List();

    listItems.add(_buildStatus());
    listItems.add(_buildOverview());
    listItems.add(_buildStatus());
    listItems.add(_buildOverview());
    listItems.add(_buildStatus());
    listItems.add(_buildOverview());
    listItems.add(_buildStatus());
    listItems.add(_buildOverview());
    listItems.add(_buildStatus());
    listItems.add(_buildOverview());

    return listItems;
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      title: Text(_controller.movieDetail?.title ?? ''),
      floating: true,
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        background: _buildCover(),
      ),
      pinned: true,
    );
  }

  Widget _buildOverview() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Text(
        _controller.movieDetail.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }

  Widget _buildStatus() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Rate(_controller.movieDetail.voteAverage),
          ChipDate(date: _controller.movieDetail.releaseDate)
        ],
      ),
    );
  }

  Widget _buildCover() {
    return CachedNetworkImage(
      imageUrl:
          'https://image.tmdb.org/t/p/w500${_controller.movieDetail.backdropPath}',
      fit: BoxFit.cover,
      placeholder: (context, url) => CenteredProgress(),
    );
  }
}
