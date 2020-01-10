import 'package:flutter/material.dart';

class Searchscreen extends StatefulWidget {
  @override
  _SearchscreenState createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(

      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            onChanged: (val){
              
            },
            decoration: InputDecoration(
              prefixIcon: IconButton(
                color: Colors.black,
                icon: Icon(Icons.search),
                onPressed: ()
                {
                  
                }
                
                
              ),
              contentPadding: EdgeInsets.only(left:25.0),
              hintText: 'search by name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
              )
            ),
          ),
        ),
      ],
    );
      
    
  }
}