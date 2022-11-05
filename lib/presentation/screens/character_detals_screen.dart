// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:untitled/constants/my_colors.dart';
import 'package:untitled/data/models/characters.dart';


class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo(
                        'Name: ',
                        character.name,
                      ),
                      buildDivider(250),
                      characterInfo(
                        'Actor/Actress: ',
                        character.actorName,
                      ),
                      buildDivider(250),
                      characterInfo(
                        'Job: ',
                        character.jobs.join(' / '),
                      ),
                      buildDivider(250),
                      characterInfo(
                        'Date of birth: ',
                        character.birthday,
                      ),
                      buildDivider(250),
                      characterInfo(
                        'Appeared in: ',
                        character.category,
                      ),
                      buildDivider(250),
                      characterInfo(
                        'Seasons: ',
                        character.appearance.join(' / '),
                      ),
                      buildDivider(250),

                      character.betterCallSaulAppearance.isEmpty? Container(): characterInfo(
                        'Better Call Saul Seasons: ',
                        character.betterCallSaulAppearance.join(' / '),
                      ),
                      character.betterCallSaulAppearance.isEmpty? Container(): buildDivider(250),
                      characterInfo(
                        'Status: ',
                        character.statusIfDeadOrAlive,
                      ),
                      buildDivider(250),
                    ],
                  ),
                ),
                SizedBox(height: 500,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      //have the image as a background and the title which is the character's nickname
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        title: Text(
          character.nickName,
          style: TextStyle(color: MyColors.myWhite),
          // textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: TextStyle(
                  color: MyColors.myWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            TextSpan(
              text: value,
              style: TextStyle(color: MyColors.myWhite, fontSize: 16),
            ),
          ],
        ));
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: MyColors.myYellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }
}
