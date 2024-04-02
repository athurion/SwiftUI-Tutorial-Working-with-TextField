//
//  ContentView.swift
//  SwiftUI Tutorial: Working with TextField
//
//  Created by Alvin Sosangyo on 4/1/24.
//


import SwiftUI

struct ContentView: View {
    
    @State private var printedText: String = " "
    @State private var inputText: String = ""
    
    @FocusState private var isTextFieldFocused
    
    var body: some View {
        VStack {
            Spacer()
            printDisplayView
            form
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .onAppear {
            isTextFieldFocused = true
        }
    }
    
    private var form: some View {
        VStack{
            textField.padding()
            button.padding(.bottom)
        }
        .background(.green)
        .cornerRadius(15)
        .padding()
    }
    
    private var textField: some View {
        TextField("", text: $inputText, prompt: promptLabel)
            .focused($isTextFieldFocused)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .padding()
            .textFieldStyle(.roundedBorder)
            .onSubmit(printText)
    }
    
    private var button: some View {
        Button(action: printText) {
            Text("Print")
                .foregroundColor(.white)
        }
    }
    
    private var printDisplayView: some View {
        Text(printedText)
            .font(.largeTitle)
            .foregroundColor(.white)
    }
    
    private var promptLabel: Text {
        Text("Required")
            .fontWeight(.black)
    }
    
    private func printText() {
        printedText = inputText
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
