import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newproject/provider.dart';
import 'package:provider/provider.dart';



class MovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      child: Scaffold(
        backgroundColor: Colors.transparent.withOpacity(0.6),
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Text(
            'Movies',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<ApiProvider>(
            builder: (context,value,child) {
              return Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      onTap: () {},
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      controller: value.SearchController,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: 'Search for movies..',
                          labelStyle: TextStyle(color: Colors.white70),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
              
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      value.getApi(
                          value.SearchController.text);
                    },
                    child: Container(
                        height: height / 25,
                        width: width / 3.8,
                        color: Colors.white.withOpacity(0.4),
                        child: Center(
                            child: Text(
                          "SEARCH",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ))),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: value.movieList.isNotEmpty
                        ? GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    crossAxisCount: 2),
                            shrinkWrap: true,
                            itemCount: value.movieList.length,
                            itemBuilder: (context, index) {
                              var item = value.movieList[index];
                              return value.movieList[index].image != "null"
                                  ? Card(
                                      child: Image.network(
                                        "https://image.tmdb.org/t/p/w780${item.image}",
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : Icon(Icons.camera_alt, color: Colors.white);
                              // return ListTile(
                              //   title: Text(item.title),
                              //   leading: CachedNetworkImage(
                              //     imageUrl: item.image,
                              //     placeholder: (context, url) => CircularProgressIndicator(),
                              //     errorWidget: (context, url, error) => Icon(Icons.error),
                              //   ),
                              // );
                            },
                          )
                        : Container(),
                  ),
                  SizedBox(height: 10),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Visibility(
                  //       // visible: value.currentPage>0,
                  //       child: InkWell(
                  //         onTap: () {
                  //           value.CurrentPage--;
                  //           value.getApi(
                  //               value.SearchController.text, value.CurrentPage);
                  //         },
                  //         child: Container(
                  //             height: height / 28,
                  //             width: width / 4.5,
                  //             color: Colors.white.withOpacity(0.4),
                  //             child: Center(
                  //                 child: Text(
                  //               "BACK",
                  //               style: TextStyle(
                  //                   color: Colors.white,
                  //                   fontSize: 17,
                  //                   fontWeight: FontWeight.w400),
                  //             ))),
                  //       ),
                  //     ),
                  //     SizedBox(width: 5),
                  //     InkWell(
                  //       onTap: () {
                  //         value.CurrentPage++;
                  //         value.getApi(
                  //             value.SearchController.text, value.CurrentPage);
                  //       },
                  //       child: Container(
                  //           height: height / 28,
                  //           width: width / 4.5,
                  //           color: Colors.white.withOpacity(0.4),
                  //           child: Center(
                  //               child: Text(
                  //             "NEXT",
                  //             style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontSize: 17,
                  //                 fontWeight: FontWeight.w400),
                  //           ))),
                  //     ),
                  //   ],
                  // )
              
                  // buildPagination(context),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
// Widget buildPagination(BuildContext context) {
//   ApiProvider provider = Provider.of<ApiProvider>(context,listen: false);
//
//
//   int totalPages = (provider.movieList.length / provider.itemsPerPage).ceil();
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: List.generate(totalPages,(index) {
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GestureDetector(
//           onTap: () => provider.changePage(index + 1),
//           child: CircleAvatar(
//             backgroundColor:
//             provider.currentPage == index + 1 ? Colors.blue : Colors.grey,
//             child: Text((index + 1).toString()),
//           ),
//         ),
//       );
//     }),
//);
}