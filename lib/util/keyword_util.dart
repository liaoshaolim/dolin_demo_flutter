/*
 * @Author: shaolin 
 * @Date: 2020-07-02 17:16:26 
 * @Last Modified by: shaolin
 * @Last Modified time: 2020-07-02 17:16:56
 */
import 'package:flutter/material.dart';

/// 关键字工具
class KeywordUtil {
  static List<TextSpan> keywordTextSpans(String word, String keyword,
      TextStyle normalStyle, TextStyle keywordStyle) {
    final spans = [];
    if (word == null || word.isEmpty) {
      return spans;
    }
    // 搜索关键字高亮忽略大小写
    String wordL = word.toLowerCase();
    String keywordL = keyword.toLowerCase();
    List<String> arr = wordL.split(keywordL);
    int preIndex = 0;
    for (var i = 0; i < arr.length; i++) {
      if (i != 0) {
        // 搜索关键字高亮忽略大小写
        preIndex = wordL.indexOf(keywordL, preIndex);
        spans.add(TextSpan(
            text: word.substring(preIndex, preIndex + keyword.length),
            style: keywordStyle));
      }
      final val = arr[i];
      if (val != null && val.isNotEmpty) {
        spans.add(TextSpan(text: val, style: normalStyle));
      }
    }
    return spans;
  }
}
