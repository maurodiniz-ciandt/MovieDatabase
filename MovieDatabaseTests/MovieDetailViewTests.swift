//
//  MovieDetailViewTests.swift
//  MovieDatabase
//
//  Created by Mauro Augusto Araujo Diniz on 24/09/25.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import MovieDatabase

final class MovieDetailViewTests: XCTestCase {
    
    var sut: MovieDetailView!
    var mockData: Movie!
    
    override func setUp() {
        super.setUp()
        mockData = MockData.sampleMovie
        sut = MovieDetailView(movie: mockData,
                              isShowingDetail: .constant(true))
    }
    
    override func tearDown() {
        mockData = nil
        sut = nil
        
        super.tearDown()
    }
    
    func test_MovieDetailView_mainVStack_shouldNotBeNil() throws {
        let view = try sut.inspect()
        let content = view.findAll {
            try $0.accessibilityIdentifier() == "Main Content"
        }.first
        
        XCTAssertNotNil(content)
    }
    
    func test_MovieDetailView_CheckTextProperties() throws {
        let expectedTitle = mockData.title
        let expectedOverview = "Overview: \(mockData.overview)"
        let view = try sut.inspect()
        
        let titleContent = view.findAll {
            try $0.accessibilityIdentifier() == "Title"
        }.first
        let overViewContent = view.findAll {
            try $0.accessibilityIdentifier() == "Overview"
        }.first
        
        guard let titleObjectInspect = titleContent,
        let overviewObjectInspect = overViewContent else {
            XCTFail()
            return
        }
        
        let titleText = try titleObjectInspect.text().string()
        let overviewText = try overviewObjectInspect.text().string()
        
        XCTAssertEqual(titleText, expectedTitle)
        XCTAssertEqual(overviewText, expectedOverview)
    }
}
