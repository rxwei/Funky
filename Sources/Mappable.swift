//
//  Mappable.swift
//  Funky
//
//  Created by Richard Wei on 8/27/16.
//
//

/// Functor
public protocol Mappable {

    associatedtype MapSource
    associatedtype MapTarget = Any
    associatedtype MapResult

    func map(_ transform: @escaping (MapSource) -> MapTarget) -> MapResult

}

/// Applicative
public protocol ApplicativeMappable : Mappable {

    associatedtype ApplicativeTransform

    func apply(_ transform: ApplicativeTransform) -> MapResult

    static func singleton(_ element: MapSource) -> Self

}

/// Monad
public protocol FlatMappable : ApplicativeMappable {

    func flatMap(_ transform: @escaping (MapSource) -> MapResult) -> MapResult

    static func `return`(_ element: MapSource) -> Self

}

public extension FlatMappable {

    @inline(__always)
    static func `return`(_ element: MapSource) -> Self {
        return singleton(element)
    }

}
