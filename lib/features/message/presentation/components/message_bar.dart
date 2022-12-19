import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../utils/app_colors.dart';

class CustomMessageBar extends StatelessWidget {

  CustomMessageBar({
    super.key,
    this.replying = false,
    this.replyingTo = "",
    this.hint = "",
    this.actions = const [],
    this.replyWidgetColor,
    this.replyIconColor,
    this.replyCloseColor,
    this.messageBarColor,
    this.sendButtonColor,
    this.inputFieldColor,
    this.onTextChanged,
    this.onSend,
    this.onTapCloseReply,
  });
  
  final bool replying;
  final String replyingTo;
  final String hint;
  final List<Widget> actions;
  final TextEditingController _textController = TextEditingController();
  final Color? replyWidgetColor;
  final Color? replyIconColor;
  final Color? replyCloseColor;
  final Color? messageBarColor;
  final Color? sendButtonColor;
  final Color? inputFieldColor;
  final void Function(String)? onTextChanged;
  final void Function(String)? onSend;
  final void Function()? onTapCloseReply;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final defaultReplyWidgetColor =
        isDark ? AppColors.neutralDark : AppColors.neutralOffWhite;
    final defaultMessageBarColor =
        isDark ? AppColors.neutralActive : AppColors.neutralWhite;
    const defaultSendButtonColor = AppColors.primaryDefault;
    const defaultReplyIconColor = AppColors.primaryDefault;
    final defaultInputFieldColor =
        isDark ? AppColors.neutralDark : AppColors.neutralOffWhite;

    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            replying
                ? Container(
                    color: replyWidgetColor ?? defaultReplyWidgetColor,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.reply,
                          color: replyIconColor ?? defaultReplyIconColor,
                          size: 24,
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Text(
                              'Re : $replyingTo',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: onTapCloseReply,
                          child: Icon(
                            Icons.close,
                            color: replyCloseColor,
                            size: 24,
                          ),
                        ),
                      ],
                    ))
                : Container(),
            replying
                ? Container(
                    height: 1,
                    color: Colors.grey.shade300,
                  )
                : Container(),
            Container(
              color: messageBarColor ?? defaultMessageBarColor,
              height: 56.0,
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: Row(
                children: <Widget>[
                  ...actions,
                  Expanded(
                    child: SizedBox(
                      child: TextField(
                        controller: _textController,
                        keyboardType: TextInputType.multiline,
                        textCapitalization: TextCapitalization.sentences,
                        minLines: 1,
                        maxLines: 3,
                        onChanged: onTextChanged,
                        decoration: InputDecoration(
                          hintText: hint,
                          hintMaxLines: 1,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 6),
                          hintStyle: const TextStyle(fontSize: 16),
                          fillColor: inputFieldColor ?? defaultInputFieldColor,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: BorderSide(
                              color: inputFieldColor ?? defaultInputFieldColor,
                              width: 0.2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: const BorderSide(
                              color: Colors.black26,
                              width: 0.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: InkWell(
                      child: Icon(
                        PhosphorIcons.paperPlaneTiltFill,
                        color: sendButtonColor ?? defaultSendButtonColor,
                        size: 24,
                      ),
                      onTap: () {
                        if (_textController.text.trim() != '') {
                          if (onSend != null) {
                            onSend!(_textController.text.trim());
                          }
                          _textController.text = '';
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
