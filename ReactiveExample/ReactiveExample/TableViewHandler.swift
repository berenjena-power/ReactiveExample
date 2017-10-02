import UIKit
import ReactiveSwift
import Result

class TableViewHandler: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var items = [AnyObject]()
    let signal: Signal<UITableViewCell, NoError>
    private let observer:  Signal<UITableViewCell, NoError>.Observer
    
    override init() {
        (signal, observer) = Signal<UITableViewCell, NoError>.pipe()
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as?   PowerTableViewCell else { return UITableViewCell() }
            cell.titleLabel?.text = ("\(items[indexPath.row])")
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            observer.send(value: cell)
        }
    }
}
