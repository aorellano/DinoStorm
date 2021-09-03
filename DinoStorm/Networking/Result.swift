//
//  Result.swift
//  DinoStorm
//
//  Created by Alexis Orellano on 9/2/21.
//

enum Result<T, U> where U: Error {
    case success(T)
    case failure(U)
}
