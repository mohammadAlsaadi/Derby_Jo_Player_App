class Review {
  String? comment;
  Review({
    this.comment,
  });
  Map<String, dynamic> toMap() {
    return {
      'comment': comment,
    };
  }
}
