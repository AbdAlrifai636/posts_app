import 'dart:developer';
import 'package:albarakah/models/posts_model.dart';
import 'package:albarakah/pages/home_page.dart';
import 'package:albarakah/services/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UpdatePostPage extends StatefulWidget {
  String id;
  String content;
  String userName;

  UpdatePostPage(
      {super.key,
      required this.id,
      required this.content,
      required this.userName});

  @override
  State<UpdatePostPage> createState() => _UpdatePostPageState();
}

class _UpdatePostPageState extends State<UpdatePostPage> {
  TextEditingController addPost = TextEditingController();
  Services services = Services();
  @override
  void initState() {
    super.initState();
    addPost.text = widget.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Update post',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: MaterialButton(
              onPressed: () async {
                log('Index: ${widget.id}');
                final updatePost = PostsModel(
  createdAt: DateTime.now(),
  userName: widget.userName,
  avatar:
  "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
  time: DateTime.now(),
  content: addPost.text,
  likes: 119,
  comments: "comments",
  id: "123",
);
                final success = await   services.updatePost(widget.id, updatePost);

                if (success) {
                  Navigator.pop(
                    context,
                   updatePost,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to update the post')),
                  );
                }
              },
              color: const Color(0xffE2E5EA),
              child: const Text(
                'UPDATE',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffAEB1B6),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 22.0, left: 12, right: 18),
                child: InkWell(
                  onTap: () async {},
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3m972e8FEvBi7ETC03avlJcZDg8nT9dWLSw&s"),
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: widget.userName,
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
                minLines: 3,
                maxLines: 6,
                controller: addPost,
                decoration: const InputDecoration(
                  hintStyle:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                  hintText: "What's on your mind ?",
                  border: InputBorder.none,
                )),
          )
        ],
      ),
    );
  }
}
