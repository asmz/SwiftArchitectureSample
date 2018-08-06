//
//  SimpleDataBinder.swift
//  SwiftArchitectureSample
//
//  Created by Shimizu Akira on 2018/08/03.
//  Copyright © 2018年 asmz. All rights reserved.
//

import Foundation

final class SimpleDataBinder<Element> {

    private var callbacks: [((Element) -> Void)] = []

    var value: Element {
        didSet {
            callbacks.forEach { $0(value) }
        }
    }

    init(_ value: Element) {
        self.value = value
    }

    func bind(to callback: @escaping (Element) -> Void) {
        callbacks.append(callback)
    }

}
