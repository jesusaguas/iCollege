

import UIKit




class CoursesViewController: UIViewController {
    
    
    @IBAction func Add(_ sender: Any) {
    }
    @IBOutlet weak var Course1: UILabel!
    @IBOutlet weak var Course2: UILabel!
    @IBOutlet weak var Course3: UILabel!
    @IBOutlet weak var Course4: UILabel!
    @IBOutlet weak var Course5: UILabel!
    @IBOutlet weak var Course6: UILabel!
    
    
    
    
    
    
    override func viewDidLoad() {
        
        if Course1.text == ""{
            Course1.text = newCourse
        }else if Course2.text == ""{
            Course2.text = newCourse
        }else if Course3.text == ""{
            Course3.text = newCourse
        }else if Course4.text == ""{
            Course4.text = newCourse
        }else if Course5.text == ""{
            Course5.text = newCourse
        }else if Course6.text == ""{
            Course6.text = newCourse
        }
        
        
        
        super.viewDidLoad()

        
    }
    

    

}
