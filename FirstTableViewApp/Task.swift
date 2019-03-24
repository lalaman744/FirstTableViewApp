import Foundation

class Task: NSObject {
    var taskDescription: String
    var dateCreated: Date
    
    init(description: String, dateCreated: Date = Date()) {
        self.taskDescription = description
        self.dateCreated = dateCreated
    }
}
