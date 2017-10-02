import UIKit
import ReactiveSwift

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let clock = ReactiveClock()
     let tableViewUtils = TableViewHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableViewUtils.signal.observe(on: UIScheduler())
            .observeValues { cell in
            print(cell)
        }
        // Do any additional setup after loading the view, typically from a nib.
//        clock.signal
//            .observe(on: UIScheduler())
//            .observeValues { value in
//                self.label.text = "\(value)"
//            }
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: "PowerTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        tableViewUtils.items = ["1" as AnyObject, "2" as AnyObject, "3" as AnyObject, "4" as AnyObject, "5" as AnyObject]
        tableView.delegate = tableViewUtils
        tableView.dataSource = tableViewUtils
    }
}

