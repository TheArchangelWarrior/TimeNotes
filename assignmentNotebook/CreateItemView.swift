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
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Text("Create Item")
                .font(.largeTitle)
            TextField("Enter text", text: $name)
            Button("Submit"){
                addItem()
                dismiss()
            }
        }
        .padding(30)
        
        
    }
    
    func addItem(){
        let item = DataModel(name: name)
        
        context.insert(item)
    }
    
}


