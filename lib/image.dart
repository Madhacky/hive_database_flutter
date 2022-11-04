import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ImageData extends StatefulWidget {
  const ImageData({super.key});

  @override
  State<ImageData> createState() => _ImageDataState();
}

class _ImageDataState extends State<ImageData> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FetchDataFARAPI();
  }

  var image;
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  FetchDataFARAPI() async {
    setState(() {});
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({
      "apiReqId": "6085DAB947664BEAB39921AC425BB71A",
      "apiReqCols": "",
      "apiReqWhereClause": "RECORD_NO = 'PA00013664'",
      "apiReqOrgnId": "C1F5CFB03F2E444DAE78ECCEAD80D27D",
      "apiReqUserId": " AJAY_IDAM_SURVEYOR ",
      "apiRetType": "JSON"
    });
    var response = await post(
      Uri.parse('https://imdrm.pilogcloud.com/V10/getApiRequestResultsData'),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      setState(() {});
      try {
        setState(() {
          image = jsonDecode(utf8.decode(response.bodyBytes));
          print(image);
        });
      } catch (e) {
        print(image);
        image = null;
      }
    } else {
      print(response.reasonPhrase);
    }
  }
}
