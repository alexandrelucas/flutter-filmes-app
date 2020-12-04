

import 'package:dio/dio.dart';

const apiBaseUrl = 'https://api.themoviedb.org/3';
const apiKey = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4NjM5NWE3MDg5OGIzYzkxOTBhY2M2YTBhMDAzYjI4NyIsInN1YiI6IjVmYzJkOTRmZDJmNWI1MDAzZmQ2YjU2NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iMjHh-p-SDc3HHETX0eHoxCrhbX_aJ52HxQOl2PaE98';

const serverErrorMsg = 'Erro ao se conectar ao servidor.\n Tente novamente depois.';
final dioOptions = BaseOptions(
  baseUrl: apiBaseUrl,
  connectTimeout: 5000,
  receiveTimeout: 3000,
  contentType: 'application/json;charset=utf-8',
  headers: {'Authorization': 'Bearer $apiKey'}
);