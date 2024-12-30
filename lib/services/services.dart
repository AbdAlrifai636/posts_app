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
  print(postsModel);
return postsModel;
} catch(e){
  print(e);
  return null;
}
  }
  Future<List<PostsModel>> getAllPost()async{
    try{
      response =await dio.get(url);
      List <PostsModel> list = PostsModel.jsonArray(response?.data);
      print(list);
      return list;
    } catch(e){
      print(e);
      return [];
    }
  }
Future<bool> createPost(PostsModel postModel)async{
    try{
      response = await dio.post(url,data: postModel.toJson());
      print(response!.data);
      return true;
    }catch (e){
      print(e);
      return false;
    }
}

Future<bool> deletePost(String index)async{

    try{
      response = await dio.delete("https://673dad8b0118dbfe86084618.mockapi.io/posts/$index");
      print(response!.data);
      return true;
    }catch(e){
      print(e);
      return false ;
    }
}

}