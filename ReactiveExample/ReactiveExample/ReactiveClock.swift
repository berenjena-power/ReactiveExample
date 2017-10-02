import Foundation
import ReactiveSwift
import Result

public class ReactiveClock {
    
    let signal: Signal<Int, NoError>
    private let observer: Signal<Int, NoError>.Observer
    private var currentValue: Int = 0
    private var timer: Timer? = nil
    
    init() {
        (signal, observer) = Signal<Int, NoError>.pipe()
        
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc
    func update() {
        currentValue += 1
        observer.send(value: currentValue)
    }
}
