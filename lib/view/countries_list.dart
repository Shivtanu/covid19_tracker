import 'package:flutter/material.dart';
import 'package:covid19_tracker/Services/WorldStateViewModel.dart';


class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search with Country name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
//             Expanded(child: FutureBuilder(
//               builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
//                 if(snapshot.hasData){

//                 }
//                 else{
// return ListView.builder(itemBuilder:(context, index) {
//                   return Column(
//                     children: [

//                     ],
//                   );
//                 },
                
                  
            //     },
            //   },
            // ),
            // ),
            
          ],
        ),
      ),
    );
  }
}
