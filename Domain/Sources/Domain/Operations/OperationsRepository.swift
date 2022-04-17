//
//  OperationsRepository.swift
//  
//
//  Created by Breno Aquino on 20/01/22.
//

import Foundation
import Combine

public protocol OperationsRepository {
    func operations(month: Int?, year: Int?) -> AnyPublisher<[Operation], CharlesError>
    func operations(startMonth: Int, startYear: Int, endMonth: Int, endYear: Int) -> AnyPublisher<[Domain.Operation], CharlesError>
    func addOperation(createOperation: CreateOperation) -> AnyPublisher<[Operation], CharlesError>
}
