//
//  Array.swift
//  Funky
//
//  Created by Richard Wei on 8/27/16.
//
//

extension Array : Mappable {

    public typealias MapSource = Element
    public typealias MapTarget = Any
    public typealias MapResult = [MapTarget]

    @inline(__always)
    public func map<MapTarget>(_ transform: @escaping (MapSource) -> MapTarget) -> [MapTarget] {
        return try! map(transform as (Iterator.Element) throws -> MapTarget)
    }

}

extension Array : ApplicativeMappable {

    public typealias ApplicativeTransform = [(MapSource) -> MapTarget]

    @inline(__always)
    public func apply<MapTarget>(_ transforms: [(MapSource) -> MapTarget]) -> [MapTarget] {
        return transforms.flatMap(map)
    }

    public static func singleton(_ element: Element) -> [Element] {
        return [element]
    }

}

extension Array : FlatMappable {

    @inline(__always)
    public func flatMap<MapTarget>(_ transform: @escaping (MapSource) -> [MapTarget]) -> [MapTarget] {
        return try! flatMap(transform as (Iterator.Element) throws -> [MapTarget])
    }

}

extension Array : Associative {

    public static var identity: [Element] {
        return []
    }

}

extension Array : Reducible {

    @inline(__always)
    public func reduce<Result>(_ initial: Result, _ nextPartialResult: @escaping (Result, MapSource) -> Result) -> Result {
        return try! reduce(initial, (nextPartialResult as (Result, MapSource) throws -> Result))
    }

}
