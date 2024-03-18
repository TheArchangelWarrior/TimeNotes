//
//  ContentView.swift
//  assignmentNotebook
//
//  Created by Angel Bitsov on 3/15/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    //Swift Data stuff
    @Environment(\.modelContext) private var context
    @Query private var items: [DataModel]
    //Sheet View Stuff
    @State private var showingSheet = false
    @State private var name = ""
    
    var body: some View {
        VStack {
            Text("Assignment Notebook")
                .font(.largeTitle)
            Text("Press the \"+\" sign to create a new item. Swipe left ot delete an item.")
            Button(action: {
                showingSheet.toggle()
                
            }, label: {
                Image(systemName: "plus.square.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .scaledToFit()
            })
            .sheet(isPresented: $showingSheet){
                CreateItemView()
            }
            Divider()
            List() {
                ForEach(items){ item in
                    ItemView(name: item.name)
                }
                .onDelete { indexes in
                    for index in indexes{
                        deleteItem(items[index])
                    }
                }
            }
            .listStyle(.insetGrouped)
        }
        .padding()
    }
    
    
    func deleteItem(_ item: DataModel){
        context.delete(item)
    }
}


