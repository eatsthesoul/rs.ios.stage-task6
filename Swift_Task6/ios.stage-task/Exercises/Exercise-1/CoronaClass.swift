import Foundation

class CoronaClass {
    
    var seats = [Int]()
    let n: Int
    
    init(n: Int) {
        self.n = n
    }
    
    func seat() -> Int {
        
        if seats.count == n { return 0 }
        
        if seats.isEmpty && n > 0 {
            seats.append(0)
            return 0
        }
        
        var distanceArray = [Int]()
        
        for i in 0..<seats.count-1 {
            let difference = seats[i + 1] - seats[i] - 1
            
            if difference % 2 == 1 {
                distanceArray.append(difference / 2)
            } else {
                distanceArray.append(difference / 2 - 1)
            }
        }
        
        // max distance for array
        let maxDistance = distanceArray.max() ?? 0
        let indexOfDistance = distanceArray.firstIndex(of: maxDistance) ?? 0
        
        // max and min elements handling
        let maxElementDistance = n - 1 - seats.last! - 1
        let minElementDistance = seats.first! - 1
        if maxDistance <= maxElementDistance || maxDistance <= minElementDistance {
            if minElementDistance < maxElementDistance {
                seats.append(n - 1)
                return n - 1
            }
            seats.insert(0, at: 0)
            return 0
        }
        
        let seat = seats[indexOfDistance] + maxDistance + 1
        seats.insert(seat, at: indexOfDistance + 1)
        return seat
    }
    
    func leave(_ p: Int) {
        guard let index = seats.firstIndex(of: p) else { return }
        seats.remove(at: index)
    }
}
