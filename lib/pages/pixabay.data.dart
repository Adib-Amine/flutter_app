import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GalleryDataPage extends StatefulWidget {
  String keyWord = "";
  GalleryDataPage(this.keyWord);
  @override
  _GalleryDataPageState createState() => _GalleryDataPageState();
}

class _GalleryDataPageState extends State<GalleryDataPage> {
  List<dynamic> data;
  int currentPage = 1;
  int pageSize = 10;
  int totalPages = 0;
  ScrollController _scrollController = new ScrollController();
  var dataGallery;
  List<dynamic> hits = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.keyWord}, page ${currentPage}/${totalPages}"),
          backgroundColor: Colors.red,
        ),
        body: (dataGallery == null
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: (dataGallery == null ? 0 : hits.length),
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                hits[index]['tags'],
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        child: Card(
                          child: Image.network(
                            hits[index]['webformatURL'],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        padding: EdgeInsets.only(left: 10, right: 10),
                      )
                    ],
                  );
                })));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  getData(url) {
    http.get(url).then((resp) {
      setState(() {
        dataGallery = json.decode(resp.body);
        hits.addAll(dataGallery['hits']);
        if (dataGallery['totalHits'] % this.pageSize == 0)
          this.totalPages = dataGallery['totalHits'] ~/ this.pageSize;
        else
          this.totalPages =
              1 + (dataGallery['totalHits'] / this.pageSize).floor();
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.loadData();
    this._scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage < totalPages) {
          ++currentPage;
          this.loadData();
        }
      }
    });
  }

  loadData() {
    String url =
        'https://pixabay.com/api/?key=5832566-81dc7429a63c86e3b707d0429&q=${widget.keyWord}&page=${currentPage}&per_page=${pageSize}';
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        dataGallery = json.decode(resp.body);
        hits.addAll(dataGallery['hits']);
        if (dataGallery['totalHits'] % pageSize == 0)
          totalPages = dataGallery['totalHits'] ~/ pageSize;
        else
          totalPages = 1 + (dataGallery['totalHits'] / pageSize).floor();
        print(hits);
      });
    }).catchError((err) {
      print(err);
    });
  }
}
