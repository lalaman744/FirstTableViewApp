import UIKit

class TaskTableViewController: UITableViewController {
    
    var taskModel: TaskList!
    
    @IBAction func addNewTask(_ sender: Any) {
        let inputAlert = UIAlertController(title: "Enter Task", message: "Describe what you need to do", preferredStyle: .alert)
        inputAlert.addTextField(configurationHandler: nil)
        inputAlert.addAction(UIAlertAction(title: "Add", style: .default, handler: {(action: UIAlertAction) in
            if let description = inputAlert.textFields?[0].text {
                let task = Task(description: description)
                let index = self.taskModel.add(task)
                let indexPath = IndexPath(row: index, section: 0)
                self.tableView.insertRows(at: [indexPath], with: .automatic)
            }
            
        }
        ))
        inputAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(inputAlert, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskModel.count()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = taskModel.getTask(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = task?.description
        let dateString = Formatting.dateFormatter.string(from: (task?.dateCreated)!)
        cell.detailTextLabel?.text = "created at \(dateString)"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let detailView = segue.destination as! DetailViewController
            let rowsSelected = tableView.indexPathsForSelectedRows
            let firstRowSelected = rowsSelected?[0]
            let task = taskModel.getTask(at: (firstRowSelected?.row)!)
            detailView.task = task
        }
    }
}
