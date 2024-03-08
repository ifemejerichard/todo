class Task{

  String todo;
  bool state;

  Task ({required this.todo, this.state = false});

  void CheckBoxToggle() {
    state = !state; // this will initialise state to the opposite of what it currently is
  }

}