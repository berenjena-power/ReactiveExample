import UIKit
import ReactiveSwift

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    let clock = ReactiveClock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        clock.signal
            .observe(on: UIScheduler())
            .observeValues { value in
                self.label.text = "\(value)"
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

