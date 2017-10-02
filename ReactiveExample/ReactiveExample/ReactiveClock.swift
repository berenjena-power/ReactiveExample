import Foundation
import ReactiveSwift
import Result

public class ReactiveClock {
    let signal: Signal<Int, NoError>
    private let observer: Signal<Int, NoError>.Observer
    
    init() {
        (signal, observer) = Signal<Int, NoError>.pipe()
        
        let timer = Timer(timeInterval: 1000, repeats: true) { timer in
            self.observer.send(value: 1)
        }
        timer.fire()
    }
}
