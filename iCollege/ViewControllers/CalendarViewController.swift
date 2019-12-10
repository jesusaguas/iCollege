import UIKit

class CalendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    

    
    @IBOutlet weak var Calendar: UICollectionView!
    @IBOutlet weak var MonthLabel: UILabel!
    
    
    
    
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
     
    let daysNames = [ "Monday",  "Tuesday",  "Wednesday",  "Thursday",  "Friday",  "Saturday",  "Sunday"]
     
    var daysPerMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
     
    var currentMonth = String()
     
    var numberOfEmptyBox = Int()

    var nextNumberOfEmptyBox = Int()
    
    var previousNumberOfEmptyBox = Int()
    
    var direction = 0
    
    var positionIndex = 0
    
    var leapYear = 1
    
    
    
     override func viewDidLoad() {
         super.viewDidLoad()
         
     currentMonth = months[month]
     MonthLabel.text = "\(currentMonth) \(year)"
    
     }

    
    @IBAction func Back(_ sender: Any) {
        switch currentMonth{
        case "January":
            month = 11
            year -= 1
            direction = -1
            
            if leapYear > 0{
                leapYear -= 1
            }
            if leapYear == 0{
                daysPerMonth[1] = 29
                leapYear = 4
            }else{
                daysPerMonth[1] = 28
            }
            
            
            getStartDateDay()
            
            currentMonth = months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
        default:
            month -= 1
            direction = -1
            
            getStartDateDay()
            
            currentMonth = months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
            
        }
    }
    
    
    @IBAction func Next(_ sender: Any) {
        switch currentMonth{
        case "December":
            month = 0
            year += 1
            direction = 1
            
            if leapYear < 5{
                leapYear += 1
            }
            if leapYear == 4{
                daysPerMonth[1] = 29
            }
            if leapYear == 5{
                leapYear = 1
                daysPerMonth[1] = 28
            }
            
            getStartDateDay()
            
            currentMonth = months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
        default:
            direction = 1
            
            getStartDateDay()
            
            month += 1
            currentMonth = months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
            
        }
    }
    
    
    func getStartDateDay(){
        switch direction{
        case 0:
            switch day{
            case 1...7:
                numberOfEmptyBox = weekday - day
            case 8...14:
                numberOfEmptyBox = weekday - day - 7
            case 15...21:
                numberOfEmptyBox = weekday - day - 14
            case 22...28:
                numberOfEmptyBox = weekday - day - 21
            case 29...31:
                numberOfEmptyBox = weekday - day - 28
            default:
                break
            }
            positionIndex = numberOfEmptyBox
        case 1...:
            nextNumberOfEmptyBox = (positionIndex + daysPerMonth[month]) % 7
            positionIndex = nextNumberOfEmptyBox
        case -1:
            previousNumberOfEmptyBox = (7 - (daysPerMonth[month] - positionIndex) % 7)
            if previousNumberOfEmptyBox == 7 {
                previousNumberOfEmptyBox = 0
            }
            positionIndex = previousNumberOfEmptyBox
        default:
            fatalError()
        }
    }
    
    
    
    
    

    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch direction{
        case 0:
            return daysPerMonth[month] + numberOfEmptyBox
        case 1...:
            return daysPerMonth[month] + numberOfEmptyBox
        case -1:
            return daysPerMonth[month] + numberOfEmptyBox
        default:
            fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: <#T##IndexPath#>) as! DateCollectionViewCell
        cell.backgroundColor = UIColor.clear
        cell.DateLabel.textColor = UIColor.black
        
        if cell.isHidden{
            cell.isHidden = false
        }
        
        switch direction{
        case 0:
            cell.DateLabel.text = "\(indexPath.row + 1 - numberOfEmptyBox)"
        case 1...:
            cell.DateLabel.text = "\(indexPath.row + 1 - nextNumberOfEmptyBox)"
        case -1:
            cell.DateLabel.text = "\(indexPath.row + 1 - previousNumberOfEmptyBox)"
        default:
            fatalError()
        }
        
        if Int(cell.DateLabel.text!)! < 1{
            cell.isHidden = true
        }
        
        switch indexPath.row{
        case 5,6,12,13,19,20,26,27,33,34:
            if Int(cell.DateLabel.text!)! > 0{
                cell.DateLabel.textColor = UIColor.lightGray
            }
        default:
            break
        }
        
        if currentMonth == months[calendar.component(.month, from: date) - 1] && year == calendar.component(.year, from: date) && indexPath.row + 1 == day{
            cell.backgroundColor = UIColor.red
        }
        
        return cell
        
    }

}

