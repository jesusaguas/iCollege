
//
//  CourseViewController.swift
//  iCollege
//
//  Created by Jesús Aguas Acin on 09/12/2019.
//  Copyright © 2019 Jesus Aguas Acin. All rights reserved.
//
import UIKit
import CoreData

class CourseViewController: UITableViewController{
    
    @IBOutlet weak var CourseTable: UITableView!
    
    var courses = [Courses]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        getData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = courses[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            context.delete(courses[indexPath.row])
            do {
               try context.save()
              } catch {
               print("Failed saving")
            }
            courses.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showinfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? InfoCourseViewController {
            destination.course = courses[(CourseTable.indexPathForSelectedRow?.row)!]
            CourseTable.deselectRow(at: CourseTable.indexPathForSelectedRow!, animated: true)

        }
    }
    
    func getData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Courses")
        //request.returnsObjectsAsFaults = false
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Courses")
        do{
            courses = (try context.fetch(fetchRequest) as! [Courses])
        } catch {
            print("Error fetching")
        }
        
        // Then you can use your properties.
        for course in courses {
          print(course)
        }
        
        
        
        
        
        /*
        do{
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
               print(data.value(forKey: "Courses") as! String)
                          
            }
        } catch{
            print("Error")
        }
 */
    }

}
