//
//  ContentView.swift
//  SimplePhoneBook
//
//  Created by Narissorn Chowarun on 2024-07-27.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State var tempName: String = "Sample"
    @State var tempPosition: String = "Sample"
    @State var tempPhone: String = "555 555 5555"
    @State var search: String = "Search"

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        VStack (alignment: .center) {
                            TextField ("Name", text: $tempName)
                            TextField ("Position", text: $tempPosition)
                            TextField ("Phone Number", text: $tempPhone)
                        }
                        .padding(16)
                        .background(Color(red: 240/255, green: 240/255, blue: 240/255))
                        .onAppear(perform: {
                            item.contactName = tempName
                            item.position = tempPosition
                            item.phoneNumber = tempPhone
                        })
                        .onDisappear(perform: {
                            item.contactName = tempName
                            item.position = tempPosition
                            item.phoneNumber = tempPhone
                            tempName = "Sample"
                            tempPosition = "Sample"
                            tempPhone = "555 555 5555"
                        })
                        .padding(24)
                        
                       
                    } label: {
                        Text(item.contactName)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search", text: $search)
                        // TBD - add search function
                            
                    }
                    .padding(4)
                    .padding(.leading, 8)
                    .foregroundColor(.gray)
                    .frame(width: 250)
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.gray, lineWidth: 1)
                    )
                                        
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        let newItem = Item(contactName: tempName, position: tempPosition, phoneNumber: tempPhone)
        withAnimation {
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
