//
//  Associative.swift
//  Funky
//
//  Created by Richard Wei on 8/27/16.
//
//

/// Monoid
public protocol Associative {

    static var identity: Self { get }

    static func +(_: Self, _: Self) -> Self

}

extension Sequence where Iterator.Element : Associative {

    public func reduced() -> Iterator.Element {
        return reduce(Iterator.Element.identity, +)
    }

}

extension String : Associative {

    public static var identity: String {
        return ""
    }

}
