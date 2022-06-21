class Question{

  String questiontxt = '';
  bool questionans = true;

  //=============constructor=============
  Question({required String q,required bool a}){
    questiontxt = q;
    questionans = a;
  }
}

// Question newQuestion = Question(q: (), a: a);