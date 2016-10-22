//
//  Optional.swift
//  Funky
//
//  Created by Richard Wei on 8/28/16.
//
//

extension Optional : Mappable {

    public typealias MapSource = Wrapped
    public typealias MapTarget = Any
    public typealias MapResult = MapTarget?

    @inline(__always)
    public func map<MapTarget>(_ transform: @escaping (MapSource) -> MapTarget) -> MapTarget? {
        return try! map(transform as (Wrapped) throws -> MapTarget)
    }

}

extension Optional : ApplicativeMappable {

    public typealias ApplicativeTransform = ((MapSource) -> MapTarget)?

    @inline(__always)
    public func apply<MapTarget>(_ transform: ((MapSource) -> MapTarget)?) -> MapTarget? {
        guard case let (.some(f), .some(x)) = (transform, self) else {
            return nil
        }
        return f(x)
    }

    public static func singleton(_ element: Wrapped) -> Wrapped? {
        return .some(element)
    }

}

extension Optional : FlatMappable {

    @inline(__always)
    public func flatMap<MapTarget>(_ transform: @escaping (MapSource) -> MapTarget?) -> MapTarget? {
        return try! flatMap(transform as (Wrapped) throws -> MapTarget?)
    }

}
