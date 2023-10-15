import 'package:flutter/material.dart';
import 'package:my_app/models/cep_data_model.dart';
import 'package:my_app/repositories/cep_data_repository.dart';

class CEPGetPage extends StatefulWidget {
  const CEPGetPage({super.key});

  @override
  State<CEPGetPage> createState() => _CEPGetPageState();
}

class _CEPGetPageState extends State<CEPGetPage> {
  TextEditingController cepController = TextEditingController();
  bool loading = false;
  CepDataModel cepDataModel = CepDataModel();
  CepDataRepo cepDataRepo = CepDataRepo();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Consulta CEP:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              textAlign: TextAlign.left,
            ),
            TextField(
              controller: cepController,
              maxLength: 8,
              decoration: const InputDecoration(hintText: 'Digite seu cep'),
              keyboardType: TextInputType.number,
              onChanged: (String value) async {
                var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                if (cep.length == 8) {
                  setState(() {
                    loading = true;
                  });
                  cepDataModel = await cepDataRepo.getCep(cep);
                }

                loading = false;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              cepDataModel.street ?? '',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              textAlign: TextAlign.left,
            ),
            Text(
              "${cepDataModel.city ?? ''} - ${cepDataModel.state ?? ''}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              textAlign: TextAlign.left,
            ),
            Visibility(
                visible: loading,
                child: const Center(child: CircularProgressIndicator()))
          ])),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // http.get('')
        },
      ),
    ));
  }
}
