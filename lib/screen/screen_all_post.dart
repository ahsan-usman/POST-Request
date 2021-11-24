import 'package:api_post/models/model_post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ScreenAllPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  late String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


Future<ModelPost> SubmitData(String name, String job) async{
  var response= await http.post(Uri.https('reqres.in', 'api/users'),
      body: {"name": name, "job": job});
  var data = response.body;
  print(data);
  if(response.statusCode == 201){
    String responseString= response.body;
    modelPostFromJson(responseString);
}
  else{
    return null!;
  };
  throw Container();
}



class _MyHomePageState extends State<MyHomePage> {

  final nameController = TextEditingController();
  final jobController = TextEditingController();

  @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            toolbarHeight: 80.0,
            elevation: 10.0,
            title: Text('POST API',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.teal,
          ),

          body: Container(
            padding: EdgeInsets.lerp(
                EdgeInsets.all(20), EdgeInsets.all(10.0), 0.5),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 30.0, top: 40.0),
                      labelText: 'Name',
                      hintText: 'Enter Your Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: jobController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 30.0, top: 40.0),
                      labelText: 'Enter Job Title',
                      hintText: 'Enter Job Title here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),


                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          minimumSize: Size(160, 55),
                          primary: Colors.teal,
                          textStyle: TextStyle(fontSize: 22),
                        ),
                        child: Text("Submit"),
                        onPressed: () async {
                          String name = nameController.text;
                          String job = jobController.text;

                          ModelPost model = await SubmitData(name, job);

                        }),
                  ),
                ),

                /*           FutureBuilder(
                future: future_builder,
                builder: (context,AsyncSnapshot<List<ModelPost>> snapshot) {
                  if(snapshot.hasError){
                    return Container(
                      child: Center(
                        child: Text('Error Occured'),
                      ),
                    );
                  } else if(snapshot.hasData){
                    if(snapshot.data!.length > 0){
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context,index) {
                            return Container(
                              child: Text
                                (snapshot.data![index].title),);
                          }
                      );
                    }
                  } else (){
                  };
                  return Container();
                },
              ),
              */

              ],
            ),
          )
      );
    }

  }


