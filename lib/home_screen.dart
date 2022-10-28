import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/posts_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 List <PostModel> postList=[];
 Future<List<PostModel>> getPostApi ()async{
   final response= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
   var data = jsonDecode(response.body.toString());
   if (response.statusCode==200){
     for (Map i in data){
       postList.add(PostModel.fromJson(i));
     }
     return postList;
   }else{
     return postList;
   }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Course'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    return Center(child: CircularProgressIndicator());
                  }
                  else{
                    return ListView.builder(
                      itemCount: postList.length,
                        itemBuilder: (context,index){

                          return Text(index.toString());
                        }
                    );
                  }
                },
            ),
          )
        ],
      ),
    );
  }
}
