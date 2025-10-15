import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:insulin95/core/assets/colors.dart';
import 'package:insulin95/core/assets/fonts.dart';
import 'package:insulin95/core/utlites/size_widgets.dart';
import 'package:insulin95/data/services/chat/chat_service.dart';
import 'package:insulin95/features/ChatBoot/widgets/loading_indicator.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({super.key});

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody>
    with SingleTickerProviderStateMixin {
  final ChatUser _currentUser = ChatUser(id: '1', firstName: '', lastName: '');

  final ChatUser _geminiUser = ChatUser(
    id: '2',
    firstName: 'Insu',
    lastName: 'Assistant',
  );

  final GeminiService _geminiService = GeminiService();

  final List<ChatMessage> _messages = [];

  bool _isTyping = false;

  late AnimationController _dotsController;

  /// quick replies options
  final List<Map<String, String>> _quickReplies = [
    {"title": "Check BMI", "value": "I want to check my BMI"},
    {"title": "Diet Plan", "value": "Give me a diet plan"},
    {"title": "Medicine Info", "value": "Tell me about insulin"},
  ];

  @override
  void initState() {
    super.initState();

    /// رسالة ترحيب من البوت
    _messages.add(
      ChatMessage(
        text: "Hello, How can I help you?",
        user: _geminiUser,
        createdAt: DateTime.now(),
      ),
    );

    _dotsController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

  }

  @override
  void dispose() {
    _dotsController.dispose();
    super.dispose();
  }

  Future<void> getChatResponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
      _isTyping = true;
    });

    try {
      final userQuestion = (m.text).toLowerCase();
      String? reply;

      for (var entry in faqDatabase.entries) {
        if (userQuestion.contains(entry.key)) {
          reply = entry.value;
          break;
        }
      }

      if (reply != null) {
        final botMessage = ChatMessage(
          text: reply,
          user: _geminiUser,
          createdAt: DateTime.now(),
        );

        setState(() {
          _messages.insert(0, botMessage);
          _isTyping = false;
        });
        return;
      }

      final aiReply = await _geminiService.getChatResponse(m.text);

      final botMessage = ChatMessage(
        text: aiReply,
        user: _geminiUser,
        createdAt: DateTime.now(),
      );

      setState(() {
        _messages.insert(0, botMessage);
        _isTyping = false;
      });
    } catch (e) {
      final errorMessage = ChatMessage(
        text: "Error: ${e.toString()}",
        user: _geminiUser,
        createdAt: DateTime.now(),
      );

      setState(() {
        _messages.insert(0, errorMessage);
        _isTyping = false;
      });
    }
  }

  final Map<String, String> faqDatabase = {
    //=================================
    "what is the app":
        "This app is a companion (Tracker) for people with diabetes. You can:\n"
        "- Calculate your BMI\n"
        "- Track your physical activities\n"
        "- Get healthy food recipes\n"
        "- Connect with doctors\n"
        "- Set reminders for medications\n"
        "…and much more to help manage daily life with diabetes 🌟",
    //=================================
    "tell me about this app":
        "This app is a companion (Tracker) for people with diabetes. You can:\n"
        "- Calculate your BMI\n"
        "- Track your physical activities\n"
        "- Get healthy food recipes\n"
        "- Connect with doctors\n"
        "- Set reminders for medications\n"
        "…and much more to help manage daily life with diabetes 🌟",
    //====================================
    "whay is insuline95":
        "This app is a companion (Tracker) for people with diabetes. You can:\n"
        "- Calculate your BMI\n"
        "- Track your physical activities\n"
        "- Get healthy food recipes\n"
        "- Connect with doctors\n"
        "- Set reminders for medications\n"
        "…and much more to help manage daily life with diabetes 🌟",

    //=====================================
    "what does the app do":
        "The app is a diabetes tracker. It helps you calculate BMI, manage medicines, access recipes, connect with doctors, and track your health.",
    //======================================
    "function of the app":
        "This app works as a health companion for diabetics, helping with BMI calculation, diet, exercise, medicine schedules, and medical communication.",

    //======================================
    "tell me about you":
        "I'm Insu Assitance ,Ican help you to answer any quistions about Diabetes.",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text("AI Assistant", style: InsulinBoldFonts.largeBoldFont),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz_outlined, size: 30),
          ),
          HorizentalSpace(1).of(context),
        ],
      ),
    
      body: Column(
        children: [
          /// Quick Replies Section
          if (_quickReplies.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: 8,
                children: _quickReplies.map((reply) {
                  return ActionChip(
                    label: Text(reply["title"]!),
                    onPressed: () {
                      final m = ChatMessage(
                        text: reply["value"] ?? "",
                        user: _currentUser,
                        createdAt: DateTime.now(),
                      );
                      getChatResponse(m);
                    },
                  );
                }).toList(),
              ),
            ),

          Expanded(
            child: DashChat(
              messageOptions: MessageOptions(
                showCurrentUserAvatar: false,
                currentUserContainerColor: KprimaryC,
                containerColor: KfourC,
                messageTextBuilder:
                    (
                      ChatMessage message,
                      ChatMessage? previous,
                      ChatMessage? next,
                    ) {
                      final bool isMe = message.user.id == _currentUser.id;
                      return Text(
                        message.text,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: isMe ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
              ),
              currentUser: _currentUser,
              messages: _messages,
              onSend: (ChatMessage m) {
                getChatResponse(m);
              },
            ),
          ),
          
          if (_isTyping) LodingIndicator(dotsController: _dotsController),
        ],
      ),
    );
  }
}
