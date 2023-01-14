//
//  ContentView.swift
//  Moonshot
//
//  Created by vaibhav mahajan on 1/10/23.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var showGrid = true
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    let verticalColumns = [
        GridItem(.adaptive(minimum: 300))
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(
                    columns: showGrid ? columns : verticalColumns
                ) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: .infinity, height: 100)
                                    .padding()
                                VStack {
                                    Text(mission.displayName)
                                        .font(.title)
                                        .foregroundColor(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                    
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
                .animation(.interpolatingSpring(stiffness: 50, damping: 9), value: showGrid)
            }
            .navigationTitle("Moon Shot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Toggle(isOn: $showGrid) {
                        Text("Grid")
                    }
                    .toggleStyle(.switch)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
