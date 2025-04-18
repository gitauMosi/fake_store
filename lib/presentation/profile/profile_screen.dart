import 'package:flutter/material.dart';

import '../../core/constants/app_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: AppStyles.subTitleBold),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Theme.of(context).cardColor),
            child: Stack(children: [
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://www.shutterstock.com/image-photo/profile-picture-smiling-successful-young-260nw-2040223583.jpg"))),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: Icon(Icons.edit),
                  ),
                ),
              )
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          _personInfoCard(context)
        ],
      ),
    );
  }

  Widget _personInfoCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 6.0, right: 6.0, top: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Personal",
                  style: AppStyles.subTitleBold,
                ),
                Text(
                  "Edit",
                  style: AppStyles.bodyMediumBold,
                )
              ],
            ),
          ),
          _customTile("Name", "Terry melton", Icons.person_outline),
          _customTile("E-mail", "melton89@gmail.com", Icons.mail_outline),
          _customTile("Phone number", "+277929988", Icons.phone_outlined),
          _customTile("Name", "Terry melton", Icons.home_rounded)
        ],
      ),
    );
  }

  ListTile _customTile(String title, String subtitle, IconData data) {
    return ListTile(
      leading: Icon(data),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
