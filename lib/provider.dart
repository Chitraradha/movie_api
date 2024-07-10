import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newproject/modelclass.dart';

class  ApiProvider extends ChangeNotifier{
  List<MovieModel>movieList=[];
  String apiUrl = "https://api.themoviedb.org/3/search/movie";
  String apiKey = "b944d6eba2d3f434fdb9d98457345ae8";
  // 1234567890abcdef
  int currentPage=1;
  TextEditingController SearchController= TextEditingController();

  Future getApi(String movieName) async{
    http.Response response;
    response = await http.get(
    Uri.parse("$apiUrl?api_key=$apiKey&query=$movieName"));
    print(response.body);
    notifyListeners();
    if(response.statusCode==200){
      final Map<String,dynamic> data=json.decode(response.body);
      final List<dynamic>results=data["results"];
      print(data["results"]);
      movieList=results.map((value)=>MovieModel(title: value["title"], image: value["poster_path"].toString())).toList();
    }
    


  }
}