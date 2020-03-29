import 'package:flutter/material.dart';
import 'package:job_listing_app/global.dart';
import 'package:job_listing_app/Home/job.dart';
import 'package:job_listing_app/Home/community.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: background,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(26, 40, 26, 40),
                  constraints: BoxConstraints.expand(height: 225),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [lightBlue, lightGreen],
                          begin: FractionalOffset(1.0, 1.0),
                          end: FractionalOffset(0.2, 0.2),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Beranda', style: titleStyle),
                            Container(
                              constraints: BoxConstraints.tightFor(
                                  width: 30, height: 30),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(50, 255, 255, 255)),
                              child: InkWell(
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onTap: () => {},
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 36),
                        Text(
                          'Connect to People Like You',
                          style: subtitleStyleLight,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  //color: Color.fromARGB(50, 1, 1, 1),
                  margin: EdgeInsets.only(top: 150),
                  constraints: BoxConstraints.expand(height: 200),
                  child: ListView(
                      padding: EdgeInsets.only(left: 26),
                      scrollDirection: Axis.horizontal,
                      children: getRecentJobs()),
                ),
                Container(
                  //color: Color.fromARGB(50, 1, 1, 1),
                  constraints: BoxConstraints.expand(height: 400),
                  margin: EdgeInsets.only(top: 350),
                  //padding: EdgeInsets.fromLTRB(26, 10, 26, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.fromLTRB(26, 10, 26, 0),
                          child: Text('Explore Communities',
                              style: subtitleStyleDark)),
                      Container(
                        child: Expanded(
                          child: GridView(
                              padding: EdgeInsets.fromLTRB(26, 16, 26, 0),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.8,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              children: getCommunities()),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(

      // ),
    );
  }

  List<Community> findCommunities() {
    String avatarURL = 'https://i.pravatar.cc/150?img=';

    List<String> otherImageURLs = [];
    for (int i = 10; i < 50; i += 10) {
      otherImageURLs.add('$avatarURL$i');
    }

    List<Community> communities = [];
    for (int i = 1; i < 5; i++) {
      communities.add(
          Community('$avatarURL$i', 'Coping with Depression', otherImageURLs));
    }

    return communities;
  }

  List<Widget> getCommunities() {
    List<Widget> recentCommunities = [];
    List<Community> communities = findCommunities();
    for (Community community in communities) {
      recentCommunities.add(getCommunityCard(community));
    }
    return recentCommunities;
  }

  Widget getCommunityCard(Community community) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(color: Colors.grey[400], blurRadius: 10, spreadRadius: 1)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipOval(
            child: SizedBox(
              height: 50,
              width: 50,
              child: Image.network(community.mainImageURL),
            ),
          ),
          Text(
            community.jobTitle,
            style: jobCardTitleStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ClipOval(
                child: SizedBox(
                  height: 26,
                  width: 26,
                  child: Image.network(community.otherImageURLs[0]),
                ),
              ),
              ClipOval(
                child: SizedBox(
                  height: 26,
                  width: 26,
                  child: Image.network(community.otherImageURLs[1]),
                ),
              ),
              ClipOval(
                child: SizedBox(
                  height: 26,
                  width: 26,
                  child: Image.network(community.otherImageURLs[2]),
                ),
              ),
              ClipOval(
                child: SizedBox(
                  height: 26,
                  width: 26,
                  child: Image.network(community.otherImageURLs[3]),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  List<Job> findJobs() {
    List<Job> jobs = [];
    for (int i = 1; i < 6; i++) {
      jobs.add(Job('https://i.pravatar.cc/150?img=$i', 'Mitchell Barber',
          'New on Vision', 2));
    }
    return jobs;
  }

  List<Widget> getRecentJobs() {
    List<Widget> recentJobs = [];
    List<Job> jobs = findJobs();
    for (Job job in jobs) {
      recentJobs.add(getJobCard(job));
    }
    return recentJobs;
  }

  Widget getJobCard(Job job) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
      margin: EdgeInsets.only(right: 20, bottom: 20, top: 28),
      height: 150,
      width: 260,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey[400], blurRadius: 20.0)]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipOval(
                  child: SizedBox(
                width: 50,
                height: 50,
                child: Image.network(job.imageURL),
              )),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(job.jobTitle, style: jobCardTitleStyle),
                  SizedBox(height: 5),
                  Text(job.companyName, style: jobCardSubtitleStyle)
                ],
              )
            ],
          ),
          Text(
            'Been through ${job.stepLeave} steps you\'re following incoping with depression.',
            style: jobCardContentStyle,
          )
        ],
      ),
    );
  }
}
