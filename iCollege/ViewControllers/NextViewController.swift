
import UIKit

class NextViewController: UIViewController {
    

    
    
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    

    @IBOutlet weak var Notes: UILabel!
    
    
    
    var result: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        DateLabel.text = dateString
        
    }
    

    @IBAction func SubmitText(_ sender: Any) {
        writeText()
    }
    
    func writeText(){
        result = textField.text
        Notes.text = result
        dismiss(animated: true, completion: nil)
    }
}
