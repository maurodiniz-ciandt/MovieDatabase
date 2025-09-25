//
//  AlertItem.swift
//  MovieDatabase
//
//  Created by Mauro Augusto Araujo Diniz on 24/09/25.
//

import SwiftUI

public struct AlertItem: Identifiable {
    public let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData = AlertItem(title: Text("Server error"),
                                       message: Text("The data received from the server was invalid. Please try to refresh the page again."),
                                       dismissButton: .default(Text("Ok")))
    
    static let invalidResponse = AlertItem(title: Text("Server error"),
                                           message: Text("Invalid response from the server. Please try to refresh the page again."),
                                           dismissButton: .default(Text("Ok")))
    
    static let invalidURL = AlertItem(title: Text("Server error"),
                                      message: Text("There was an issue connecting to the server. If this persists, please contact support"),
                                      dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = AlertItem(title: Text("Server error"),
                                            message: Text("Unable to complete your request at this time. Please check your internet connection"),
                                            dismissButton: .default(Text("Ok")))
    
    static let genericAlert = AlertItem(title: Text("Something went wrong"),
                                        message: Text("Unable to complete your request at this time. Please pull down to refresh the page."),
                                        dismissButton: .default(Text("Ok")))
}
