//
//  SecondViewModel.swift
//  SwiftArchitectureSample
//
//  Created by asmz on 2018/08/03.
//  Copyright © 2018年 asmz. All rights reserved.
//

class SecondViewModel {

    // MARK: - Variables

    private var model: SecondModel {
        didSet {
            self.countLabelText.value = "\(self.model.count)"
            self.canCountDown.value = self.model.canCountDown
        }
    }

    private(set) var countLabelText = EventVariable<String>("0")
    private(set) var canCountDown = EventVariable<Bool>(false)

    // MARK: - Constructor

    init() {
        self.model = SecondModel()
    }

    // MARK: - Internal Methods

    func countUp(num: Int = 1) {
        self.model.count += num
    }

    func countDown(num: Int = 1) {
        if self.model.canCountDown {
            self.model.count -= num
        }
    }

}
