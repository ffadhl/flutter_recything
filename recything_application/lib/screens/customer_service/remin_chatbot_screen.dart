import 'package:flutter/material.dart';
import 'package:recything_application/constants/color_constant.dart';
import 'package:recything_application/screens/customer_service/widgets/chatbot/chatbot_conversation_widget.dart';
import 'package:recything_application/screens/customer_service/widgets/chatbot/chatbot_welcome_card_widget.dart';
import 'package:recything_application/widgets/global_app_bar.dart';

class ReMinChatbotScreen extends StatefulWidget {
  const ReMinChatbotScreen({super.key});

  @override
  State<ReMinChatbotScreen> createState() => _ReMinChatbotScreenState();
}

class _ReMinChatbotScreenState extends State<ReMinChatbotScreen> {
  bool isChatbotVisible = false;

  void _showChatbot() {
    setState(() {
      isChatbotVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: const GlobalAppBar(
        title: Text('ReMin Chatbot'),
        backgroundColor: ColorConstant.whiteColor,
      ),
      body: Center(
        child: isChatbotVisible
            ? const ChatbotConversationWidget()
            : ChatbotWelcomeCard(onStartChat: _showChatbot),
      ),
    );
  }
}
