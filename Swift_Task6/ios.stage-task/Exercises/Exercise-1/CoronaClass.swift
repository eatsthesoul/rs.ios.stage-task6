import Foundation

class CoronaClass {
    
    var seats = [Int]()
    let n: Int
    
    init(n: Int) {
        self.n = n
    }
    
    func seat() -> Int {
        
        if !seats.contains(0) && n > 0 {
            seats.insert(0, at: 0)
            return 0
        }
        
        if !seats.contains(n - 1) {
            seats.append(n - 1)
            return n - 1
        }
        
        var distanceArray = [Int]()
        
        for i in 0..<seats.count-1 {
            let difference = seats[i + 1] - seats[i] - 1
            
            if difference % 2 == 1 {
                distanceArray.append(difference / 2 + 1)
            } else {
                distanceArray.append(difference / 2)
            }
        }
        
        let maxDistance = distanceArray.max()!
        let indexOfDistance = distanceArray.firstIndex(of: maxDistance)!
        
        let seat = seats[indexOfDistance] + maxDistance
        seats.insert(seat, at: indexOfDistance + 1)
        return seat
    }
    
    func leave(_ p: Int) {
        guard let index = seats.firstIndex(of: p) else { return }
        seats.remove(at: index)
    }
}
