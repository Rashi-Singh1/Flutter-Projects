class Ques {
  String question;
  bool answer;

  Ques(String question, bool answer) {
    this.question = question;
    this.answer = answer;
  }

  String getQuestion() {
    return this.question;
  }

  bool getAnswer() {
    return this.answer;
  }

  void setQuestion(String question) {
    this.question = question;
  }

  void setAnswer(bool answer) {
    this.answer = answer;
  }
}
