// ignore_for_file: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:html' as html;

/// Removes the HTML loading indicator once Flutter has started (web only).
void hideLoading() {
  html.document.getElementById('loading')?.remove();
}
