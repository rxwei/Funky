//
//  Reducible.swift
//  Funky
//
//  Created by Richard Wei on 8/27/16.
//
//

public protocol Reducible {

    associatedtype Element

    func reduce<Result>(_ initial: Result, _ nextPartialResult: @escaping (Result, Element) -> Result) -> Result

}

public extension Reducible {

    public func mapReduce<Result: Associative>(_ transform: @escaping (Element) -> Result) -> Result {
        return reduce(Result.identity) { $0 + transform($1) }
    }

}

public extension Reducible where Element : Associative {

    public func reduced() -> Element {
        return mapReduce{$0}
    }

}
