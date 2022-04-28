//
//  MockStatsRemoteDataSource.swift
//  
//
//  Created by Breno Aquino on 28/04/22.
//

import Foundation
import Combine

@testable import Data

class MockSuccessStatsRemoteDataSource: StatsRemoteDataSource {
    
    func stats(params: StatsParams) -> AnyPublisher<StatsDTO, CharlesDataError> {
        let categoriesStats: [CategoryStatsDTO] = [
            .init(categoryId: "0", expense: 123, averageExpense: 152.3, percentageExpense: 0.25, count: 3, averageCount: 5),
            .init(categoryId: "1", expense: 8795.12, averageExpense: 1234, percentageExpense: 0.9, count: 2, averageCount: 1)
        ]
        let stats = StatsDTO(month: 4, year: 2022, expense: 234.23, categories: categoriesStats)
        return Just(stats)
            .setFailureType(to: CharlesDataError.self)
            .eraseToAnyPublisher()
    }
    
    func historic(numberOfMonths: Int) -> AnyPublisher<[MonthStatsDTO], CharlesDataError> {
        let stats: [MonthStatsDTO] = [
            .init(month: 1, year: 2022, expense: 123.23),
            .init(month: 2, year: 2022, expense: 654),
            .init(month: 3, year: 2022, expense: 2.65)
        ]
        return Just(stats)
            .setFailureType(to: CharlesDataError.self)
            .eraseToAnyPublisher()
    }
}

class MockErrorStatsRemoteDataSource: StatsRemoteDataSource {
    
    func stats(params: StatsParams) -> AnyPublisher<StatsDTO, CharlesDataError> {
        let error = CharlesDataError(type: .badRequest)
        return Fail(error: error)
            .eraseToAnyPublisher()
    }
    
    func historic(numberOfMonths: Int) -> AnyPublisher<[MonthStatsDTO], CharlesDataError> {
        let error = CharlesDataError(type: .badRequest)
        return Fail(error: error)
            .eraseToAnyPublisher()
    }
}
