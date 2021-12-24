import 'package:flutter/material.dart';
import 'package:flutter_lottie_app1/article_model.dart';
import 'package:flutter_lottie_app1/services.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  ApiService client = ApiService();

  Future _launchUrl(String urlString) async {
    var url = urlString;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Unable to launch url $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'flutter tab',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'NEWS',
              style: TextStyle(
                color: Colors.black
              ),
            ),
            bottom: TabBar(
                unselectedLabelColor: Colors.redAccent,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.redAccent,
                ),
                tabs: const [
                  Tab(
                    text: 'APPS',
                  ),
                  Tab(
                    text: 'MOVIES',
                  ),
                  Tab(
                    text: 'GAMES',
                  ),
                ]),
          ),
          body: TabBarView(children: [
            ListView(shrinkWrap: true, children: [
              FutureBuilder(
                future: client.getArticle('apps'),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Article>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    List<Article>? articles = snapshot.data;
                    if (articles != null) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: articles.length,
                        separatorBuilder: (BuildContext context, index) =>
                            const Divider(
                          color: Colors.black,
                        ),
                        itemBuilder: (context, index) => ListTile(
                            leading: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                articles[index].urlToImage!,
                                // width: 32,
                              ),
                            ),
                            title: Text(
                              articles[index].title!,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              articles[index].url!,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onTap: () {
                              _launchUrl(articles[index].url!);
                            }),
                      );
                    }
                  }
                  return Container(
                    padding: const EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                },
              ),
            ]),
            ListView(shrinkWrap: true, children: [
              FutureBuilder(
                future: client.getArticle('movies'),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Article>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    List<Article>? articles = snapshot.data;
                    if (articles != null) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: articles.length,
                        separatorBuilder: (BuildContext context, index) =>
                            const Divider(
                          color: Colors.black,
                        ),
                        itemBuilder: (context, index) => ListTile(
                            leading: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                articles[index].urlToImage!,
                                // width: 32,
                              ),
                            ),
                            title: Text(
                              articles[index].title!,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              articles[index].url!,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onTap: () {
                              _launchUrl(articles[index].url!);
                            }),
                      );
                    }
                  }
                  return Container(
                    padding: const EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                },
              ),
            ]),
            ListView(shrinkWrap: true, children: [
              FutureBuilder(
                future: client.getArticle('games'),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Article>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    List<Article>? articles = snapshot.data;
                    if (articles != null) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: articles.length,
                        separatorBuilder: (BuildContext context, index) =>
                            const Divider(
                          color: Colors.black,
                        ),
                        itemBuilder: (context, index) => ListTile(
                            leading: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                articles[index].urlToImage!,
                                // width: 32,
                              ),
                            ),
                            title: Text(
                              articles[index].title!,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              articles[index].url!,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onTap: () {
                              _launchUrl(articles[index].url!);
                            }),
                      );
                    }
                  }
                  return Container(
                    padding: const EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                },
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
