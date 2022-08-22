// The following methods are useful when we want to use static and dynamic lists in a children


// Method 1:
class MgDrawer extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
        builder: (context, store) {
        return Drawer(
            child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
                Text("Title"),
                ...store.state.availablePage.map((value) {
                return ListTile(
                    title: Text("Title"),
                    onTap: () {},
                );
                }).toList(),
            ],
            ),
        );
        },
    );
    }
}


// Method 2:
 class MgDrawer extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return StoreBuilder<AppState>(
          builder: (context, store) {
            List<Widget> list = store.state.availablePage.map((value) {
              return ListTile(
                title: Text("Title"),
                onTap: () {},
              );
            }).toList();
            list.insert(0, Text("Title"));
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: list,
              ),
            );
          },
        );
      }
    }

// Method 3:
class MgDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (context, store) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Text("Title"),
            ]..addAll(store.state.availablePage.map((value) {
              return ListTile(
                title: Text("Title"),
                onTap: () {},
              );
            }).toList(),),
          ),
        );
      },
    );
  }
}


// ref:
// https://stackoverflow.com/questions/52157230/flutter-dart-add-list-to-children
