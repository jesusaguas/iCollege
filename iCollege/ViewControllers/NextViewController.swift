
import UIKit
import CoreData


var draw = true
class NextViewController: UIViewController {
    

    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var Task: UITextView!
    
    @IBAction func Done(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    var task: String!
    
    override func viewDidLoad() {
        getData()
        Task.text = task
        super.viewDidLoad()
        
        DateLabel.text = dateString
        
    }
    
    @IBAction func SubmitText(_ sender: Any) {
        Task.text = (Task.text + "- " + textField.text! + "\n")
        textField.text = nil
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context)
        let newEntity = NSManagedObject(entity: entity!, insertInto: context)
        newEntity.setValue(Task.text, forKey: "task")
        print("paso")
        newEntity.setValue(dateString, forKey: "date")
    }
    
    func getData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        request.returnsObjectsAsFaults = false
        do{
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]{
                if data.value(forKey: "date")as! String == dateString{
                task = data.value(forKey: "task") as? String

                }
                          
            }
        }catch{
            print("Error")
        }
    }
    
}
