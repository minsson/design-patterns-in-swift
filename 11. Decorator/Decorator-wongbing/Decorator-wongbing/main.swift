//
//  main.swift
//  Decorator-wongbing
//
//  Created by 이원빈 on 2022/11/22.
//


// MARK: - Example

//testDecoratorConceptual()

// MARK: - RealWorldExample

//let espresso = BaseComponent()
//print(espresso.add())
//
//let americano = WaterDecorator(coffeeComponent: espresso)
//print(americano.add())
//
//let lattee = MilkDecorator(coffeeComponent: WaterDecorator(coffeeComponent: BaseComponent()))
//print(lattee.add())

// MARK: - RoadBADExample

let road = RoadDisplay1()
road.draw() // 기본 도로표시
print()
let roadWithLane = RoadDisplayWithLane()
roadWithLane.draw() // 기본 도로 표시
                    // + 차선 표시
print()
let roadWithTraffic = RoadDisplayWithTraffic()
roadWithTraffic.draw() // 기본 도로 표시
                       // + 교통량 표시
print()

let roadWithLaneAndTraffic = RoadDisplayWithLaneAndTraffic()
roadWithLaneAndTraffic.draw() // 기본 도로 표시
                              // + 차선 표시
                              // + 교통량 표시

//let one = RoadDisplay1()
//one.draw()
//let two = RoadDisplay3()
//two.draw()
//let three = RoadDisplay4()
//three.draw()


// MARK: - RoadGoodExample

//let road = RoadDisplay2()
//road.draw()
//print()
//let roadWithLane = LaneDecorator(display: road)
//roadWithLane.draw()
//print()
//let roadWithTraffic = TrafficDecorator(display: road)
//roadWithTraffic.draw()
//print()
//let roadWithLaneAndTraffic = TrafficDecorator(display: LaneDecorator(display: road))
//roadWithLaneAndTraffic.draw()
