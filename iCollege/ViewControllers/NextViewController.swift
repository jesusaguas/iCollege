
import UIKit
import CoreData

class NextViewController: UIViewController {
    

    
    
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    

    @IBOutlet weak var Notes: UILabel!
    
    
    
    var task: String!
    
    override func viewDidLoad() {
        getData()
        textField.text = task
        super.viewDidLoad()
        
        DateLabel.text = dateString
        
    }
    

    @IBAction func SubmitText(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context)
        let newEntity = NSManagedObject(entity: entity!, insertInto: context)
        newEntity.setValue(textField.text, forKey: "task")
        newEntity.setValue(dateString, forKey: "date")
        dismiss(animated: true, completion: nil)
            
    }
    
    func getData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        request.returnsObjectsAsFaults = false
        do{
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]{
                if data.value(forKey: "date")as! String == dateString{
                    task = data.value(forKey: "task") as! String
                }
                
            }
        }catch{
            print("Error")
        }
    }
}
