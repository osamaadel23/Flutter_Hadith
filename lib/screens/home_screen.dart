import 'package:flutter/material.dart';

import 'package:grouped_buttons/grouped_buttons.dart';

import '../widgets/home_menu_card.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final _urlFocusNode = FocusNode();

  final searchFiledTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.transparent,
          // elevation: 0,
          title: Container(
              alignment: Alignment.center, child: Text('جامع الأحاديث'))),
      drawer: AppDrawer(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/main20.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/half-circle50.png",
                    ),
                    Stack(
                      children: <Widget>[
                        Center(
                          child: Image.asset(
                            "assets/images/tasbih.png",
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.20,
                          ),
                        ),
                        Center(
                          child: Text(
                            '9999',
                            style: TextStyle(
                                fontSize: 40,
                                color: Color(0xFFe1c55e),
                                // backgroundColor: Colors.blue,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Tajwal'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextFormField(
                        controller: searchFiledTextController,
                        decoration: InputDecoration(
                          labelText: "بحث",
                          hintText: "البحث عن حديث",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              //TODO: ايه اللي هيحصل لما ادوس ع السيرش بوتون
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: IconButton(
                      icon: Icon(
                        Icons.settings,
                        size: 40,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'البحث المتقدم',
                              ),
                              content: SingleChildScrollView(
                                child: CheckboxGroup(
                                  labels: <String>[
                                    "الأحاديث الصحيحة",
                                    "الاحاديث الضعيفة",
                                    "الأحاديث الموضوعة",
                                  ],
                                  onSelected: (List<String> checked) {
                                    print(
                                      checked.toString(),
                                    );
                                  },
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('موافق'),
                                )
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        HomeMenuCards(
                          title: 'تصنيفات الكتب',
                          icon: Icons.library_books,
                          onpressed: () {
                            Navigator.of(context).pushNamed('/books');
                          },
                        ),
                        HomeMenuCards(
                          title: 'تصنيفات الأحاديث',
                          icon: Icons.assistant,
                          onpressed: () {
                            Navigator.of(context).pushNamed('/hadith-types');
                          },
                        ),
                        HomeMenuCards(
                          title: 'المفضلة',
                          icon: Icons.favorite,
                          onpressed: () {
                            Navigator.of(context).pushNamed('/favorites');
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          HomeMenuCards(
                            title: 'اختبارات',
                            // icon: Icons.question_answer,
                            icon: Icons.help,
                            onpressed: () {
                              Navigator.of(context).pushNamed('/quizes');
                            },
                          ),
                          HomeMenuCards(
                            title: 'السبحة',
                            // icon: Icons.linear_scale,
                            icon: Icons.touch_app,
                            onpressed: () {
                              Navigator.of(context).pushNamed('/rosary');
                            },
                          ),
                          HomeMenuCards(
                            title: 'عن التطبيق',
                            icon: Icons.info,
                            onpressed: () {
                              Navigator.of(context).pushNamed('/about-us');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
