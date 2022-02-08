//
//  ViewState.swift
//  
//
//  Created by Breno Aquino on 20/01/22.
//

import SwiftUI

public enum ViewState {
    case content
    case finished
    case failure
    case loading
    case empty
}

public extension ViewState {
    static var loadingView: some View { LoadingView() }
}
