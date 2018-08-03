//
//  SecondViewModel.swift
//  SwiftArchitectureSample
//
//  Created by asmz on 2018/08/03.
//  Copyright © 2018年 asmz. All rights reserved.
//

class SecondViewModel {

    // MARK: - Variables
    private var model = SecondModel()

    private(set) var numOfCounts = EventVariable<Int>(0)
    private(set) var canCountDown = EventVariable<Bool>(false)

    // MARK: - Constructor

    init() {
        self.numOfCounts.asEventObserver().receive { count in
            self.canCountDown.value = count > 0
        }
    }

    // MARK: - Internal Methods

    func countUp(num: Int = 1) {
        self.model.count += num
        self.numOfCounts.value = self.model.count
    }

    func countDown(num: Int = 1) {
        if self.canCountDown.value {
            self.model.count -= num
            self.numOfCounts.value = self.model.count
        }
    }

}
