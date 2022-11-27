//
//  RoadExample.swift
//  Decorator-wongbing
//
//  Created by 이원빈 on 2022/11/23.
//

class RoadDisplay1 {
    func draw() {
        print("기본 도로 표시")
    }
}
class RoadDisplay3 {
    func draw() {
        print("+ 차선 표시")
    }
}
class RoadDisplay4 {
    func draw() {
        print("+ 교통량 표시")
    }
}

class RoadDisplayWithLane: RoadDisplay1 {
    override func draw() {
        super.draw()
        self.drawLane()
    }
    
    private func drawLane() {
        print("+ 차선 표시")
    }
}

class RoadDisplayWithTraffic: RoadDisplay1 {
    override func draw() {
        super.draw()
        self.drawTraffic()
    }
    
    private func drawTraffic() {
        print("+ 교통량 표시")
    }
}

class RoadDisplayWithP: RoadDisplay1 {
    override func draw() {
        super.draw()
        self.drawTraffic()
    }
    
    private func drawTraffic() {
        print("+ 표지판 표시")
    }
}


// 1, 2, 3


// 1,2
// 1,3
// 2,3
// 1,2,3


// MARK: - 문제 : 차선표시와 교통량 표시 둘다 하고싶은데 ..?!
// 1. 런타임때 기존 객체의 행동을 변경할 수 없다.
// 2. 자식은 하나의 부모클래스만 상속받을 수 있다.

class RoadDisplayWithLaneAndTraffic: RoadDisplay1 {
    override func draw() {
        super.draw()
        self.drawLaneAndTraffic()
    }
    
    private func drawLaneAndTraffic() {
        print("+ 차선 표시")
        print("+ 교통량 표시")
    }
}

class RoadDisplayWithLaneAndP: RoadDisplay1 {
    override func draw() {
        super.draw()
        self.drawLaneAndTraffic()
    }
    
    private func drawLaneAndTraffic() {
        print("+ 차선 표시")
        print("+ 표지판 표시")
    }
}

// 각각의 조합마다 클래스가 만들어져야 할 것 같다.
