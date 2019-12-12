class Ques {
  String question;
  bool answer;

  Ques(this.question, this.answer);

//the above constructor can simply be written as below, the only diff is the way of invoking this
//  Ques({this.question, this.answer});

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
