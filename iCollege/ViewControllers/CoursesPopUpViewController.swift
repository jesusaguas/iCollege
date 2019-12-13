import UIKit

var newCourse: String!

class CoursesPopUpViewController: UIViewController {

    
    @IBOutlet weak var NewCourseEntry: UITextField!

    
    
    @IBAction func ExitPopUp(_ sender: Any) {
        writeLabel()
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    func writeLabel(){
        newCourse = NewCourseEntry.text
    }
}
