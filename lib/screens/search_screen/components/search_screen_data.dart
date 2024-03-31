import 'package:flutter/material.dart';

class SearchScreenData{

  TextEditingController searchController = TextEditingController();

  var searchKey = GlobalKey<FormState>();
  clearFields(){
    searchController.text = "";
  }
}