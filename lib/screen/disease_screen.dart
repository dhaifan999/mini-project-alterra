import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tflite_image_classification/screen/disease_view_model.dart';

class DiseasePage extends StatefulWidget {
  const DiseasePage({Key? key}) : super(key: key);

  @override
  State<DiseasePage> createState() => _DiseasePageState();
}

class _DiseasePageState extends State<DiseasePage> {
  TextEditingController textController = TextEditingController();
  String searchText = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var viewModel = Provider.of<DiseaseViewModel>(context, listen: false);
      await viewModel.getAllDiseases();
    });
  }

  Widget listView(DiseaseViewModel viewModel) {
    final filteredDiseases = viewModel.diseases
        .where((disease) =>
            disease.name.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: searchText.isEmpty
          ? viewModel.diseases.length
          : filteredDiseases.length,
      itemBuilder: (context, index) {
        final disease = searchText.isEmpty
            ? viewModel.diseases[index]
            : filteredDiseases[index];
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                title: Text(
                  disease.name,
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF2465ac),
                  ),
                ),
                subtitle: Text(
                  disease.description,
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xFF2465ac),
                  ),
                ),
                child: const Text('See More'),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: 370,
                        color: Colors.white,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  disease.name,
                                  style: GoogleFonts.poppins(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w800,
                                    color: const Color(0xFF2465ac),
                                  ),
                                ),
                                subtitle: Text(
                                  disease.description,
                                  style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Cara Mengatasi',
                                  style: GoogleFonts.poppins(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w800,
                                    color: const Color(0xFF2465ac),
                                  ),
                                ),
                                subtitle: Text(
                                  disease.overcome,
                                  style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color(0xFF2465ac),
                                  ),
                                ),
                                child: const Text('Close'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget body(DiseaseViewModel viewModel) {
    final isLoading = viewModel.state == DiseaseViewState.loading;
    final isError = viewModel.state == DiseaseViewState.error;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (isError) {
      return const Center(child: Text('Failed to fetch data.'));
    }

    return listView(viewModel);
  }

  @override
  Widget build(BuildContext context) {
    DiseaseViewModel viewModel = Provider.of<DiseaseViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          AnimSearchBar(
            onSubmitted: (String value) {
              setState(() {
                searchText = value;
              });
            },
            width: 400,
            textController: textController,
            onSuffixTap: () {
              setState(() {
                textController.clear();
                searchText = '';
              });
            },
            rtl: true,
            color: Colors.white,
          ),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: body(viewModel),
    );
  }
}
