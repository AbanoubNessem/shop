import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop/components/catogeries/categories_item.dart';
import 'package:shop/components/catogeries/list_categories_items.dart';
import 'package:shop/components/product/product_item.dart';
import 'package:shop/models/categories_model/categories_model.dart';
import 'package:shop/models/home_model/home_model.dart';

class ProductsBodyScreen extends StatelessWidget {
  HomeModel homeModel;

  ProductsBodyScreen({super.key, required this.homeModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
              items: homeModel.data!.banners!
                  .map((e) => Image(
                        image: NetworkImage('${e.image}'),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
              options: CarouselOptions(
                  autoPlay: true,
                  height: 250,
                  initialPage: 0,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(seconds: 3),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal)),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text("Categories",style: Theme.of(context).textTheme.titleMedium,),
          ),
          const SizedBox(height: 10,),
          const ListCategoriesItems(),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text("New Products",style: Theme.of(context).textTheme.titleMedium,),
          ),
          const SizedBox(height: 10,),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics:const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 1/1.7,
            children:
              List.generate(
                  homeModel.data!.products!.length,
                      (index) => ProductItem(productsModel: homeModel.data!.products![index])
              ),
          )
        ],
      ),
    );
  }
}
