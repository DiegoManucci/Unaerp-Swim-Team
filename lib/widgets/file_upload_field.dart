import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/utils/utils.dart';

class FileUploadField extends StatelessWidget {
  final String documentType;
  final String filePath;
  final Function(String)? onFileSelected;

  const FileUploadField({
    super.key,
    required this.documentType,
    required this.filePath,
    this.onFileSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upload $documentType:',
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(filePath.isEmpty ? 'Nenhum arquivo selecionado' : Utils.collapseString(filePath, 20)),
            ElevatedButton(
              onPressed: () async {
                FilePickerResult? result =
                await FilePicker.platform.pickFiles();

                if (result != null) {
                  onFileSelected?.call(result.files.single.path ?? '');
                }
              },
              child: const Text('Selecionar'),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}