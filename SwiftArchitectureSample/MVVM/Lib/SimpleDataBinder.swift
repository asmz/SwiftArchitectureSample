//
//  SimpleDataBinder.swift
//  SwiftArchitectureSample
//
//  Created by Shimizu Akira on 2018/08/03.
//  Copyright © 2018年 asmz. All rights reserved.
//

import Foundation

final class SimpleDataBinder<Element> {

    private let _bindable: Bindable<Element>
    private var _value: Element

    var value: Element {
        get {
            return _value
        }
        set(newValue) {
            _value = newValue
            _bindable.send(value: newValue)
        }
    }

    init(_ value: Element) {
        _value = value
        _bindable = Bindable()
    }

    func asBindable() -> Bindable<Element> {
        return _bindable
    }

}

class Bindable<Element> {
    typealias receiveClosure = ((_ value: Element) -> Void)?

    var closureArray = [Bindable.receiveClosure]()

    func bind(to closure: Bindable.receiveClosure) {
        self.closureArray.append(closure)
    }

    func send(value: Element) {
        for closure in closureArray {
            DispatchQueue.main.async {
                closure!(value)
            }
        }
    }
}
