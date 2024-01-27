//
//  RoomView.swift
//  swift test
//
//  Created by karen sun on 2024/1/26.
//

import SwiftUI


struct RowsButton: View {
    var title: String
    var subtitle: String
    var iconName: String

    
    var body: some View {
            HStack {
                Image(systemName: iconName)
                    .foregroundColor(.mint)
                    .imageScale(.large)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.black)
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding()
            .frame(width: 350, height: 100)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
            .padding(.horizontal)
        }
}

struct OptionItem: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var subtitle: String
    var iconName: String
}
struct RoomType: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var iconName: String
}


struct RoomView: View {
    @State private var selectedOptions: Set<String> = []
    @State private var selectedRoomType: String = "Bedroom"
    
    init(selectedOptions: [String] = [], selectedRoomType: String = "Bedroom") {
                _selectedOptions = State(initialValue: Set(selectedOptions))
                _selectedRoomType = State(initialValue: selectedRoomType)
            }

    let roomTypes: [RoomType] = [
        RoomType(title: "Bedroom", iconName: "bed.double.fill"),
        RoomType(title: "Living Space", iconName: "bed.double.fill"),
        RoomType(title: "Workspace", iconName: "bed.double.fill")
    ]
    
    let optionItems: [OptionItem] = [
        OptionItem(title: "Sleeping for one", subtitle: "A bed for one person to sleep comfortably", iconName: "bed.double.circle"),
            OptionItem(title: "Sleeping for two", subtitle: "A bed for two to sleep comfortably", iconName: "bed.double"),
            OptionItem(title: "Lounging", subtitle: "A place to sit & read", iconName: "chair.lounge"),
            OptionItem(title: "Organizing", subtitle: "Storage for clothing & other stuff", iconName: "tray.2"),
            OptionItem(title: "Binge-watching", subtitle: "Watching TV in my bedroom", iconName: "tv"),
            OptionItem(title: "Plant mom", subtitle: "Care for a few plants", iconName: "camera.macro")
        ]

    var body: some View {
        
        NavigationView {
            ZStack{
                Color(hex: "#f2f2f7").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    
                    HStack {
                        ForEach(roomTypes, id: \.self) { roomType in
                            Button(action: {
                                self.selectedRoomType = roomType.title
                                self.selectedOptions.removeAll()
                                
                            }) {
                                HStack{
                                    Image(systemName: roomType.iconName)
                                        .foregroundColor(.mint)
                                        .imageScale(.small)
                                    
                                    Text(roomType.title)
                                        .foregroundColor(Color.black)
                                        .font(.custom("Helvetica", size: 12))
                                    
                                }.padding()
                                    .background(self.selectedRoomType == roomType.title ?Color.mint.opacity(0.2) : Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                    )
                                    .cornerRadius(10)
                                
                                
                            }
                        }
                    }
                    
                    Text("Design Your Room")
                        .font(.custom("Helvetica", size: 28))
                        .frame(width: 350, height: 40, alignment: .leading)
                        .bold()
                    Text("When it comes to your bedroom, what is important to you?")
                        .font(.custom("Helvetica", size: 16))
                        .frame(width: 350, height: 40, alignment: .leading)
                        .bold()
                    Text("Pick as many as you want")
                        .font(.custom("Helvetica", size: 15))
                        .frame(width: 350, height: 30, alignment: .leading)
                        .foregroundColor(.gray)
                    
                    List(optionItems, id: \.self, selection: $selectedOptions) {
                        optionItem in
                        RowsButton(title: optionItem.title, subtitle:optionItem.subtitle, iconName: optionItem.iconName)
                            .onTapGesture {
                                if self.selectedOptions.contains(optionItem.title) {
                                    self.selectedOptions.remove(optionItem.title)
                                } else {
                                    self.selectedOptions.insert(optionItem.title)
                                }
                            }
                            .listRowBackground(self.selectedOptions.contains(optionItem.title) ? Color.mint.opacity(0.4) : Color.clear)
                    }
                    
                    .navigationBarItems(
                        leading: Button(action: {
                            
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.mint)
                        },
                        
                        trailing: NavigationLink(destination: CenterpieceView(selectedOptions: Array(selectedOptions), selectedRoomType: selectedRoomType).navigationBarHidden(true)) {
                            Text("Next")
                                .foregroundColor(.mint)
                        }
                    )
                    
                }
            }
        }
    }
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView()
    }
}
