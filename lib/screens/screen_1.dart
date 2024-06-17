import 'package:bank_app/screens/screen_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bank_app/utilities/customer_data.dart';



class TransferPage extends StatelessWidget {
  TransferPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,

        title: const Center(
            child: Text(
          "Transfer",
          style: TextStyle(
            color: Colors.white,
          ),
        )),
        actions: const [
          Icon(
            Icons.help,
            color: Colors.white,
          ),
        ],
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: Padding(
              padding: EdgeInsets.all(5.0),
            )),
      ),
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 30.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffEFE5FD),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.people_rounded,
                                      color: Colors.deepPurple, size: 40.0),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  Text(
                                    "Transfer to Friends",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0xffEFE5FD),
                        ),
                        child: const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.account_balance,
                                      color: Colors.deepPurple, size: 40.0),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  Text(
                                    "Transfer to Bank",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 0, 10.0),
              child: Text(
                "Latest Transfer",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage("images/avatar1.jpg"),
                      radius: 30.0,
                    ),
                    title: Text(
                      personOne.name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      personOne.time,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.black38),
                    ),
                    trailing: Text(
                      personOne.accBalance,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage("images/avatar2.jpg"),
                    ),
                    title: Text(
                      personTwo.name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      personTwo.time,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.black38),
                    ),
                    trailing: Text(
                      personTwo.accBalance,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage("images/maybank.jpg"),
                    ),
                    title: Text(
                      personThree.name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      personThree.time,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.black38),
                    ),
                    trailing: Text(
                      personThree.accBalance,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage("images/avatar3.jpg"),
                    ),
                    title: Text(
                      personFour.name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      personFour.time,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.black38),
                    ),
                    trailing: Text(
                      personFour.accBalance,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage("images/bank_bri.jpg"),
                    ),
                    title: Text(
                      personFive.name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      personFive.time,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.black38),
                    ),
                    trailing: Text(
                      personFive.accBalance,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage("images/bank_bri.jpg"),
                    ),
                    title: Text(
                      personSix.name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      personSix.time,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.black38),
                    ),
                    trailing: Text(
                      personSix.accBalance,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  ListTile(
                    leading: const CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage("images/avatar4.jpeg"),
                    ),
                    title: Text(
                      personSeven.name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      personSeven.time,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.black38),
                    ),
                    trailing: Text(
                      personSeven.accBalance,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
