//
//  ItemView.swift
//  assignmentNotebook
//
//  Created by Angel Bitsov on 3/15/24.
//

import SwiftUI

struct ItemView: View {
    @State var name: String
    var body: some View {
        HStack{
            Text("\(name)")
                .font(.title)
            Spacer()
        }
    }
}


