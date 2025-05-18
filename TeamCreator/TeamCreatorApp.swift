import SwiftUI

@main
struct TeamCreatorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "TeamCreator")
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
        
        // Generate sample data if no players exist
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<Player> = Player.fetchRequest()
        
        do {
            let count = try context.count(for: fetchRequest)
            if count == 0 {
                generateSampleData(context: context)
            }
        } catch {
            print("Error checking for sample data: \(error)")
        }
    }
    
    private func generateSampleData(context: NSManagedObjectContext) {
        let samplePlayers = [
            ("John", 8, 12.0),
            ("Sarah", 7, 10.0),
            ("Mike", 9, 15.0),
            ("Emma", 6, 8.0),
            ("David", 8, 11.0),
            ("Lisa", 7, 9.0),
            ("Tom", 9, 14.0),
            ("Anna", 6, 7.0),
            ("James", 8, 12.0),
            ("Maria", 7, 10.0)
        ]
        
        for (name, skill, cost) in samplePlayers {
            let player = Player(context: context)
            player.id = UUID()
            player.name = name
            player.skillScore = Int16(skill)
            player.cost = cost
            player.isSelected = false
        }
        
        do {
            try context.save()
        } catch {
            print("Error generating sample data: \(error)")
        }
    }
} 