import Option "mo:base/Option";
import Debug "mo:base/Debug";


//Task Management System
//Add task
//Mark Task as complete
//View Task


//Actor defines a class and also acts as a canister
actor TaskManagement{
  type Task = {
    title: Text;
    description: Text;
    isCompleted: Bool;
  };

  //Optional Type
  var currentTask: ?Task = null;

  //Function to add task
  //A private function is only accesible in the code
  //Public functions are made asynchronuous
  //Optional types can either accept null or a value
  //For re-assignment we use " := "
  //For re-assignment for optional types, we bring a question mark

  public func addTask(title: Text, description: Text) : async Text {
    if (currentTask == null or Option.unwrap(currentTask).isCompleted){
      currentTask := ?(title = title; description = description; isCompleted = false);
      return "Task added successfully";

    };
    return "You already have a task! Complete it before adding a new one";
  };

  //Function to mark the task as completed
  public func completeTask(): async Text {
    if (currentTask != null){

      let task = Option.unwrap(currentTask);
      //unwrap the option
      if (task.isCompleted) {
        return "Task is already marked!";
      };
      else{
        //tranform the currentTask value directly 
        currentTask := ?{
          title = task.title;
          description = task.description;
          isCompleted = true;
        };
      return "Task is marked as Complete";
      };
    };


  };
  return "No task found";


  //Function tp view the current task

  public func viewTask() : async Text {
    if (current != null) {

      let task = Option.unwrap(currentTask);  //Unwrap the optional
      let status = if (task.isCompleted) {"completed"} else {
        "Pending";
      };
      return " Task : " # "\n Description:" # task.description # "\n Status:" # status;

    };
    else{
    return "No task to view";
    };

    
  };

};