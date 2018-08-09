//
//  MVPSamplePresenter.swift
//  SwiftArchitectureSample
//
//  Created by Shimizu Akira on 2018/08/03.
//  Copyright © 2018年 asmz. All rights reserved.
//

class MVPSamplePresenter {

    // MARK: - Variables

    private weak var view: MVPSampleView?
    private var model: MVPSampleModel {
        didSet {
            self.refreshViews()
        }
    }

    // MARK: - Constructor

    init(view: MVPSampleView) {
        self.view = view
        self.model = MVPSampleModel()
        self.refreshViews()
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

    // MARK: - Private Methods

    private func refreshViews() {
        self.view?.updateLabel(text: "\(self.model.count)")
        self.view?.updateCountDownButtonState(isEnabled: self.model.canCountDown)
    }
}
