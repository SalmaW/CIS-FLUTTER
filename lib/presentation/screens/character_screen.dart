import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/constants/my_colors.dart';
import '../../business_logic/character_cubit.dart';
import '../../data/models/characters.dart';
import '../widgets/characters_item.dart';


class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<Character> allCharacters;
  late List<Character> searchedForCharacters;//the list with searched items
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: Colors.black54,
      decoration: InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18),
      ),
      style: TextStyle(color: MyColors.myGrey, fontSize: 18),
      onChanged: (searchedCharacters) {
        addSearchedForItemsToSearchedList(searchedCharacters);
      },
    );
  }

  void addSearchedForItemsToSearchedList(String searchedCharacters) {
    searchedForCharacters = allCharacters
        .where((element) =>
            element.name.toLowerCase().startsWith(searchedCharacters))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
            onPressed: () {
              _clearSearch();
              Navigator.pop(context); //will return the main home screen
            },
            icon: Icon(Icons.clear, color: MyColors.myGrey)),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(Icons.search, color: MyColors.myGrey),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context)
        .getAllCharacters(); //UI asks the cubit for the state/data.
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).character;
          return buildLoadedListWidget();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _searchTextController.text.isEmpty
          ? allCharacters.length
          : searchedForCharacters.length,
      itemBuilder: (ctx, index) {
        //ctx == context
        return CharacterItem(
          character: _searchTextController.text.isEmpty
              ? allCharacters[index]
              : searchedForCharacters[index],
        );
      },
    );
  }

  Widget _buildAppBarTitle() {
    return Text(
      'Characters',
      style: TextStyle(color: MyColors.myGrey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        leading: _isSearching
            ? BackButton(
                color: MyColors.myGrey,
              )
            : SizedBox(),
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
      ),
      body: buildBlocWidget(),
    );
  }
}
