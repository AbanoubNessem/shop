import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/components/custom_text_form_field.dart';
import 'package:shop/components/search/search_item.dart';
import 'package:shop/cubit/search_cubit/search_cubit.dart';
import 'package:shop/cubit/search_cubit/search_state.dart';
import 'package:shop/screens/search_screen/components/search_screen_data.dart';
import 'package:shop/utility/app_colores.dart';

class SearchScreenBody extends StatelessWidget {
  SearchScreenBody({super.key});

  SearchScreenData searchScreenData = SearchScreenData();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                  key: searchScreenData.searchKey,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        if (state is GetSearchLoadingState)
                          LinearProgressIndicator(
                            color: AppColors.secondaryColor,
                          ),
                        CustomTextFormField(
                          controller: searchScreenData.searchController,
                          hint: "Search",
                          validator: "not valid",
                          iconPrefix: Icons.search,
                          onSubmit: (value) {
                            if (searchScreenData.searchKey.currentState!
                                .validate()) {
                              print("update");
                              SearchCubit.get(context).search(
                                  search: searchScreenData.searchController.text,
                                  context: context);
                            }
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ConditionalBuilder(
                            condition: true,
                            builder: (context) => Container(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        if (searchScreenData
                                            .searchKey.currentState!
                                            .validate()) {
                                          print("update");
                                          SearchCubit.get(context).search(
                                              search: searchScreenData
                                                  .searchController.text,
                                              context: context);
                                        }
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Theme.of(context).canvasColor),
                                          textStyle:
                                              const MaterialStatePropertyAll(
                                                  TextStyle(
                                            fontSize: 25,
                                          ))),
                                      child: const Text("Search")),
                                ),
                            fallback: (context) => const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.secondaryColor,
                                  ),
                                )),
                        const SizedBox(
                          height: 8,
                        ),
                        if (state is GetSearchSuccessState)
                          Container(
                            height:MediaQuery.of(context).size.height,
                            child: ListView.separated(
                                itemBuilder: (context, index) => SearchItem(
                                    searchProduct: SearchCubit.get(context)
                                        .searchModel
                                        .data!
                                        .data![index]),
                                separatorBuilder: (context, index) => Container(
                                      width: double.infinity,
                                      height: 5,
                                    ),
                                itemCount: SearchCubit.get(context)
                                    .searchModel
                                    .data!
                                    .data!
                                    .length),
                          ),
                        if(state is GetSearchErrorState)
                          const Center(child: Text("Not Found",style: TextStyle(color: Colors.grey, fontSize: 24),),)
                      ],
                    ),
                  )),
            ));
      },
    );
  }
}
