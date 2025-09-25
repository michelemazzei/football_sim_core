abstract class Message {}

extension MessageShortString on Message {
  String toShortString() {
    final parts = toString().split('(');
    return parts.isNotEmpty ? parts.first : toString();
  }
}
