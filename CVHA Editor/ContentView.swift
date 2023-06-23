//
//  ContentView.swift
//  CVHA Editor
//
//  Created by Steve Craig on 23/06/2023.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: CVHA_EditorDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(CVHA_EditorDocument()))
    }
}
