import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tecno_image_view/home_page/bloc/bloc.dart';
import 'package:tecno_image_view/home_page/cubit/image_urls_cubit.dart';

class AddImagesBody extends StatefulWidget {
  const AddImagesBody({super.key});

  @override
  State<AddImagesBody> createState() => AddImagesBodyState();
}

class AddImagesBodyState extends State<AddImagesBody> {
  late final TextEditingController _textController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();

    _textController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  void _addUrlImage() {
    if (_formKey.currentState!.validate()) {
      context.read<ImageUrlsCubit>().addImagesUrl(_textController.text);

      _textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: KeyboardListener(
        focusNode: FocusNode(),
        onKeyEvent: (event) {
          if (event.logicalKey == LogicalKeyboardKey.enter) {
            _addUrlImage();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Column(
                children: [
                  TextFormField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Url da imagem',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, informe a url da imagem';
                      }

                      if (context
                          .read<ImageUrlsCubit>()
                          .state
                          .images
                          .contains(value)) {
                        return 'Url já adicionada';
                      }

                      if (!value.startsWith('http')) {
                        return 'Url precisa comecar com http ou https';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextButton.icon(
                    icon: const Icon(Icons.add),
                    onPressed: _addUrlImage,
                    label: const Text('Adicionar imagem'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
