import 'package:ctrans/presentation/widgets/backspace_key.dart';
import 'package:ctrans/presentation/widgets/number_key.dart';
import 'package:flutter/material.dart';

class CurrencyKeyboard extends StatelessWidget {
  CurrencyKeyboard({Key? key, this.onTextInput, this.onBackspace})
      : super(key: key);

  final ValueSetter<String>? onTextInput;
  final VoidCallback? onBackspace;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        color: Colors.grey,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: _buildNum(),
            ),
            _buildBackspace(),
          ],
        ),
      ),
    );
  }

  Widget _buildNum() {
    return Column(
      children: [
        _buildRowOne(),
        _buildRowTwo(),
        _buildRowThree(),
        _buildRowFour(),
      ],
    );
  }

  Widget _buildRowOne() {
    return Row(
      children: [
        NumberKey(
          text: '1',
          onTextInput: onTextInput,
        ),
        NumberKey(
          text: '2',
          onTextInput: onTextInput,
        ),
        NumberKey(
          text: '3',
          onTextInput: onTextInput,
        ),
      ],
    );
  }

  Widget _buildRowTwo() {
    return Row(
      children: [
        NumberKey(
          text: '4',
          onTextInput: onTextInput,
        ),
        NumberKey(
          text: '5',
          onTextInput: onTextInput,
        ),
        NumberKey(
          text: '6',
          onTextInput: onTextInput,
        ),
      ],
    );
  }

  Widget _buildRowThree() {
    return Row(
      children: [
        NumberKey(
          text: '7',
          onTextInput: onTextInput,
        ),
        NumberKey(
          text: '8',
          onTextInput: onTextInput,
        ),
        NumberKey(
          text: '9',
          onTextInput: onTextInput,
        ),
      ],
    );
  }

  Widget _buildRowFour() {
    return Row(
      children: [
        NumberKey(text: ''),
        NumberKey(
          text: '0',
          onTextInput: onTextInput,
        ),
        NumberKey(
          text: '000',
          onTextInput: onTextInput,
        ),
      ],
    );
  }

  Widget _buildBackspace() {
    return BackspaceKey(
      onBackspace: onBackspace,
    );
  }
}
