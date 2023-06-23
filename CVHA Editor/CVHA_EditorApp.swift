//
//  CVHA_EditorApp.swift
//  CVHA Editor
//
//  Created by Steve Craig on 23/06/2023.
//

import SwiftUI

@main
struct CVHA_EditorApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: CVHA_EditorDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
