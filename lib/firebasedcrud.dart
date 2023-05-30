import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
FirebaseFirestore firestore = FirebaseFirestore.instance;
class firebasedcrud extends StatefulWidget {
  const firebasedcrud({Key? key}) : super(key: key);

  @override
  State<firebasedcrud> createState() => _firebasedcrudState();
}

class _firebasedcrudState extends State<firebasedcrud> {
  void create()async{
    try{
      await firestore.collection('user').doc('testuser').set({
        'firstname' : 'anu',
         'lastname' :  'k',
           'age'    :  '18',
      });
    }catch(e){
      print(e);
    }
  }
  void update()async {
    try {
      firestore.collection('user').doc('testuser').update({
        'firstname': 'achu',
        'age': '19',
      });
    } catch (e) {
      print(e);
    }
  }
  void read()async{
    DocumentSnapshot documentSnapshot;
    try{
      documentSnapshot =await  firestore.collection('user').doc('testuser').get();
      print(documentSnapshot.data());
    }catch(e){
      print(e);
    }
  }
  void delete()async{
    try{
      firestore.collection('user').doc('testuser').delete();
    }catch(e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'FIREBASE CRUD'
        ),
        centerTitle : true,
        backgroundColor: Colors.yellow,
      ),
      body: Container(child: Column(
        children: [
          SizedBox(height: 100,
            child: Center(
                  child: Container(height: 40,width: 500,
                  child: TextButton(style:  TextButton.styleFrom(backgroundColor: Colors.white,),
                    onPressed: (){create();}, child: Text('create',style: TextStyle(fontSize: 30,),),
                  ),
                ),
              ),
          ),
          SizedBox(height: 90,
            child: Center(
              child:
              Container(height: 40,width: 500,
                child: TextButton(style:  TextButton.styleFrom(backgroundColor: Colors.white,),
                  onPressed: (){update();}, child: Text('update',style: TextStyle(fontSize: 30,),),
                ),
              ),
            ),
          ),


      SizedBox(height: 90,
        child: Center(
              child:
              Container(height: 40,width: 500,
                child: TextButton(style:  TextButton.styleFrom(backgroundColor: Colors.white,),
                  onPressed: (){delete();}, child: Text('delete',style: TextStyle(fontSize: 30,),),
                ),
              ),
            ),
      ),
          SizedBox(height: 90,
            child: Center(
              child: Container(height: 40,width: 500,
                child: TextButton(style:  TextButton.styleFrom(backgroundColor: Colors.white,),
                  onPressed: (){read();}, child: Text('read',style: TextStyle(fontSize: 30,),),
                ),
              ),
            ),
          ),
   ] ),
      ),
      );
  }
}
