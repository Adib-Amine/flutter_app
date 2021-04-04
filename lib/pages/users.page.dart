import 'package:flutter/material.dart';
import 'package:git_app/widgets/drawer.widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'git.page.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  String query;
  bool notInvisible = false;
  TextEditingController queryTextEditingController = new TextEditingController();
  dynamic data = null;//data qui contient tout ce je veux
  int currentPage = 0;
  int totalPage = 0;
  int pageSize = 20;//number of results per page
  ScrollController scrollController = new ScrollController();
  List<dynamic> items = [];
//method for search users
  void _search(String query) {
    String url = "https://api.github.com/search/users?q=$query&per_page=$pageSize&page=$currentPage";
    // ignore: unnecessary_statements
    http.get(Uri.parse(url))
        .then((response) =>
        setState((){
          this.data = json.decode(response.body);
          this.items.addAll(data['items']);
          if(data['total_count']% pageSize ==0) {
            this.totalPage = data['total_count'] ~/ pageSize; // division entière we use ~/
          }else
            this.totalPage = (data['total_count'] / pageSize).floor()+ 1; // floor pour prendre la partie entière
        })
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        setState(() {
          if(currentPage < totalPage-1) {
            ++currentPage;
            _search(query);
          }
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawerWidget(),
        appBar: AppBar(
          title:Text("$query : $currentPage / $totalPage"),
        ),
        body: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          obscureText: notInvisible,
                          onChanged: (value){
                            setState(() {
                              this.query = value;
                              print(query);

                            });
                          },
                          controller: queryTextEditingController,
                          decoration: InputDecoration(
                              suffixIcon:IconButton(
                                  onPressed: (){
                                    setState(() {
                                      notInvisible = !this.notInvisible;
                                    });
                                  },
                                  icon: Icon(
                                      notInvisible==true?Icons.visibility_off:Icons.visibility
                                  )
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      width: 1,color: Colors.red
                                  )
                              )
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.search,color:Colors.redAccent),
                        onPressed:(){
                          setState(() {
                            items=[];
                            currentPage = 0;
                            this.query = queryTextEditingController.text;
                            _search(query);
                          });
                        })
                  ],
                ),
                Expanded(
                  child:ListView.separated(
                      separatorBuilder: (context,index) => Divider(height: 2),
                      controller: scrollController,
                      itemCount: items.length,
                      itemBuilder:(context,index){
                        return ListTile(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder:
                                      (context) =>
                                      GitPage(login: items[index]['login'])
                                  )
                              );
                            },
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[ Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(items[index]['avatar_url']),
                                      radius : 30,
                                    ),
                                    SizedBox(width: 15),
                                    Text("${items[index]['login']}"),
                                  ]
                              ),
                                CircleAvatar(
                                  child: Text("${items[index]['score']}"),
                                ),
                              ],

                            )
                        );
                      }
                  ),
                )
              ],
            )
        )
    );
  }
}
