// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "download": MessageLookupByLibrary.simpleMessage("Download"),
        "hint_textfield_download":
            MessageLookupByLibrary.simpleMessage("Paste link to downloads"),
        "intro_ended": MessageLookupByLibrary.simpleMessage(
            "Watch your downloaded videos anytime, anywhere, without the need for internet"),
        "intro_second": MessageLookupByLibrary.simpleMessage(
            "Enjoy quick downloads while keeping your data safe and secure"),
        "intro_started": MessageLookupByLibrary.simpleMessage(
            "Save your favorite videos from popular social media platforms with just a few taps"),
        "setting": MessageLookupByLibrary.simpleMessage("setting"),
        "title_intro_ended":
            MessageLookupByLibrary.simpleMessage("Offline Access"),
        "title_intro_second":
            MessageLookupByLibrary.simpleMessage("Fast & Secure"),
        "title_intro_started":
            MessageLookupByLibrary.simpleMessage("Easily Download Videos"),
        "upgrade_premium":
            MessageLookupByLibrary.simpleMessage("Upgrade to Premium")
      };
}
