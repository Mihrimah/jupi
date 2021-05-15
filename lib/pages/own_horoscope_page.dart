import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jupi/model/user.dart';
import 'package:provider/provider.dart';

class OwnHoroscopePage extends StatefulWidget {
  @override
  _OwnHoroscopePageState createState() => _OwnHoroscopePageState();
}

class _OwnHoroscopePageState extends State<OwnHoroscopePage> {
  CarouselController buttonCarouselController = CarouselController();

  writeInfo(String val) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(children: [Text(val, style: TextStyle(fontSize: 20),)]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Erkan"),
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  child: Text("Yesterday"),
                ),
                Tab(
                  child: Text("Today"),
                ),
                Tab(
                  child: Text("Tomorrow"),
                ),
                Tab(
                  child: Text("Week"),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  writeInfo("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                  writeInfo("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."),
                  writeInfo("On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains."),
                  writeInfo("In pellentesque odio ut lectus ullamcorper laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sed sapien at lectus tempus tempor in id metus. Vestibulum sit amet massa ex. Nullam egestas quis tellus non porttitor. Curabitur condimentum urna quam, id commodo sem accumsan euismod. Cras laoreet convallis metus, eu varius purus porta vel. Etiam at venenatis ante. Nunc vitae metus ultricies, feugiat orci sed, faucibus nulla. Pellentesque condimentum eget risus nec pulvinar. Curabitur placerat accumsan dolor et sagittis. Sed ac massa eu odio ullamcorper porta a ac velit. In fringilla enim neque. In imperdiet efficitur neque, id volutpat justo blandit sit amet. Nam bibendum dui sed tellus pharetra, vel condimentum nulla feugiat.Etiam viverra sit amet ipsum sed posuere. Mauris eu fringilla odio, vel egestas mi. Curabitur velit nisi, porta sit amet eleifend et, iaculis in libero. In a nisi bibendum, condimentum enim eget, facilisis felis. Quisque tristique ultricies consectetur. Quisque at leo fermentum, auctor dui ut, rhoncus libero. Phasellus in arcu eros. Quisque eleifend posuere dolor quis posuere. Mauris turpis mauris, rhoncus et malesuada ut, vestibulum eu felis. Integer scelerisque ex eu magna varius, quis ultrices erat bibendum. Nam ipsum ante, congue vel orci nec, ullamcorper vestibulum ante. Nulla facilisi. Duis et finibus arcu, ac fermentum dolor. Nullam a urna a magna finibus gravida nec in libero. Vestibulum at sapien lacus."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
