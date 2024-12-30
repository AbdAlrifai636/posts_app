import 'dart:developer';

import 'package:albarakah/models/posts_model.dart';
import 'package:dio/dio.dart';

class Services{
  Dio dio = Dio();
  Response? response;
  String url = "https://673dad8b0118dbfe86084618.mockapi.io/posts";

  Future<PostsModel?> getPost(int index )async{
response =await dio.get("$url/$index");
try{
  PostsModel postsModel = PostsModel.fromJson(response!.data);
  log("$postsModel");
return postsModel;
} catch(e){
  log('Error: $e');
  return null;
}
  }
  Future<List<PostsModel>> getAllPost()async{
    try{
      response =await dio.get(url);
      List <PostsModel> list = PostsModel.jsonArray(response?.data);
      log("$list");
      return list;
    } catch(e){
      log('Error: $e');
      return [];
    }
  }
Future<bool> createPost(PostsModel postModel)async{
    try{
      response = await dio.post(url,data: postModel.toJson());
      log(response!.data);
      return true;
    }catch (e){
      log('Error: $e');
      return false;
    }
}

Future<bool> deletePost(String index)async{

    try{
      response = await dio.delete("$url/$index");
      log(response!.data);
      return true;
    }catch(e){
      log('Error: $e');
      return false ;
    }
}

  Future<bool> updatePost(String index, PostsModel postModel) async {
    try {
      final response = await dio.put("$url/$index", data: postModel.toJson());
      log('Response: ${response.data}');
      return true;
    } catch (e) {
      log('Error: $e');
      return false;
    }
  }
}
