import 'package:diorequest/features/pages/edite_page/edite.dart';
import 'package:diorequest/features/pages/home_page/data/bloc/home_bloc.dart';
import 'package:diorequest/features/pages/home_page/data/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget homeWidgets(HomeModel homemodel,BuildContext context ){
  return Container(
    padding:const EdgeInsets.all(10),
    margin:const EdgeInsets.only(bottom:10),
    width:375,
    decoration:BoxDecoration(
      borderRadius:BorderRadius.circular(10),
      border:Border.all(color:Colors.black),
    ),
    child: Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Text(homemodel.fullname!,style:const TextStyle(color:Colors.red,fontSize:20),),
        const SizedBox(height:10,),
        Text(homemodel.mobile!,style:const TextStyle(color:Colors.red,fontSize:20),),
        const SizedBox(height:10,),
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed:(){
                context.read<HomeBloc>().add(HomeDeleteEvent(homeModel:homemodel));
              },
              child:const Icon(Icons.delete_rounded,color:Colors.red,),
            ),
            ElevatedButton(
              onPressed:(){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditePage(homeModel:homemodel)));
              },
              child:const Icon(Icons.edit,color:Colors.yellow,),
            )
          ],
        ),
      ],
    ),
  );
}