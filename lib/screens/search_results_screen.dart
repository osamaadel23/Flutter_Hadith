import 'package:flutter/material.dart';
import 'package:hadith_ui/widgets/hadithDetail.dart';

import '../widgets/app_drawer.dart';
import '../widgets/hadith_view_card.dart';
import '../api/search.dart';

class SearchResultsScreen extends StatefulWidget {
  static const routeName = '/search-results';

  @override
  _SearchResultsScreenState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    searchController.dispose();
    super.dispose();
  }

  Icon _searchIcon = Icon(Icons.search);
  bool pressed = false;
  bool tmam = true;
  bool done = false;
  bool isSearching = false;
  List<String> alternatives = ['سعداء بخدمتكم..', 'انتظر من فضلك..'];
  String corrected;
  String query;
  List<String> hadithes = [];
  final api = Api();
  void _searchPressed() {
    setState(() {
      pressed = !pressed;
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
      } else {
        this._searchIcon = new Icon(Icons.search);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
            alignment: Alignment.center,
            child: Text(
              'البحث',
              style: TextStyle(
                color: Colors.black54,
              ),
            )),
        actions: <Widget>[
          IconButton(icon: _searchIcon, onPressed: _searchPressed),
          Padding(
            padding: EdgeInsets.only(left: 0),
            child: IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.of(context).pushNamed('/home');
              },
            ),
          ),
        ],
      ),
      // endDrawer: AppDrawer(),
      drawer: AppDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/main20.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 25,
          ),
          children: <Widget>[
            (pressed)
                ?
              
                Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 0, right: 10, bottom: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              color: Colors.black26,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: TextField(
                                  controller: searchController,
                                  onSubmitted: (value) {
                                    setState(() {
                                      if (this._searchIcon.icon ==
                                          Icons.search) {
                                        this._searchIcon =
                                            new Icon(Icons.close);
                                      } else {
                                        this._searchIcon =
                                            new Icon(Icons.search);
                                      }
                                      pressed = !pressed;
                                      isSearching = true;
                                      done = false;
                                    });
                                    hadithes = [];
                                    List lisa;
                                    print(hadithes);
                                    api.search(value).then((onValue) {
                                      corrected = onValue[0];
                                      query = onValue[2];
                                      print(corrected + query);

                                      lisa = onValue[1];
                                      //print('query'+query);
                                      lisa.forEach((one) {
                                        hadithes.add(one.toString());
                                      });
                                      print(hadithes);
                                      setState(() {
                                        if (corrected == query)
                                          tmam = true;
                                        else
                                          tmam = false;
                                        print(tmam);
                                        hadithes = hadithes;
                                        isSearching = false;
                                        done = true;
                                      });
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: "ابحث هنا",
                                    hintStyle: TextStyle(
                                      color: Colors.black.withAlpha(120),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (String keyword) {},
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.black26,
                          ),
                          onPressed: () {
                            setState(() {
                              if (this._searchIcon.icon == Icons.search) {
                                this._searchIcon = new Icon(Icons.close);
                              } else {
                                this._searchIcon = new Icon(Icons.search);
                              }
                              pressed = !pressed;
                              isSearching = true;
                              done = false;
                            });
                            hadithes = [];
                            List lisa;
                            print(hadithes);
                            api.search(searchController.text).then((onValue) {
                              corrected = onValue[0];
                              query = onValue[2];
                              // print(corrected + query);

                              lisa = onValue[1];
                              //print('query'+query);
                              lisa.forEach((one) {
                                hadithes.add(one.toString());
                              });
                              print(hadithes);
                              setState(() {
                                if (corrected == query)
                                  tmam = true;
                                else
                                  tmam = false;
                                print(tmam);
                                hadithes = hadithes;
                                isSearching = false;
                                done = true;
                              });
                            });
                          }),
                    ],
                  )
                : Container(),
            (!done)
                ? (isSearching)
                    ? Column(
                        children: <Widget>[
                          Center(
                            child: Text(
                              alternatives[1],
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          Center(child: CircularProgressIndicator()),
                        ],
                      )
                    : Center(
                        child: Text(
                          alternatives[0],
                          style: TextStyle(fontSize: 25),
                        ),
                      )
                : Container(),
            (!tmam && !isSearching)
                ? Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10,
                      left: 10,
                      right: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: 30),
                        child: Container(
                          width: double.infinity,
                          color: Colors.black54,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 1,
                                  bottom: 8,
                                  top: 8,
                                  right: 8,
                                ),
                                child: Text(
                                  'هل تقصد ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                              ),
                              Text(
                                corrected,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                '؟',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SizedBox(
                height: double.infinity,
                child: ListView.builder(
                    itemCount: hadithes.length,
                    itemBuilder: (context, i) {
                      return HadithDetail(
                        hadithes[i],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
