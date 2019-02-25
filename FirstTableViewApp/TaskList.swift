class TaskList {
    
    var tasks = [Task]()
    //class = ItemStore
    // var allItems = [Item]()
    
    
    func add(_ task: Task) -> Int {
        tasks.append(task)
        return tasks.endIndex - 1
    }
    
    func getTask(at index: Int) -> Task? {
        if tasks.indices.contains(index) {
            return tasks[index]
        }
        return nil
    }
    
    func removeTask(_ task: Task) {
        if let index = tasks.index(of: task) {
            tasks.remove(at: index)
        }
    }
        
    
    func count() -> Int {
        return tasks.count
    }
}
