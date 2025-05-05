import 'package:flutter/material.dart';

// A custom chat bubble that adapts based on whether it's the first message in a sequence
class MessageBubble extends StatelessWidget {
  // For the first message from a user
  const MessageBubble.first({
    super.key,
    required this.userImage,
    required this.username,
    required this.message,
    required this.isMe,
  }) : isFirstInSequence = true;

  // For subsequent messages from the same user
  const MessageBubble.next({
    super.key,
    required this.message,
    required this.isMe,
  }) : isFirstInSequence = false,
       userImage = null,
       username = null;

  final bool isFirstInSequence;
  final String? userImage;
  final String? username;
  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        if (userImage != null)
          Positioned(
            top: 15,
            // Position user avatar on left for others, right for the current user
            right: isMe ? 0 : null,
            left: isMe ? null : 0,
            child: CircleAvatar(
              backgroundImage: NetworkImage(userImage!),
              backgroundColor: theme.colorScheme.primary.withAlpha(180),
              radius: 23,
            ),
          ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 46,
            vertical: isFirstInSequence ? 16 : 4,
          ),
          child: Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  // Show username only for the first message in a sequence
                  if (isFirstInSequence && username != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 13, right: 13),
                      child: Text(
                        username!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  // The actual message bubble
                  Container(
                    decoration: BoxDecoration(
                      color:
                          isMe
                              ? theme.colorScheme.primary.withAlpha(200)
                              : theme.colorScheme.secondary.withAlpha(200),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          isMe
                              ? 12
                              : isFirstInSequence
                              ? 0
                              : 12,
                        ),
                        topRight: Radius.circular(
                          isMe ? (isFirstInSequence ? 0 : 12) : 12,
                        ),
                        bottomLeft: const Radius.circular(12),
                        bottomRight: const Radius.circular(12),
                      ),
                    ),
                    constraints: const BoxConstraints(maxWidth: 200),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 14,
                    ),
                    margin: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
                    ),
                    child: Text(
                      message,
                      style: TextStyle(
                        height: 1.3,
                        color:
                            isMe
                                ? theme.colorScheme.onPrimary
                                : theme.colorScheme.onSecondary,
                      ),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
