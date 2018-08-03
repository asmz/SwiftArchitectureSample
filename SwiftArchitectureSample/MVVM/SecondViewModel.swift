//
//  SecondViewModel.swift
//  SwiftArchitectureSample
//
//  Created by asmz on 2018/08/03.
//  Copyright © 2018年 asmz. All rights reserved.
//

class SecondViewModel {

    // MARK: - Variables

    private(set) var model = EventVariable<SecondModel>(SecondModel())

    // MARK: - Internal Methods

    func countUp(num: Int = 1) {
        self.model.value.count += num
    }

    func countDown(num: Int = 1) {
        if self.model.value.count > 0 {
            self.model.value.count -= num
        }
    }

}
