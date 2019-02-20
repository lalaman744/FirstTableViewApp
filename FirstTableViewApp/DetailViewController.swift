import UIKit

class DetailViewController: UIViewController {
    
    var task: Task!
    
    @IBOutlet weak var taskDescription: UILabel!
    @IBOutlet weak var taskDateCreated: UILabel!
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //taskDescription.text = task.description
        //taskDateCreated.text = ("\(task.dateCreated)")
    }
    override func viewDidLoad() {
        let dateString = Formatting.dateFormatter.string(from: (task?.dateCreated)!)
        taskDescription.text = task.description
        taskDateCreated.text = ("\(dateString)")
    }
}
