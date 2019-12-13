
//
//  AddCourseViewController.swift
//  iCollege
//
//  Created by Jesús Aguas Acin on 09/12/2019.
//  Copyright © 2019 Jesus Aguas Acin. All rights reserved.
//
import UIKit
import CoreData


class addCourseViewController: UITableViewController {
    
    @IBOutlet weak var CourseName: UITextField!
    
    @IBOutlet weak var Time: UITextField!
    
    @IBOutlet weak var Location: UITextField!
    
    @IBOutlet weak var Professor: UITextField!
    
    @IBOutlet weak var Credits: UITextField!
    
    @IBAction func Done(_ sender: UIBarButtonItem) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Courses", in: context)
        let newEntity = NSManagedObject(entity: entity!, insertInto: context)
        newEntity.setValue(CourseName.text, forKey: "name")
        newEntity.setValue(Time.text, forKey: "time")
        newEntity.setValue(Location.text, forKey: "location")
        newEntity.setValue(Professor.text, forKey: "professor")
        newEntity.setValue(Credits.text, forKey: "credits")
        do {
           try context.save()
          } catch {
           print("Failed saving")
        }
        dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }

}
