import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jupi/constant/true_node_constant.dart';
import 'package:jupi/enum/horoscope_enum.dart';
import 'package:jupi/model/horoscope.dart';
import 'package:jupi/model/true_node.dart';
import 'package:jupi/model/true_node_desc.dart';
import 'package:jupi/model/user.dart';
import 'package:provider/provider.dart';

class DashPage extends StatefulWidget {
  DashPage(this.user);

  User user;

  @override
  _DashPageState createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
  CarouselController buttonCarouselController = CarouselController();

  late HoroscopeEnum trueNodeHoroscope;
  bool isLoading = true;
  late TrueNodeDesc trueNodeDesc;

  @override
  void initState() {
    super.initState();
    trueNodeHoroscope = findTrueNode();
    trueNodeDesc = fetchDetails();
    setState(() {
      isLoading = false;
    });
  }

  TrueNodeDesc fetchDetails() {
    return TrueNodeDesc(
        HoroscopeEnum.Taurus,
        "Ay Düğümü Ay'ın iki yörünge düğümünden, yani Ay'ın yörüngesinin ekliptikle kesiştiği iki noktadır. Yükselen düğüm Ay'ın kuzey ekliptik yarımküreye girdiği yerdir, inen düğüm ise Ay'ın güney ekliptik yarıküreye girdiği yerdir. Doğum tarihinize göre Kuzey Ay Düğümünüz Oğlak'tır. Kuzey Ay Düğümü ruhumuzun pusulasıdır ve kişinin ay düğümü hangi eksendeyse bu hayatta hep oradan sınanır.",
        "Duygusal ve ruhsal olarak bağlılık kurma ihtiyacı hissedersiniz. Bu bağlılık başkalarına almak için vermek gibi bir ilişkiyi getirir. Kendinizden verirsiniz çünkü karşılığını almak istersiniz, karşınızdakinden bir şey alamama korkunuzdan dolayı bunu sonlandırmaktan çekinirsiniz. Geniş bir duygusal hassasiyet ve tecrübeye sahip olmanız size birlikte olduğunuz kişilere duygusal olarak bakım ve destek verme kabiliyeti, güçlü bir aile kurma kapasitesi verir. Sevdiğiniz kişilere aşırı korumacı tutumunuz ve içten içe sizin onlara bağımlı olmanız sizin gelişiminizdeki en büyük engeldir. ",
        "Yengeç ve Oğlak Ay düğümü ekseni sorumluluklarla ilgilidir. Buradaki amaç ruhun çocukluktan çıkıp olgunluğa erişmesidir. Yaşamda sorumluluk almayı ve disiplin kurabilmeyi öğrenmeniz gerekmektedir. Siz kendi hayatınızın sorumluluğunu almalı, kendi ihtiyaçlarınızı karşılamalı, kendi ayaklarınızın üstünde durmalısınız ve sizi geri çeken bağlardan kurtulmalısınız. Başkalarının enerjilerine bağlı kalmamalısınız, size ihtiyaçları olan insanlara hemen kucak açmamalı onlar talep ettiğinde yardımcı olmalısınız. Kuzey Ay Düğümü Oğlak olan kadınların baba figürünü aşırı derecede arayışı, erkeklerin ise baba figürünü üstlenmek isteyişi gözlemlenir.",
        "Almanız gereken ders aşırı duygusallığı kontrol ederek öz disiplin ile dış dünyada otoriter konuma gelmektir. Kariyerinizde başarıya ulaşmak istersiniz. Önceliğiniz kendi içinizdeki çocuğun duygusallığı, bakıma muhtaçlığı ve dikkate alınma ihtiyacını çözümlemek olmalıdır. İçsel temizliğinizi yaptıktan sonra asıl hedefiniz olan Oğlak'a giderek içinizdeki çocuğun bakım ve sorumluluğunu almalısınız. Sonrasında asıl isteğiniz olan kişisel yaşamdan daha büyük bir idealin peşinde koşabilirsiniz. ");
  }

  HoroscopeEnum findTrueNode() {
    for (TrueNode t in TrueNodeConstant.TRUE_NODES) {
      if (t.start.isBefore(widget.user.dob) && t.end.isAfter(widget.user.dob)) {
        return t.sign;
      }
    }
    throw new Exception("not found True node Horoscope");
  }

  Widget progressIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Erkan"),
      ),
      body: isLoading
          ? progressIndicator()
          : ListView(shrinkWrap: true, children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Info",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        trueNodeDesc.info,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Text(
                      "Love",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(trueNodeDesc.love, style: TextStyle(fontSize: 17),),
                    ),
                    Text(
                      "Overall",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(trueNodeDesc.overall, style: TextStyle(fontSize: 17),),
                    ),
                    Text(
                      "Work",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(trueNodeDesc.work, style: TextStyle(fontSize: 17),),
                    )
                    /*CarouselSlider(
          carouselController: buttonCarouselController,
          options: CarouselOptions(height: 200.0),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Column(children: [
                      Text(
                        Provider.of<User>(context).name,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        Provider.of<User>(context).dob.toIso8601String(),
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        Provider.of<User>(context).horoscope.toString(),
                        style: TextStyle(fontSize: 16.0),
                      )
                    ],));
              },
            );
          }).toList(),
            )*/
                  ],
                ),
              ),
            ]),
    );
  }
}
