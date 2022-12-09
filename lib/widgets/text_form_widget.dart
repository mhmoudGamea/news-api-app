import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/data_provider.dart';

class TextFormWidget extends StatelessWidget {
  final Function(String value) searchFunction;
  TextFormWidget({Key? key, required this.searchFunction}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 15),
      child: TextFormField(
        controller: _controller,
        cursorColor: whiteColor,
        style: TextStyle(color: !data.isDark ? primaryColor : whiteColor),
        decoration: InputDecoration(
          hintText: 'What are you looking for?',
          hintStyle: TextStyle(color: !data.isDark ? primaryColor : whiteColor),
          filled: true,
          fillColor: Theme.of(context).backgroundColor,//secondaryColor
          contentPadding: const EdgeInsets.only(top: 14, bottom: 14, left: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 0,
              color: primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 0,
              color: primaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 0,
              color: primaryColor,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: () async{
              await data.getSearchedData(_controller.text);
              searchFunction(_controller.text);
            },
            icon: Icon(
              Iconsax.search_normal_14,
              color: !data.isDark ? primaryColor : whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
