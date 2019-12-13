//
//  InfoCourseViewController.swift
//  iCollege
//
//  Created by Jesús Aguas Acin on 09/12/2019.
//  Copyright © 2019 Jesus Aguas Acin. All rights reserved.
//
import UIKit


class InfoCourseViewController: UIViewController {
    
    @IBOutlet weak var Credits: UILabel!
    @IBOutlet weak var Professor: UILabel!
    @IBOutlet weak var Location: UILabel!
    @IBOutlet weak var Time: UILabel!
    @IBOutlet weak var CourseName: UILabel!
    
    var course: Courses?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        CourseName.text = course?.name
        Time.text = course?.time
        Location.text = course?.location
        Professor.text = course?.professor
        Credits.text = course?.credits
    }

}
