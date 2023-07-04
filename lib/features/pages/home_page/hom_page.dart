import 'package:diorequest/features/pages/add_page/add_page.dart';
import 'package:diorequest/features/pages/home_page/widgets/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'data/bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    //context.read<HomeBloc>().add(HomeLoadEvent());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (oldState, newState) =>
            oldState.isDelete != newState.isDelete,
        listener: (context, state) {
          if (state.isDelete && state.status!.isSubmissionSuccess) {
            context.read<HomeBloc>().add(HomeLoadEvent());
          }
        },
        builder: (context, state) {
          if (state.status!.isPure) {
            context.read<HomeBloc>().add(HomeLoadEvent());
          } else if (state.status!.isSubmissionInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status!.isSubmissionSuccess) {
            return state.homeModel == null || state.homeModel!.isEmpty
                ? const Center(
                    child: Text(
                    "No Data",
                    style: TextStyle(fontSize: 30,fontWeight:FontWeight.w700),
                  ))
                : SafeArea(
                    child: ListView.builder(
                        padding:
                            const EdgeInsets.only(top: 20, left: 16, right: 16),
                        itemCount: state.homeModel!.length,
                        itemBuilder: (context, index) {
                          return homeWidgets(state.homeModel![index], context);
                        }),
                  );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPages()));
        },
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
