//
//  ItemView.swift
//  assignmentNotebook
//
//  Created by Angel Bitsov on 3/15/24.
//

import SwiftUI

struct ItemView: View {
    //Swift data
    @Environment(\.modelContext) private var context
    //Item View
    @State var name: String
    @State var subject: String
    @State var isDone: Bool
    // Data Model
    
    
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("\(name)")
                    .font(.title)
                Text("\(subject)")
                    .font(.title3)
            }
            
            Spacer()
            
            Image(systemName: isDone ? "checkmark.square.fill" : "square")
                .onTapGesture{
                    isDone.toggle()
                }
        }
    }
    

}


