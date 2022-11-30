//
//  RoadGoodExample.swift
//  Decorator-wongbing
//
//  Created by 이원빈 on 2022/11/23.
//

protocol Display {
    func draw()
}

class RoadDisplay2: Display {
    func draw() {
        print("기본 도로 표시")
    }
}

class DisplayDecorator: Display {
    var decoratedDisplay: Display
    
    init(display: Display) {
        self.decoratedDisplay = display
    }
    
    func draw() {
        self.decoratedDisplay.draw()
    }
}

class LaneDecorator: DisplayDecorator {
    override func draw() {
        super.draw()
        self.drawLane()
    }
    
    private func drawLane() {
        print("+ 차선 표시")
    }
}

class TrafficDecorator: DisplayDecorator {
    override func draw() {
        super.draw()
        self.drawTraffic()
    }
    
    private func drawTraffic() {
        print("+ 교통량 표시")
    }
}

// 데코레이터를 추가하면 자유롭게 사용 가능하다 !!
