//
//  Closures.swift
//  TopMovie
//
//  Created by Dikran Teymur on 24.12.2023.
//

import Foundation

typealias VoidClosure = (() -> Void)
typealias StringClosure = ((String) -> Void)
typealias IntClosure = ((Int) -> Void)
typealias BoolClosure = ((Bool) -> Void)
typealias AnyClosure<T: Any> = ((T) -> Void)
typealias ArrayClosure<T: Any> = (([T]) -> Void)
