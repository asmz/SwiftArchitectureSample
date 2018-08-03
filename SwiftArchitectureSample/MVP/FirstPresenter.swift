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
    private var model: FirstModel {
        didSet {
            self.refresh()
        }
    }

    // MARK: - Constructor

    init(view: FirstView) {
        self.view = view
        self.model = FirstModel()
        self.refresh()
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

    func refresh() {
        self.view?.updateLabel(text: "\(self.model.count)")
        self.view?.updateCountDownButtonState(isEnabled: self.model.canCountDown)
    }
}
