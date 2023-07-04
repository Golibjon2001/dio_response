import 'package:diorequest/features/pages/add_page/data/add_model.dart';
import 'package:diorequest/features/pages/edite_page/bloc/edite_bloc.dart';
import 'package:diorequest/features/pages/home_page/data/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../home_page/data/bloc/home_bloc.dart';

class EditePage extends StatefulWidget {
  HomeModel? homeModel;

  EditePage({required this.homeModel, Key? key}) : super(key: key);

  @override
  State<EditePage> createState() => _EditePageState();
}

class _EditePageState extends State<EditePage> {
  final TextEditingController fullnamecontrol = TextEditingController();
  final TextEditingController mobilecontrol = TextEditingController();

  @override
  void initState() {
    fullnamecontrol.text = widget.homeModel!.fullname!;
    mobilecontrol.text = widget.homeModel!.mobile!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edite"),
      ),
      body: BlocConsumer<EditeBloc, EditeState>(
        listener: (context, state) {
          if (state.isEdite && state.status.isSubmissionSuccess) {
            context.read<HomeBloc>().add(HomeLoadEvent());
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: TextField(
                        controller: fullnamecontrol,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          labelText: 'fullname',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: TextField(
                        controller: mobilecontrol,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          labelText: 'mobile',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      HomeModel homeModel = HomeModel(fullname: fullnamecontrol
                          .text.toString(), mobile: mobilecontrol.text
                          .toString(), id: widget.homeModel!.id);
                      context.read<EditeBloc>().add(EditeHomeEvent(homeModel:homeModel));
                    },
                    child: const Text("Edite"),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
