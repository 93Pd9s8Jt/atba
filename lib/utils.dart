String readableTime(int seconds) {
  if (seconds <= 0) return "∞";
  final int days = seconds ~/ 86400;
  final int hours = seconds ~/ 3600;
  final int minutes = (seconds % 3600) ~/ 60;
  final int secs = seconds % 60;
  if (seconds == 8640000) {
    return "∞"; // 100 days
  } else if (days > 0) {
    return '${days}d ${hours % 24}h';
  }
  else if (hours > 0) {
    return '${hours}h ${minutes}m';
  } else if (minutes > 0) {
    return '${minutes}m ${secs}s';
  } else {
    return '${secs}s';
  }
}