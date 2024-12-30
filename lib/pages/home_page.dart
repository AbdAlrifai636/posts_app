import 'package:albarakah/method/method.dart';
import 'package:albarakah/pages/create_post.dart';
import 'package:albarakah/pages/update_post.dart';
import 'package:albarakah/services/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int isSelected = 0;
  List<String> imagePerson = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyzTWQoCUbRNdiyorem5Qp1zYYhpliR9q0Bw&s",
    "https://cdn2.psychologytoday.com/assets/styles/manual_crop_1_1_1200x1200/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=1-9sfjwH",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLJc3zLGd8RlEa0z-0TwqzoeXGjiZ_L25XVA&s",
    "https://engineering.unl.edu/images/staff/Kayla-Person.jpg",
    "https://cdn.pixabay.com/photo/2016/11/29/13/14/attractive-1869761_1280.jpg",
    "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsmWhg5Sm7HY8_Cpd9yLs2etup1EmtE8eilg&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3m972e8FEvBi7ETC03avlJcZDg8nT9dWLSw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyzTWQoCUbRNdiyorem5Qp1zYYhpliR9q0Bw&s",
    "https://cdn2.psychologytoday.com/assets/styles/manual_crop_1_1_1200x1200/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=1-9sfjwH",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLJc3zLGd8RlEa0z-0TwqzoeXGjiZ_L25XVA&s",
    "https://engineering.unl.edu/images/staff/Kayla-Person.jpg",
    "https://cdn.pixabay.com/photo/2016/11/29/13/14/attractive-1869761_1280.jpg",
    "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsmWhg5Sm7HY8_Cpd9yLs2etup1EmtE8eilg&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3m972e8FEvBi7ETC03avlJcZDg8nT9dWLSw&s",
  ];
  List<IconData?> iconList = [
    Icons.home,
    Icons.add_circle,
    Icons.person,
    Icons.notifications,
    Icons.list,
  ];
  Services services = Services();
  Method method = Method();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            expandedHeight: 170.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'AlBarakah',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.message,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ...List.generate(
                            5,
                            (index) => Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isSelected == index
                                    ? const Color(0xffFFECB3)
                                    : Colors.white,
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isSelected = index;
                                  });
                                },
                                child: Icon(
                                  iconList[index],
                                  color: isSelected == index
                                      ? Colors.amber
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CircleAvatar(
                          radius: 23,
                          backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&s"),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreatePost()));
                          },
                          child: Container(
                            width: 240,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: const Center(
                              child: Text(
                                "What's on your mind ?",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                        const Icon(Icons.browse_gallery)
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Divider(
                        thickness: 4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 210.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 4.0),
                    child: Container(
                      width: 120,
                      height: 210,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          FutureBuilder(
              future: services.getAllPost(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SliverToBoxAdapter(
                      child:
                          UnconstrainedBox(child: CircularProgressIndicator()));
                } else if (snapshot.hasError) {
                  return SliverToBoxAdapter(
                      child: Center(
                    child: Text("there is an error $snapshot"),
                  ));
                } else if (snapshot.hasData) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Column(
                          children: [
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: InkWell(
                                        onTap: () async {},
                                        child: CircleAvatar(
                                          radius: 23,
                                          backgroundImage: NetworkImage(index <
                                                  14
                                              ? imagePerson[index]
                                              : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLA994hpL3PMmq0scCuWOu0LGsjef49dyXVg&s"),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text:
                                                snapshot.data![index].userName,
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              " ${method.calculateTimeDifference(snapshot.data![index].createdAt)}",
                                              style: const TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const FaIcon(
                                              FontAwesomeIcons.earthAmericas,
                                              size: 18,
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UpdatePostPage(
                                                        id: snapshot.data![index].id,
                                                        content: snapshot
                                                            .data![index]
                                                            .content,
                                                        userName: snapshot
                                                            .data![index]
                                                            .userName,
                                                      )));
                                        },
                                        child: const Icon(
                                          color: Colors.amber,
                                          Icons.edit,
                                          size: 25,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await services.deletePost(
                                              snapshot.data![index].id);
                                          setState(() {});
                                        },
                                        child: const Icon(
                                          Icons.close,
                                          size: 35,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                  text: TextSpan(
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                                text: snapshot.data![index].content,
                              )),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: Color(0xff7BCDF4),
                                        radius: 12,
                                        child: FaIcon(
                                          FontAwesomeIcons.thumbsUp,
                                          color: Colors.white,
                                          size: 17,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "${snapshot.data![index].likes}",
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      Text(
                                        "2",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "comments",
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.thumbsUp,
                                        size: 20,
                                        color: Colors.black45,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        "Like",
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.comment,
                                        size: 20,
                                        color: Colors.black45,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        "comment",
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.whatsapp,
                                        size: 20,
                                        color: Colors.black45,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        "Send",
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.share,
                                        size: 20,
                                        color: Colors.black45,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        "Share",
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                          ],
                        );
                      },
                      childCount: snapshot.data!.length,
                    ),
                  );
                } else {
                  return SliverToBoxAdapter(child: Container());
                }
              }),
        ],
      ),
    );
  }
}
