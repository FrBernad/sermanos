import 'package:flutter/cupertino.dart';

import '../../../../config/design_system/cellules/cards/sermanos_volunteering_card.dart';

class PostulateList extends StatelessWidget {
  const PostulateList({Key? key}) : super(key: key);

  final info = const [
    {
      "overline": "Acción social",
      "subtitle": "Un techo para mi país",
      "imageUrl":
          'https://s3-alpha-sig.figma.com/img/6160/48a8/56fafc1f797d16aeaaa7f76477bdc239?Expires=1682294400&Signature=YANfeiuGuydv6nDtHVG2qlUxSWBdpHQ1KP4TdDWlxB8kDDuR6U~LPRGnEoO~xerlyn1mO4Mt8mhUrTL9O6vON8Jt6edFFMk~3xcu0AFQKp0sQ9TyptAdjybQgRW13RcXNMyPqojtzvD6bmH4SPnU31L9vEYdu~oKvl9XOQT0rm~YqkqiagJO0SliSNavpR3gx5~D8x384269bhfKvaznBwjmuReLRxs2QaGP1capML3IwGWNwcIr~t~gMyDicwI4cvu7M0GU2M~xhLJT8Uq6D-3pZYjI14E4LSAS-OWDYDIF5BlDwOpCLlmD-Oe7ELqTjk5qx7OmSTx8xmwiLxDutA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      "id": "1",
    },
    {
      "overline": "Acción social",
      "subtitle": "Manos caritativas",
      "imageUrl":
          'https://s3-alpha-sig.figma.com/img/8bbc/83c6/6d6e4bcbf3c909838293a3128e40c314?Expires=1682294400&Signature=ZpN~zAS-olq5lWyfbX~mtPtoOxHontOY6TpUHTvIG2mA6MKpC74O6LriyS2SJovaMmNaGAYB~HFphDTBaw1N9zvsQrCipzae1jb9VN8vfKT6LoKOu87pVlG~XMnryAZ7RTgjxgmOiBgwqm1Jsv9pE~4XV1hhGLXhBL0e64xiLys0MSmOe6ItigFW7jm4CVu06ofp9mpPc1VdmcfINftI1OcRNPV5eKZlsEmkCOOsK11cMRoz5yUNDe4BQceXr3gZJWwBtpgEuYqWLTrcxhz13NppNx35DRhbsBMOUsH2gz7xRtCTm4ctr3Bo6mPNpife-UFhSyMRuTIA5WXYDCARSw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      "id": "2",
    },
    {
      "overline": "Acción social",
      "subtitle": "Un techo para mi país",
      "imageUrl":
          'https://s3-alpha-sig.figma.com/img/2256/879e/e6275b116255523b7644b48c3a24a961?Expires=1682294400&Signature=B5YECcDdlXKzPQ3N6QChXv6YRJvHGqM2nyyrakz8s0AfpB6F6t1zUUqm2QfAERI4SVVQRYTYgodfjFxnEKPJDxMrP8ngnkjkJ5rGMZIruJpcaMkA5fylmDyuHFx9hE8zltDa0N0VKvUK-DUsrmAuBBivDglqi6-w9XwyAH48fhNwv-i01bG3g0orwEni3-BdxHFaqhFhGmetfLcWUY0IWFdxlyQg1DlhTw4lMozmmnFIY5Oev4Lu2iTRRHP-4rwR~eQqPKx0IRFYaGvurpJvYkGED58MUjQI0evSmg3DTi~N0P2OAsDezIFHNdphwRdpdoUvLR~NpTVwJaaoQglKZw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
      "id": "3",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: info.length,
      itemBuilder: (context, index) => SermanosVolunteeringCard(
          id: info[index]["id"]!,
          imageUrl: info[index]["imageUrl"]!,
          subtitle: info[index]["subtitle"]!,
          overline: info[index]["overline"]!),
      separatorBuilder: (context, index) => const SizedBox(height: 24),
    );
  }
}
