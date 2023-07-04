import 'package:diorequest/features/pages/add_page/data/add_model.dart';
import 'package:diorequest/features/pages/add_page/data/bloc/add_bloc.dart';
import 'package:diorequest/features/pages/home_page/data/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPages extends StatefulWidget {
  const AddPages({Key? key}) : super(key: key);

  @override
  State<AddPages> createState() => _AddPagesState();
}

class _AddPagesState extends State<AddPages> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
      ),
      body: BlocConsumer<AddBloc, AddState>(
        listenWhen: (oldState, newState) =>
            oldState.addModel != newState.addModel,
        listener: (context, state) {
          if (state.addModel != null) {
            context.read<HomeBloc>().add(HomeLoadEvent());
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
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
                        controller: fullnameController,
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
                        controller: mobileController,
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
                        AddModel add = AddModel(
                            mobile: mobileController.text,
                            fullname: fullnameController.text);
                        context
                            .read<AddBloc>()
                            .add(AddLoadEvent(addModel: add));
                      },
                      child: const Text("Add"))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
