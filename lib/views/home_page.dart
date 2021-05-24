import 'package:flutter/material.dart';
import 'package:profiles_list/models/profile.dart';
import 'package:profiles_list/viewmodels/home_viewmodel.dart';
import 'package:profiles_list/views/cells/profile_cell.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel vm = HomeViewModel();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: new Container(
        alignment: Alignment.centerRight,
        child: Row(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: widget.vm.isLowerPageNumberEnabled()
                        ? () {
                            widget.vm.lowerPageNumber();
                            setState(() {});
                          }
                        : null,
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Text(widget.vm.pageNumber.toString()),
                  IconButton(
                    onPressed: widget.vm.isUpperPageNumberEnabled()
                        ? () {
                            widget.vm.upperPageNumber();
                            setState(() {});
                          }
                        : null,
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            new Theme(
              child: new DropdownButtonHideUnderline(
                  child: new DropdownButton<int>(
                value: widget.vm.numberOfItemsPerPage,
                items: <DropdownMenuItem<int>>[
                  new DropdownMenuItem(
                    child: new Text('10'),
                    value: 10,
                  ),
                  new DropdownMenuItem(
                    child: new Text('25'),
                    value: 25,
                  ),
                  new DropdownMenuItem(
                    child: new Text('50'),
                    value: 50,
                  ),
                  new DropdownMenuItem(
                    child: new Text('100'),
                    value: 100,
                  ),
                ],
                onChanged: (value) {
                  widget.vm.numberOfItemsPerPage = value!;
                  widget.vm.pageNumber = 1;
                  setState(() {});
                },
              )),
              data: new ThemeData.dark(),
            )
          ],
        ),
      )),
      body: Center(
          child: FutureBuilder<List<Profile>>(
        future: widget.vm.getProfiles(), // async work
        builder: (BuildContext context, AsyncSnapshot<List<Profile>> snapshot) {
          if (snapshot.hasError)
            return Text('Error: ${snapshot.error}');
          else
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return RefreshIndicator(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ProfileCell(profile: snapshot.data![index]);
                      },
                    ),
                    onRefresh: () async => setState(() {
                          widget.vm.refresh();
                        }));
              default:
                return Text('Loading');
            }
        },
      )),
    );
  }
}
