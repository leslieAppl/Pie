# Pie

### Implement Custom XIB UIViewController 
### Using a Callback Delegate

### MyModalVC class
        import UIKit

        protocol MyModalDelegate: class {
            
            func myModalDidFinish(controller: MyModalVC, pie: String)
        }

        class MyModalVC: UIViewController {
            
            var delegate: MyModalDelegate?
            
            @IBOutlet weak var pieLbl: UILabel!
            
            override func viewDidLoad() {
                super.viewDidLoad()

                
            }

            @IBAction func pieSelectionBtnPressed(_ sender: UIButton) {
                
                pieLbl.text = sender.titleLabel?.text
                
            }
            
            @IBAction func submitBtnPressed(_ sender: UIButton) {
                
                // Here to triger the delegate function
                // meanwhile inputing 'MyModelVC' class's info via parameter
                delegate?.myModalDidFinish(controller: self, pie: pieLbl.text!)
                
            }

### PieVC Class
        import UIKit

        class PieVC: UIViewController {
            
            // using xib name to create an instance of the View Controller
            let pieVC = MyModalVC(nibName: "MyModalVC", bundle: nil)

            @IBOutlet weak var statusLbl: UILabel!
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
            }

            @IBAction func myModalButton(_ sender: UIButton) {
                
                // here is the key for taking advatage of using Delegate!!
                // Assign itself to pieVC’s delegate property for changing the Protocol’s Type ( because Protocol has no belonging to Any type)
                //  To tell MyModalVC that its delegate property’s Protocol methods will be override in this ViewController class
                // For giving a chance to override MyModalVC's delegate functions
                pieVC.delegate = self

        //        pieVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        //        pieVC.modalTransitionStyle = UIModalTransitionStyle.partialCurl
                
                self.present(pieVC, animated: true, completion: nil)
            }
            
        }

        extension ViewController: MyModalDelegate {
            
            // here override the delegate's method
            // with the chance of manipulating data from 'MyModalVC' class injected via parameter
            func myModalDidFinish(controller: MyModalVC, pie: String) {
                
                // manipulating data mixed from 'ViewController' class and 'MyModalVC' class
                statusLbl.text = pie + " pie"
                controller.dismiss(animated: true, completion: nil)
            }

        }

## Shopping List
### Introducing UITableView, UITableViewDataSource and UItableViewDelegate
- Shopping List added Built AddItemVC
- Shopping List Used 'delegate' Concept
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if segue.identifier == "showDetailVC" {
                
                let detailVC = segue.destination as! DetailVC
                
                // assign self type into ‘DetailVC.delegate’ making a reference
                detailVC.delegate = self
                
                if let path = tableView.indexPathForSelectedRow {
                    print("vc.prepare(for segue:).transformingDataToDetailVC")
                    detailVC.selected = path.row
                    
                }
                
            } else if segue.identifier == "showAddItem" {
                
                let addItemVC = segue.destination as! AddItemVC
                
                // assign self type into ‘AddItemVC.delegate’ making a reference
                addItemVC.delegate = self
            }
        }

- Shopping List added delete function
- Shopping List added an hidden feature that simplifies the deletion of rows and the execution of custom tasks

        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) 

- Shopping List added Leading Swipe Action

        func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?

- Shopping List Added moving manually table cell

        func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) 

## Table View Controller
### Introducing Table View Controller Class
- Added MyTableVC
- Implemented Refresh Control

## Static Table
- Added static table

