//
//  CreateItemView.swift
//  assignmentNotebook
//
//  Created by Angel Bitsov on 3/15/24.
//

import SwiftUI

struct CreateItemView: View {
    //swift data stuff
    @Environment(\.modelContext) private var context
    //sheet stuff
    @State var name: String = ""
    @State var subject: String = ""
    @State var isDone: Bool = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Text("Create Item")
                .font(.largeTitle)
            TextField("Enter Assignment Name", text: $name)
            TextField("Enter Subject Name", text: $subject)
            Button(action: {
                addItem()
                dismiss()
            }, label: {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 140, height: 50)
                    .foregroundStyle(.blue)
                    .overlay(
                        Text("Submit")
                            .foregroundStyle(.white)
                            .font(.title)
                    )
            })
        }.textFieldStyle(.roundedBorder)
        .padding(30)
        
        
    }
    
    func addItem(){
        let item = DataModel(name: name, subject: subject)
        
        context.insert(item)
    }
    
}


