//
//  SecondViewModel.swift
//  SwiftArchitectureSample
//
//  Created by asmz on 2018/08/03.
//  Copyright © 2018年 asmz. All rights reserved.
//

class SecondViewModel {

    // MARK: - Variables

    private var model = SimpleDataBinder<SecondModel>(SecondModel())

    private(set) var countLabelText = SimpleDataBinder<String>("0")
    private(set) var canCountDown = SimpleDataBinder<Bool>(false)

    // MARK: - Constructor

    init() {
        self.model.bind { model in
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
