import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/app_colors.dart';
import 'package:pokemon/features/home/presentation/pages/animations.dart';

import '../../../../core/app_router.dart';
import '../../../../core/utils/app_constants.dart';
import '../cubit/home_cubit.dart';

class Home extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  String? _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppConstants.horizontalPadding),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      TextField(
                        autofocus: false, // Set autofocus to false
                        controller: _nameController,
                        onChanged: (value) =>
                            BlocProvider.of<HomeCubit>(context)
                                .changeName(value),
                        decoration: const InputDecoration(
                            hintText: "Enter your name",
                            border: UnderlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                            color: state.name.isNotEmpty
                                ? Colors.grey
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(state.name,
                            style: const TextStyle(color: Colors.white)),
                      ),
                    ],
                  )),
                  Column(
                    children: [
                      TextButton.icon(
                          onPressed: () {
                            debugPrint("clear text");
                            _nameController.clear();
                            BlocProvider.of<HomeCubit>(context).clearName();
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: red,
                          ),
                          label: const Text(
                            "Clear text",
                            style: TextStyle(color: red),
                          )),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            minimumSize:
                                const Size(double.infinity, 40), //////// HERE
                            backgroundColor: secondaryColor),
                        onPressed: () {
                          debugPrint("Go to animations page");
                          Navigator.pushNamed(
                            context,
                            AppRoutes.animations,
                            arguments: (AnimationsArguments(
                                name: _nameController.text)),
                          );
                        },
                        child: const Text("Go to page 1"),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            minimumSize: const Size(double.infinity, 40),
                            backgroundColor: primaryColor),
                        onPressed: () {
                          debugPrint("Go to pokemons page");
                          Navigator.pushNamed(
                            context,
                            AppRoutes.pokemons,
                          );
                        },
                        child: const Text("Go to page 2"),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  )
                ],
              );
            },
          ),
        ));
  }
}
