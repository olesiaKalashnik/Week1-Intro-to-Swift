import UIKit

//Using Playgrounds…
//Declare Identity protocol with id function
//Declare a ToDo class that conforms to Identity protocol… Define your own model scheme (variable it contains, etc)
//Define ObjectStore protocol with these functions: add:, remove:, objectAtIndex:, count, allObjects.
//Extend ObjectStore protocol to provide basic implementation for functions
//    Create Store singleton that will conform to ObjectStore protocol and implement requirements
//Demonstrate adding / removing of ToDo items.


protocol Identity {
    var identity : String {get set}
}

extension NSDate {
    func formattedDescription() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.stringFromDate(self)
    }
}

protocol ObjectStoreProtocol : class {
    associatedtype Object : Identity
    var objects : [Object] {get set }
    func add(object: Object)
    func remove(object: Object)
    func objectAtIndex(index: Int) -> Object
    func count() -> Int
    func allObjects() -> [Object]
    func clear()
}

extension ObjectStoreProtocol {
    
    func add(object: Object) {
        return self.objects.append(object)
    }
    
    func remove(object: Object) {
        self.objects = self.objects.filter {$0.identity != object.identity}
    }
    
    func objectAtIndex(index: Int) -> Object {
        return self.objects[index]
    }
    
    func count() -> Int {
        return self.objects.count
    }
    
    func allObjects() -> [Object] {
        return self.objects
    }
    
    func clear() {
        self.objects.removeAll()
    }
}

enum CompletionStatus {
    case notStarted
    case inProgress
    case completed
}

class ToDo: Identity {
    var taskText : String
    var status : CompletionStatus
    var deadlineDate : NSDate?
    var identity : String
    
    init(task: String, status: CompletionStatus, deadline: NSDate? = nil) {
        self.taskText = task
        self.status = status
        self.deadlineDate = deadline
        self.identity = NSUUID().UUIDString
    }
    
    var description : String {
        guard let dueDate = self.deadlineDate else { return "\(self.taskText) is \(self.status). ID: \(self.identity)\n" }
        return "\(self.taskText) is \(self.status), due on \(dueDate.formattedDescription()). ID: \(self.identity)\n"
    }
}

class Store : ObjectStoreProtocol {
    static let shared = Store()
    private init() {}
    
    typealias Object = ToDo
    
    var objects = [Object]()
}

//TESTS
//Create tasks
let todo1 = ToDo(task: "Reading assignment", status: CompletionStatus.inProgress, deadline: NSDate())
let todo2 = ToDo(task: "Deutsch: Übungen 5-8", status: CompletionStatus.inProgress, deadline: NSDate())
let todo3 = ToDo(task: "Reading assignment", status: CompletionStatus.inProgress, deadline: NSDate())
let todo4 = ToDo(task: "Reading assignment", status: CompletionStatus.completed, deadline: NSDate())
let todo5 = ToDo(task: "Reading assignment", status: CompletionStatus.inProgress, deadline: NSDate())

//populate singletone
let todosArray = [todo1, todo2, todo3, todo4, todo5]
for todo in todosArray {
    Store.shared.add(todo)
}

//Print out all tasks in singletone with allObjects()
for todo in Store.shared.allObjects() {
    print(todo.description)
}

//Print out id of the task at index 0 with objectAtIndex(Int)
print("Id of todo at index 0: \(Store.shared.objectAtIndex(0).identity)\n")

// Remove a task from singletone
Store.shared.remove(Store.shared.objectAtIndex(2))
print("With todo3 removed\n")

for todo in Store.shared.allObjects() {
    print(todo.description)
}
// Test counting tasks
Store.shared.count() == 4
print("Number of todos: \(Store.shared.count())\n")

// Test clearing tasks
print("All tasks were removed\n")
Store.shared.clear()
Store.shared.allObjects().isEmpty == true
print("Tasks after clearing Store.shared: \(Store.shared.allObjects())")





