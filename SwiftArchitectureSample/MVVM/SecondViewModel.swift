//
//  SecondViewModel.swift
//  SwiftArchitectureSample
//
//  Created by asmz on 2018/08/03.
//  Copyright © 2018年 asmz. All rights reserved.
//

class SecondViewModel {

    // MARK: - Variables

    private var model = EventVariable<SecondModel>(SecondModel())

    private(set) var countLabelText = EventVariable<String>("0")
    private(set) var canCountDown = EventVariable<Bool>(false)

    // MARK: - Constructor

    init() {
        self.model.asEventObserver().receive { model in
            self.countLabelText.value = "\(self.model.value.count)"
            self.canCountDown.value = self.model.value.canCountDown
        }
    }

    // MARK: - Internal Methods

    func countUp(num: Int = 1) {
        self.model.value.count += num
    }

    func countDown(num: Int = 1) {
        if self.model.value.canCountDown {
            self.model.value.count -= num
        }
    }

}
