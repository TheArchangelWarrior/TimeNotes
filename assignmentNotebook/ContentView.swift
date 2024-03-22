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
    @State private var subject = ""
    
    
    var body: some View {
        VStack {
            Text("Time Notes")
                .font(.largeTitle)
            Text("Click the \"+\" sign to add a new assignment.")
                .font(.caption)
            Divider()
            List() {
                ForEach(items){ item in
                    ItemView(name: item.name, subject: item.subject, isDone: item.isDone)
                }


                .onDelete { indexes in
                    for index in indexes{
                        deleteItem(items[index])
                    }
                }
            }
            .listStyle(.insetGrouped)
            Divider()
            Button(action: {
                showingSheet.toggle()
                
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .scaledToFit()
            })
            .sheet(isPresented: $showingSheet){
                CreateItemView()
            }
        }
        .padding()
    }
    
    
    func deleteItem(_ item: DataModel){
        context.delete(item)
    }
}


