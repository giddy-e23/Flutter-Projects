import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screen_1.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bank_app/utilities/customer_data.dart';

const kPrimaryColor = Color(0xff662AB2);
// void main() {
//   runApp(const Home());
// }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Homepage(),
      theme: ThemeData(
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.all(
              const TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0)),
          indicatorColor: Colors.white,
          backgroundColor: Color(0xffFFFFFF),
        ),
        primaryColor: const Color(0xff662AB2),
        useMaterial3: true,
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //TODO: add an icon here
              SizedBox(
                width: 92,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'images/cash_ease.png',
                      width: 17.5,
                      height: 17.5,
                    ),
                    Text(
                      'CashEase',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              Container(
                width: 116,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      'images/award_star.svg',
                      width: 17.5,
                      height: 17.5,
                    ),
                    Text(
                      '1.972 Points',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  CupertinoIcons.arrow_right_arrow_left_circle_fill,
                ),
                label: "Home"),
            NavigationDestination(
                icon: Icon(
                  Icons.assignment,
                ),
                label: "Report"),
            CircleAvatar(
              radius: 24.0,
              backgroundColor: kPrimaryColor,
              child: Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
                size: 36.0,
              ),
            ),
            NavigationDestination(
                icon: Icon(
                  Icons.history,
                ),
                label: "History"),
            NavigationDestination(
                icon: Icon(
                  CupertinoIcons.person_circle_fill,
                ),
                label: "Account"),
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: height * 0.12,
                        color: kPrimaryColor,
                        padding: EdgeInsets.only(top: 0),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Your balance",
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            ),
                            Text(
                              'Rp 24.321.900',
                              style: TextStyle(
                                  fontSize: 28.0, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: height * 0.1),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50.0),
                                  topRight: Radius.circular(50.0))),
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 0),
                            child: Column(children: [
                              SizedBox(
                                height: height,

                                child: ListView(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(top: 12.0),
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Send Again',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'See all',
                                              style: TextStyle(
                                                  color: Color(0xff059D8B)),
                                            ),
                                            Icon(
                                              Icons.arrow_right_alt_rounded,
                                              color: Color(0xff059D8B),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 100,
                                      width: double.infinity,
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          SizedBox(
                                            width: 80,
                                            height: 50,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                DottedBorder(
                                                  color: kPrimaryColor,
                                                  borderType: BorderType.Circle,
                                                  strokeWidth: 2,
                                                  child: const CircleAvatar(
                                                    child: Icon(
                                                      Icons.add,
                                                      color: kPrimaryColor,
                                                    ),
                                                    backgroundColor:
                                                        Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  'Add New',
                                                  style: TextStyle(
                                                      color: kPrimaryColor),
                                                )
                                              ],
                                            ),
                                          ),
                                          Avatar(
                                            name: 'Alexandria',
                                            imagePath: 'images/avatar1.jpg',
                                          ),
                                          Avatar(
                                            name: 'Alexandria',
                                            imagePath: 'images/avatar2.jpg',
                                          ),
                                          Avatar(
                                            name: 'Alexandria',
                                            imagePath: 'images/avatar3.jpg',
                                          ),
                                          Avatar(
                                            name: 'Alexandria',
                                            imagePath: 'images/avatar3.jpg',
                                          ),
                                          Avatar(
                                            name: 'Alexandria',
                                            imagePath: 'images/avatar1.jpg',
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Latest Transaction',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'See all',
                                              style: TextStyle(
                                                  color: Color(0xff059D8B)),
                                            ),
                                            Icon(
                                              Icons.arrow_right_alt_rounded,
                                              color: Color(0xff059D8B),
                                            )
                                          ],
                                        ),

                                      ],
                                    ),
                                    ListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      leading: const CircleAvatar(
                                       child: Icon(CupertinoIcons.arrow_right_arrow_left_circle_fill,),

                                      ),
                                      title: Text(
                                        'Transfer',
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text(
                                        personOne.time,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black38),
                                      ),
                                      trailing: Text(
                                        personOne.accBalance,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      leading: const CircleAvatar(
                                        child: Icon(CupertinoIcons.arrow_right_arrow_left_circle_fill,),

                                      ),
                                      title: Text(
                                        'Transfer',
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text(
                                        personOne.time,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black38),
                                      ),
                                      trailing: Text(
                                        personOne.accBalance,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      leading: const CircleAvatar(
                                        child: Icon(CupertinoIcons.arrow_right_arrow_left_circle_fill,),

                                      ),
                                      title: Text(
                                        'Transfer',
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text(
                                        personOne.time,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black38),
                                      ),
                                      trailing: Text(
                                        personOne.accBalance,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      leading: const CircleAvatar(
                                        child: Icon(CupertinoIcons.arrow_right_arrow_left_circle_fill,),

                                      ),
                                      title: Text(
                                        'Transfer',
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text(
                                        personOne.time,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black38),
                                      ),
                                      trailing: Text(
                                        personOne.accBalance,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      leading: const CircleAvatar(
                                        child: Icon(CupertinoIcons.arrow_right_arrow_left_circle_fill,),

                                      ),
                                      title: Text(
                                        'Transfer',
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text(
                                        personOne.time,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black38),
                                      ),
                                      trailing: Text(
                                        personOne.accBalance,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: height * 0.11,
              child: Container(
                margin: EdgeInsets.only(right:16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20.0,
                          spreadRadius: 20.0,
                          offset: Offset(0, 0))
                    ]),
                // height: height * 0.13,
                width: width,
                // margin: EdgeInsets.symmetric(horizontal: 10.0),
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NavIcon(
                        icon: CupertinoIcons.arrow_right_arrow_left_circle_fill,
                        label: "Transfer",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TransferPage()));
                        },
                      ),
                      NavIcon(
                        icon: Icons.account_balance_wallet,
                        label: "Top Up",
                        onTap: () {},
                      ),
                      NavIcon(
                          icon: Icons.local_atm,
                          label: "Withdraw",
                          onTap: () {}),
                      NavIcon(
                          icon: CupertinoIcons.ellipsis_circle_fill,
                          label: "Account",
                          onTap: () {}),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class NavIcon extends StatelessWidget {
  IconData icon;
  String label;
  NavIcon(
      {super.key,
      required this.icon,
      required this.label,
      required this.onTap});
  var onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Icon(
              icon,
              color: kPrimaryColor,
            ),
            Text(
              label,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
            )
          ],
        ));
  }
}

class Avatar extends StatelessWidget {
  final String name;
  final String imagePath;
  Avatar({
    super.key,
    required this.name,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        CircleAvatar(backgroundImage: AssetImage(imagePath)),
        Text(
          name,
          style: TextStyle(fontSize: 14),
        )
      ]),
    );
  }
}

// child: NavigationBar(
//   onDestinationSelected: (int selected) {
//     setState(() {
//       Navigator.pushNamed(context, 'Screen_$selected');
//     });
//   },
//   destinations: [
//     NavigationDestination(
//       icon: NavIcon(
//         icon:
//             CupertinoIcons.arrow_right_arrow_left_circle_fill,
//       ),
//       label: "Transfer",
//     ),
//     NavigationDestination(
//         icon: NavIcon(
//           icon: Icons.account_balance_wallet,
//         ),
//         label: "Top Up"),
//     NavigationDestination(
//         icon: NavIcon(icon: Icons.local_atm),
//         label: "Withdraw"),
//     NavigationDestination(
//         icon: NavIcon(
//           icon: CupertinoIcons.ellipsis_circle_fill,
//         ),
//         label: "Account"),
//   ],
// ),
