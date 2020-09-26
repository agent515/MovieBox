import 'package:flutter/material.dart';
import 'package:movie_box/components/cast_pic_card.dart';
import 'package:movie_box/components/custom_card.dart';
import 'package:movie_box/components/heading3.dart';
import 'package:movie_box/components/movie_poster_card.dart';
import 'package:movie_box/components/review.dart';
import 'package:movie_box/constants/styles.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:like_button/like_button.dart';
import 'package:movie_box/helper.dart';
import 'package:movie_box/services/api.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({this.data});
  final Map<dynamic, dynamic> data;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool showMore = false;
  bool longName = true;
  bool tapped = false;
  bool isLiked = false;
  bool addedToWatchlist = false;
  Map<dynamic, dynamic> data;
  Map<dynamic, dynamic> castCrewData = null;

  @override
  void initState() {
    data = widget.data;
    print("data: $data");
    print("length: ${data["genres"].length}");
    print("${data["genres"]} ");
    if (data['title'].length > 20 && data['title'].split(' ').length >= 3) {
      longName = true;
    } else {
      longName = false;
    }
    super.initState();
  }

  Widget _getMovieTitle() {
    String title = data["title"];
    List<String> words = title.split(' ');
    int wordCount = title.split(' ').length;
    String firstPart = "";
    String secondPart = "";

    if (title.length > 20 && wordCount >= 3) {
      setState(() {
        longName = true;
      });
      for (int i = 0; i <= wordCount ~/ 2; i++) {
        firstPart += " " + words[i];
      }
      for (int i = wordCount ~/ 2 + 1; i < wordCount; i++) {
        secondPart += " " + words[i];
      }
    } else {
      setState(() {
        longName = false;
      });
      for (int i = 0; i < wordCount; i++) {
        firstPart += " " + words[i];
      }
    }
    print(longName);
    print(firstPart);
    print(secondPart);

    return Flex(direction: Axis.vertical, children: <Widget>[
      Text(
        firstPart,
        maxLines: 1,
        style: kDetailsTitleTextStyle,
        textAlign: TextAlign.center,
      ),
      longName
          ? Text(
              secondPart,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: kDetailsTitleTextStyle,
            )
          : Container(
              height: 0,
            ),
    ]);
  }

  Widget _getStars() {
    List<Widget> stars = [];
    double rating = data["vote_average"];
    int fullStars = rating ~/ 2;
    var temp = rating - ((rating ~/ 2)*2);
    int halfStars = 0;
    if (temp >= 1.5) {
      fullStars += 1;
    }
    else if (temp >= 0.5) {
      halfStars = 1;
    }
    int zeroStars = 5 - fullStars - halfStars;

    for (int i = 1; i <= fullStars; i++) {
      stars.add(Icon(Icons.star,
          color: Colors.yellow, size: 16.0));
    }

    for (int i = 1; i <= halfStars; i++) {
      stars.add(Icon(Icons.star_half,
          color: Colors.yellow, size: 16.0));
    }

    for (int i = 1; i <= zeroStars; i++) {
      stars.add(Icon(Icons.star_border , color: Colors.yellow, size: 16.0));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
    children: stars,
    );
  }

  Future<List<Widget>> _getCastCrew(String entity) async {
    if (castCrewData == null) {
      var result = await Api.getCastCrew(data["id"]);
      castCrewData = result;
    }
    List<Widget> entityList = [];
    if (entity == "Cast") {
      for (int i = 0; i < castCrewData["cast"].length; i++) {
        Widget card = CastPicCard(
          name: castCrewData["cast"][i]["name"],
          role: castCrewData["cast"][i]["character"],
          imageUri:
          (castCrewData["cast"][i]["profile_path"] == null) ? "" : "https://image.tmdb.org/t/p/w300${castCrewData["cast"][i]["profile_path"]}",
        );
        entityList.add(card);
      }
    }
    else if (entity == "Crew") {
      for (int i = 0; i < castCrewData["crew"].length; i++) {
        Widget card = CastPicCard(
          name: castCrewData["crew"][i]["name"],
          role: castCrewData["crew"][i]["job"],
          imageUri:
          (castCrewData["crew"][i]["profile_path"] == null) ? "" : "https://image.tmdb.org/t/p/w300${castCrewData["crew"][i]["profile_path"]}",
        );
        entityList.add(card);
      }
    }
    return entityList;
  }

  List<Widget> _getNumbers() {
    List<Widget> cards = [];
    Widget card;
    if ( data.containsKey("release_date") ) {
      var date = Helper.dateIntToChar(data["release_date"]);
      card = CustomCard(
        property: "Release Date",
        value: "${date["day"]} ${date["month"]}\n${date["year"]}",
      );
      cards.add(card);
    }
    if ( data.containsKey("runtime") ) {
      var result = Helper.runtimeIntToChar(data["runtime"]);
      card = CustomCard(
        property: "Runtime",
        value: "${result['hours']}H ${result['minutes']}M",
      );
      cards.add(card);
    }
    if (data.containsKey("vote_average")) {
      Widget card = CustomCard(
        property: "Rating",
        value: data["vote_average"].toString(),
      );
      cards.add(card);
    }
    if (data.containsKey("revenue")) {
      var revenue = Helper.revenueIntToChar(data["revenue"]);
      print(revenue);
      Widget card = CustomCard(
        property: "Revenue",
        value: "\$${revenue["amount"]} ${revenue["scale"]}",
      );
      cards.add(card);
    }
    if (data.containsKey("original_language")) {
      Widget card = CustomCard(
        property: "Language",
        value: "en",
      );
      cards.add(card);
    }
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: showMore ? ScrollPhysics() : NeverScrollableScrollPhysics(),
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanUpdate: (dragDownDetails) {
              setState(() {
                tapped = false;
                showMore = true;
              });
            },
            onLongPress: () {
              setState(() {
                tapped = !tapped;
              });
            },
            onTap: null,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height - 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
//                          'https://cdn.shopify.com/s/files/1/0969/9128/products/Joker_-_Put_On_A_Happy_Face_-_Joaquin_Phoenix_-_Hollywood_English_Movie_Poster_3_6cb8f765-be3f-4cb8-bb4e-ead8c435e42e.jpg?v=1579504964',
                          "https://image.tmdb.org/t/p/w500${data["poster_path"]}",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // TODO: Add Like Button to add movie to Liked Movie List
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2 + 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: const Alignment(0.0, -0.25),
                          end: const Alignment(0.0, -1),
                          colors: <Color>[
                            Colors.white.withOpacity(1),
                            Colors.white.withOpacity(0),
                          ],
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: longName ? 6 : 4,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 5,
                            ),
                          ),
                          Expanded(
                            flex: longName ? 5 : 2,
                            child: _getMovieTitle(),
                          ),
                          Expanded(
                              flex: longName ? 2 : 2,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        data["release_date"]
                                            .toString()
                                            .substring(0, 4),
                                        style: kDetailsSubtitleTextStyle,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.grey,
                                          size: 8.0,
                                        ),
                                      ),
                                      Text(
                                          data["production_companies"].length > 0 ?  data["production_companies"][0]["name"] : "Not Known",
                                          maxLines: 1,
                                          style: kDetailsSubtitleTextStyle)
                                    ],
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(
                                          data["genres"].length,
                                          (index) => Text(
                                                "${data["genres"][index]["name"].toString()}  ",
                                                style: kDetailsGenreTextStyle,
                                              )))
                                ],
                              )),
                          Expanded(
                            flex: longName ? 2 : 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: _getStars(),
                            ),
                          ),
                          Expanded(
                            flex: longName ? 4 : 2,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Watch Trailer',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.black54,
                                    fontSize: 12,
                                    fontFamily: 'SourceSansPro',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                ClipOval(
                                  child: Material(
                                    elevation: 2.0,
                                    child: InkWell(
                                      splashColor: Colors.deepOrange,
                                      onTap: () async {
                                        String url = await Api.getVideoLink(data["imdb_id"].toString());
                                        if (url == "") {
                                          if (data.containsKey("imdb_id")) {
                                            url =
                                            "https://www.youtube.com/results?search_query=${data["title"]}";
                                          }
                                        }
                                          print(url);
//                                        String url =
//                                            "https://www.imdb.com/videoplayer/vi1723318041";
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                      child: Icon(
                                        Icons.play_circle_filled,
                                        color: Colors.orangeAccent,
                                        size: 42.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: longName ? 8 : 4,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 4.0),
                              child: Text(
//                                'The Joker is a master criminal with a clown-like appearance, and is considered one of the most infamous criminals within Gotham City. Initially portrayed as a violent sociopath who murders people for his own amusement, the Joker later in the 1940s began to be written as a goofy trickster-thief. Initially portrayed as a violent sociopath who murders people for his own amusement, the Joker later in the 1940s began to be written as a goofy trickster-thief.',
                                data["overview"],
                                textAlign: TextAlign.justify,
                                maxLines: 7,
                                style: kDetailsDescriptionTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  showMore
                      ? Container()
                      : Positioned(
                          left: (MediaQuery.of(context).size.width - 26) / 2,
                          bottom: MediaQuery.of(context).size.height * 0.04,
                          child: Center(
                            child: GestureDetector(
                              onTap: () async {
                                setState(() {
                                  showMore = true;
                                });
                              },
                              child: Container(
                                height: 20,
                                child: IconShadowWidget(
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 24.0,
                                    color: Colors.deepPurple[900],
                                  ),
                                  shadowColor: Colors.black12.withOpacity(0.7),
                                ),
                              ),
                            ),
                          ),
                        ),
                  tapped
                      ? Container(
                          height: MediaQuery.of(context).size.height,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment(0, 0),
                                end: Alignment(0, -1),
                                colors: <Color>[
                                  Colors.black12.withOpacity(0.2),
                                  Colors.black12.withOpacity(0.7)
                                ]),
                          ),
                          alignment: Alignment(0.0, -0.5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.white.withOpacity(0),
                              child: InkWell(
                                splashColor: Colors.white,
                                onTap: () {
                                  // TODO: Add to Watchlist
                                  setState(() {
                                    addedToWatchlist = !addedToWatchlist;
                                  });
                                },
                                child: Container(
                                    height: 32.0,
                                    width: 200.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: addedToWatchlist
                                            ? Colors.black54.withOpacity(0)
                                            : Colors.white,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: addedToWatchlist
                                          ? Colors.white
                                          : Colors.black54.withOpacity(0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        addedToWatchlist
                                            ? 'Added'
                                            : 'Add to watchlist',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          color: addedToWatchlist
                                              ? Colors.black54.withOpacity(0.7)
                                              : Colors.white,
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1.0,
                                        ),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          showMore
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Heading3(
                          title: 'Cast',
                        ),
                        FutureBuilder(
                          future: _getCastCrew("Cast"),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                              return Container(
                                height: 200,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: snapshot.data,
                                  ),
                              );
                            }
                            else {
                              return Container(height: 200,);
                            }
                          },
                        ) ,
                        Heading3(
                          title: 'Crew',
                        ),
                        FutureBuilder(
                          future: _getCastCrew("Crew"),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                              return Container(
                                height: 200,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: snapshot.data,
                                ),
                              );
                            }
                            else {
                              return Container(height: 200,);
                            }
                          },
                        ),
                        Heading3(title: 'Numbers'),
                        Container(
                          height: 300,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return GridView.count(
                                  physics: NeverScrollableScrollPhysics(),
                                  crossAxisCount: 3,
                                  children: _getNumbers());
                            },
                          ),
                        ),
                        Heading3(title: 'See Also'),
                        Container(
                          height: 160.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              MoviePosterCard(
                                name: 'Dark Knight',
                                imageUri:
                                    'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg',
                              ),
                              MoviePosterCard(
                                name: 'Dark Knight',
                                imageUri:
                                    'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg',
                              ),
                              MoviePosterCard(
                                name: 'Avengers: End Game',
                                imageUri:
                                    'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_.jpg',
                              ),
                              MoviePosterCard(
                                name: 'Dark Knight',
                                imageUri:
                                    'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg',
                              ),
                              MoviePosterCard(
                                name: 'Dark Knight',
                                imageUri:
                                    'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg',
                              ),
                              MoviePosterCard(
                                name: 'Dark Knight',
                                imageUri:
                                    'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg',
                              ),
                            ],
                          ),
                        ),
                        Heading3(title: 'Reviews'),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Review(
                                author: 'msbreviews',
                                comment:
                                    "If you enjoy reading my Spoiler-Free reviews, please follow my blog :)\r\n\r\nObviously, Joker is one of my most anticipated movies of 2019. I mean, how couldn't it be?! Besides belonging to the superhero genre, DC has been on a streak of great films within its universe, so an isolated installment definitely excites me, especially about one of the evilest villains ever. It's by far one of the less comic-book-y flicks of the century. It doesn't follow the generic origin story formula, it avoids any cliches associated with the genre, and it's the type of movie that's becoming more and more rare nowadays. It's a character study like we haven't seen in a long time.\r\n\r\nI'll simply begin with the person that elevates the entire thing: Joaquin Phoenix. Now, if there's something I'm not going to do is compare his performance with Heath Ledger's. That's the number one mistake people are going to keep making forever. First of all, The Dark Knight and Joker couldn't be more distinct films, even if they belong to the same genre (despite Joker being unique, it's still about a famous comic-book villain). Then, despite Phoenix and Ledger portraying the same \"version\" of the clown (crazy, sadistic psychopath), the former is 90% Arthur Fleck while the latter is 100% Joker, throughout each of their movies. Finally, Phoenix is the sole protagonist of this feature, while Ledger had the best live-action Batman sharing the spotlight.\r\n\r\nIn conclusion, it's both unfair, and a bit unreasonable to compare both interpretations since their roles have a different impact on the narrative, as well as each film being entirely different. In the end, both are impressive. However, let's switch to Phoenix since he's the star of this show … He has 2019's best performance, by far! With a strong marketing campaign, I'm sure he'll get that Oscar. I hope so! It's so well-deserved. Todd Phillips and Scott Silver developed a brilliant screenplay, but Phoenix elevates it to a whole other level.\r\n\r\nThroughout the entire runtime, I felt weird. Perturbed. Even uncomfortable with what I was watching and consequently feeling. It's a dark, brutal, violent, emotionally powerful origin of a villain who I feel disturbingly empathetic towards. Phoenix makes the story work due to its remarkably captivating display of someone who's mentally ill. Arthur Fleck slowly becoming crazier is due to how society behaves and not due to some chemical pool that transforms his skin white and hair green (nothing wrong with this, but I know which origin story I prefer). \"The world is getting crazier out there\", and it becomes excruciatingly painful to deal with it, especially when so much is going on with Arthur’s personal life, and most of it he doesn't even realize because he tries to hide everything behind a smile.\r\n\r\nIt's a screenplay filled with narrative twists that not only pack a punch of surprise but leave you feeling extremely upset. The last act is one of the best in the last few years. If the second act is an enormous build-up, the last one is a terrific payoff. I can't remember the last movie I saw where I loved 100% every single narrative decision. I wouldn't do any of the big moments differently. There are so many excellent references hidden in plain sight that comic-book fans (and fans of the TDK trilogy as well) will love just like I did. In the ending, there's one pivotal moment in particular that serves as the absolute climax … I got chills all over my body. They couldn't have done that scene more perfect. I only have one tiny nitpick with the way some scenes feel repetitive since they neither move the plot forward or give us anything new. Some of these still help to create tension, some feel like they're just… there.\r\n\r\nA Best Picture and Best Actor nominations seem to be on its way, but these are not the only achievements that deserve to be recognized. The original score by Hildur Guðnadóttir is incredibly addictive, so much that I'm listening to it while writing this review. It definitely helps to generate tremendous build-up, and it elevates the sinister environment of Gotham City. Lawrence Sher's cinematography is utterly stunning. The underexposure of some scenes is glorious. Sher paints the screen with so many gorgeous shots, especially with his close-ups on Phoenix, where the latter is able to shine. Jeff Groth is also impeccable in the editing room. There are several long takes with Phoenix just giving his all and letting all his emotions out (or keeping them all contained), which is always something I deeply appreciate since it helps with the flow of the narrative.\r\n\r\nRegarding the film's controversy surrounding its messages and the incentive to violence, I really don't know what to say. It's ridiculous. I remember those times when going into the movie theater was a surreal experience. It was the number one place for people to forget about their lives, jobs, everything. Joker is a fictional story! It's the origin of one of the worst psychopaths in the history of comic-books and cinema. If people expected to leave the theater \"happy\" or \"joyful\", then at least one of the film's message is right: society really is getting crazier. Have people forgotten who Joker is? What could you possibly expect from his origin story?!\r\n\r\nNowadays, no one knows how to behave (social media is the primary source for spreading hate). No one respects the fellow citizen or even the world itself. More and more people only look at their own bellies. Political agendas are everywhere. New extreme movements are created every other year. Social hypersensibility is exponentially growing. The same way some people will hate this movie for not being able (or simply not wanting) to accept that they feel empathy towards a murderer, people all around the world behave like their actions don't reflect on another person's life and on their own planet. If people get ruthlessly violent because they watched Joker, how can someone complain that the film's message is bad when it's eventually true?\r\n\r\nAll in all, Joker is one of the best movies of the year, and it's definitely on my Top3 at the date of this review. Joaquin Phoenix delivers my favorite male performance of 2019, by elevating a script about the origin of one of the evilest villains ever. The way he gradually becomes more insane is worthy of study, but it's how he's able to make the audience create empathy towards a psychopath that leaves me disturbingly captivated. Todd Phillips produces a character-study filled with an astonishingly tense build-up and one of the most chill-inducing payoffs of the last few years. With every single narrative decision nailed perfectly, Hildur Guðnadóttir's score and Lawrence Sher's cinematography stand out. The lack of restraint in showing the unmerciful violence (physical and mental) that society inflicts on one another is what makes us feel unsettled. Because we know it's mostly true, and we refuse to accept it. It's not a film about the Joker. It's a very realistic portrayal of someone (anyone!) who can become someone like him. And it's disturbingly brilliant!\r\n\r\nPS: Robert DeNiro (Murray Franklin) and Zazie Beetz (Sophie Dumond) are also great. Phoenix's performance is so mesmerizing that I almost forgot there were other actors in the movie.\r\n\r\nRating: A",
                              ),
                              Review(
                                author: 'solstafir7',
                                comment:
                                    "Joker. The character that has existed since 1940, has become so heavy with so many different portrayals, different origins, that it feels impossible for any mortal man alive to impersonate the scattered personalities. It is an insurmountable task for any director to digest it all and still produce one more.\r\n\r\nTodd Phillips had a crazy challenge. He brought in one of the best actors alive to lift it with him, Joaquin Phoenix. Together, they have built a mass-market masterpiece which is just above the crop. It is appropriately crazy and completely focussed on the central character. The narrator goes close to the shores of that craziness, wets his feet but remains dry to tell this story. It is like those news reporters which go closer to the burning amazon, but it is impossible to step in the fumes. In no way, Joker is telling his story. Instead, his story is told to us and there are pillars of sanity (like the detectives, asylum clerk etc.) which remain steadfast to give a strong anchor to the audience. This dilutes the effect of the film.\r\n\r\nWith the copious amount of material on Joker already, I wished to consider this film as a standalone character study vaguely inspired by the batman universe. But this is not entirely possible. I was forced to think about it on two levels. With Batman and Without Batman. \r\n\r\nWith Batman, The Joker is on the home turf. There have been many renditions of Joker, and Heath Ledger's portrayal is still vivid in my mind. I knew that Arthur here will go on to become someone who is going to say, “‎Introduce a little anarchy. Upset the established order, and everything becomes chaos. I'm an agent of chaos...”. When I was thinking Joker in the context of Batman, I could not keep Ledger's joker too far away. I was searching for a path for Arthur to go from the mentally unstable to the calculating anarchist. I was left searching for that path when the movie ended. To remain as the crown prince of crime, and to justify the title of the greatest adversary of Batman, just mental instability isn't good enough. He needs to be much more intelligent, much more cunning. These traits are often visible early, In the case of Arthur, I could not find that complete foundation upon which the later psyche can stand. This reminded me of Cameron Monaghan's Jerome Valeska. The joker of my understanding is somewhere between the cruelty of Jerome and pitiable delusions of Arthur. Also, the iconic Batman moment was not needed in this. I kept feeling that Joker is trying to stand with the support of Batman's tale as a clutch. A safety net enforced by the producers.\r\n\r\nOn the other hand, if I consider this movie as a standalone tale, then it was a bit more satisfying. There are tearjerker movies where nothing good ever happens with the protagonist. A series of bad lucks, or difficulties keep blocking a normal life. He is most definitely poor, has a sub-optimal family background, has a medical affliction which is unique and provides a foundation of the pity I felt. This is not very far from Rani Mukharjee's Hichki if you only consider the medical condition. Rani's Naina had Tourette syndrome while Joaquin's Arthur suffers from pseudobulbar affect. The setting and genre make the two films vastly different. More often than not, I have noticed these disorders lift a lot of burden from the narrative. In the case of Joker, couple his disorder with usually being in the wrong place at the wrong time, you have a travesty of human life. Add to that, an unstable parent, amplify it with the volatile societal conditions, you have a perfect decoction of what Joker is made of. As a tale of its own, it works. The delivery is great thanks to the spectacular performance. It also helps to increase the awareness of mental health. But when you strip off all the Batman context, it remains a well-acted and averagely written tale. \r\n\r\nUnfortunately, this is a single film, and I felt it is torn between these two polarising treatments. It wants to find its ground, which it finds. But that ground is far from being sensational. It remains somewhat indecisive. It can not be well soaked in Batman lore like James Gordon's tale, Gotham is. I am considering Gotham because both Gotham and Joker do not feature Batman, but they both have Bruce. Gotham understands its lore and fully embraces it but Joker does not want to. At the same time, as a tale of the psychologically troubled protagonist, Joker tries to play safe with the aim to please audience en-mass. I kept thinking about American Psycho and The Machinist. (Coincidently, both star ex-Batman Christian Bale). Those two take you in the psyche of the protagonist. Those take you inside the burning Amazon and not stand at a safe distance. Joker does not aim to do so. \r\n\r\nI am not at all qualified to talk about the acting performances. Joaquin Phoenix is in every frame and the way he waltzes between emotions is terrifyingly amazing. The Tai Chi to calm himself down, the menacing stare when finally becomes the Joker, those are chilling. He lives the character to the best of his abilities. Regrettably, he does not have the same level of writing support which Heath Ledger had and so due to no fault of his own, Joaquin could not topple Heath Ledger's portrayal of the crown prince of crime.\r\n\r\nIf I consider Todd Philips's entire resume, this was a genre shift for him. He knew very well that the biggest trump card is Joaquin Phoenix, so he takes no risk. He keeps him in focus, almost always all the setting and cinematography works for him. The only exception being Robert De Niro. Robert is allowed to carry his scenes quite independently. I think Todd Philips relied on both these giants to carry their parts. Sadly, I had gone to a theatre which had a bad print or screen so I think I will have to watch it again sometimes to enjoy the cinematography.\r\n\r\nI realised, I kept writing a lot and this is already over a thousand words. If you are here and reading still, I must say thank you. To summarise, The Joker worked for me and I enjoyed it, but I would not consider it the best depication of the iconic villain from comic books. The best may yet come.",
                              ),
                              Review(
                                author: 'agent515',
                                comment: "Great movie!",
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
