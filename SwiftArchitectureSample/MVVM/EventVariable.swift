//
//  EventVariable.swift
//  SwiftArchitectureSample
//
//  Created by Shimizu Akira on 2018/08/03.
//  Copyright © 2018年 asmz. All rights reserved.
//

import Foundation

final class EventVariable<Element> {

    public typealias E = Element

    private let _eventObserver: EventObserver<Element>

    //private var _lock = SpinLock()

    // state
    private var _value: E

    #if DEBUG
    //fileprivate let _synchronizationTracker = SynchronizationTracker()
    #endif

    /// Gets or sets current value of variable.
    ///
    /// Whenever a new value is set, all the observers are notified of the change.
    ///
    /// Even if the newly set value is same as the old value, observers are still notified for change.
    public var value: E {
        get {
            // TODO: Lock control
            //_lock.lock(); defer { _lock.unlock() }
            return _value
        }
        set(newValue) {
            //            #if DEBUG
            //                _synchronizationTracker.register(synchronizationErrorMessage: .variable)
            //                defer { _synchronizationTracker.unregister() }
            //            #endif
            //_lock.lock()
            _value = newValue
            //_lock.unlock()

            _eventObserver.send(value: newValue)
        }
    }

    /// Initializes variable with initial value.
    ///
    /// - parameter value: Initial variable value.
    public init(_ value: Element) {
        _value = value
        _eventObserver = EventObserver()
    }

    /// - returns: Canonical interface for push style sequence
    public func asEventObserver() -> EventObserver<E> {
        return _eventObserver
    }

    //
    //    deinit {
    //        //_subject.on(.completed)
    //    }
}

public class EventObserver<Element> {

    typealias receiveClosure = ((_ value: E) -> Void)?
    var closureArray = [EventObserver.receiveClosure]()

    public typealias E = Element

    func receive(closure: EventObserver.receiveClosure) {
        self.closureArray.append(closure)
    }

    func send(value: E) {
        for closure in closureArray {
            DispatchQueue.main.async {
                closure!(value)
            }
        }
    }
}
