import 'package:flutter/material.dart';

import '../sub_screens/Search.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SearchScreen()));
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.amber,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(

              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.search,color: Colors.grey,),
                ),
                Text('Looking Something ?',style: TextStyle(color: Colors.grey),),
              ],
            ),

            Container(
              height: 40,
              width: 80,
              decoration :
              BoxDecoration (
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
              ),
              child : const Center(child: Text('Search',style: TextStyle(color: Colors.white),)),
            )
          ],
        ),

      ),
    );
  }
}
