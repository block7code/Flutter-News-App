import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../utils/url.dart';
import 'package:b7c_news/model/news.dart';

class NewsApi {
  static Future<NewsList> getHeadLines(
      {String category: "general", int page: 0}) async {
    String url = Api.base_url +
        "top-headlines?country=us&page=$page&category=$category&apiKey=" +
        Api.newsapi_key;
    print("request $category - $page");
    final response = await http.get(Uri.parse(url));

    int statusCode = response.statusCode;
    print('Status code  : $statusCode');

    return compute(parseResult, response.body);
  }

  static NewsList parseResult(String respond) {
    return NewsList.fromJson(json.decode(respond));
  }
}
