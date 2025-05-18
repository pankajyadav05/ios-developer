import SwiftUI
import CoreData

// TODO: 1. Implement a ViewModel to manage data and business logic (see README: Architecture).

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var showingTeamSummarySheet = false // To present the team summary

    // TODO: 2. Fetch available players from Core Data (see README: Core Functionality).
    // @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Player.name, ascending: true)])
    // private var players: FetchedResults<Player>

    // TODO: 3. Manage the state of the currently selected team (see README: Core Functionality).
    // @State private var selectedPlayerIDs: Set<UUID> = []
    // @State private var currentTeamCost: Double = 0.0
    // @State private var currentTeamScore: Int = 0

    var body: some View {
        NavigationView {
            VStack {
                // TODO: 4. Display the list of available players (PlayerListView) (see README: Core Functionality).
                // - Each row (PlayerRow) should show player details (name, skill, cost).
                // - Implement selection/deselection logic in PlayerRow.
                List {
                    Text("Player List (Implement PlayerRow here)")
                    // ForEach(players) { player in
                    //     PlayerRow(player: player, isSelected: selectedPlayerIDs.contains(player.id ?? UUID()), onToggle: togglePlayerSelection)
                    // }
                }

                Spacer()

                // TODO: 5. Display the current team's summary (TeamSummaryView) (see README: Core Functionality).
                // - Show total cost, total score, number of players, remaining budget.
                Text("Team Summary (Implement TeamSummaryView here or show details directly)")
                    .padding()

                // TODO: 6. Add "Create Best Team" button (see README: "Create Best Team" Feature).
                // - Implement the logic to automatically select the optimal team.
                Button("Create Best Team (Implement Logic)") {
                    // createBestTeam()
                }
                .padding()
            }
            .navigationTitle("Team Creator")
        }
        // TODO: 7. Implement error handling and user feedback (see README: Architecture & Error Handling).
    }

    // TODO: 8. Implement functions for player selection, team validation, and creating the best team (see README).
    // func togglePlayerSelection(player: Player) { ... }
    // func createBestTeam() { ... }
    // func saveTeam() { ... } // If persisting a manually selected team
}

// TODO: 9. Create PlayerRow view (see README: Core Functionality).

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
} 