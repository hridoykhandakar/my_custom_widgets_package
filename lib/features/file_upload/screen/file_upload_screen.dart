import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileUploadScreen extends StatefulWidget {
  const FileUploadScreen({super.key});

  @override
  State<FileUploadScreen> createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  List<PlatformFile> files = [];
  Future picFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["pdf"],
    );
    if (result == null) {
      print("no file selected");
    } else {
      setState(() {
        files.addAll(result.files);
      });
      print(result.files.single.path.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                picFile();
              },
              icon: Icon(Icons.upload_file_outlined),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: files.length,
              itemBuilder: (context, index) {
                final item = files[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        files.removeAt(index);
                      });
                    },
                    icon: Icon(Icons.close),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
