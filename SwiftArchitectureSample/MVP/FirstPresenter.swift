//
//  FirstPresenter.swift
//  SwiftArchitectureSample
//
//  Created by Shimizu Akira on 2018/08/03.
//  Copyright © 2018年 asmz. All rights reserved.
//

class FirstPresenter {

    // MARK: - Variables

    private weak var view: FirstView?
    private var model = FirstModel()

    var numOfCounts: Int {
        return self.model.count
    }

    var canCountDown: Bool {
        return self.model.count > 0
    }

    // MARK: - Constructor

    init(view: FirstView) {
        self.view = view
    }

    // MARK: - Internal Methods

    func countUp(num: Int = 1) {
        self.model.count += num
        self.view?.refresh()
    }

    func countDown(num: Int = 1) {
        if self.canCountDown {
            self.model.count -= num
            self.view?.refresh()
        }
    }

}
