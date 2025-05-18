# iOS Developer Task - Team Creator Game

## Task Description

Create a Team Creator game where users can create teams from a pool of players with different skills and costs. The goal is to create the best team within a given budget.

### Core Features (To Be Implemented by You)

1. Display a list of available players with their:
   - Name
   - Skill score (1-10)
   - Cost (in millions)
2. Allow users to select/deselect players for their team.
3. Dynamically update and display the current team's summary:
   - Total team score
   - Total team cost
   - Number of selected players
   - Remaining budget
4. Enforce team creation rules:
   - Budget: $50M (cannot be exceeded)
   - Team Size: Exactly 5 players
5. Add a "Create Best Team" button:
   - Implement logic to automatically select the optimal team of 5 players that maximizes total skill score while staying within the $50M budget.
6. Persist the _manually selected_ team and the _best generated team_ using Core Data (e.g., mark players as selected for the current manual team, or store the best team composition).

## Implementation Notes (What the You Needs To Do)

### 1. Core Functionality (Refer to `ContentView.swift` TODOs)

- **Player Display:** Fetch players from Core Data and display them in a list. Each player row should show their name, skill, and cost.
- **Player Selection:** Implement logic to allow users to tap on a player to add/remove them from the current team. Update the UI accordingly.
- **Team Summary:** Calculate and display the total cost, total skill score, number of players selected, and remaining budget for the current team. This should update dynamically as players are selected/deselected.
- **Validation Logic:**
  - Prevent selecting a player if it exceeds the $50M budget.
  - Prevent selecting more than 5 players.
  - Ensure a manually finalized team has exactly 5 players.
- **"Create Best Team" Feature:**
  - Add a button to trigger this functionality.
  - Write an algorithm to find the combination of 5 players that yields the highest total skill score without exceeding the $50M budget. Display this team to the user (e.g., by selecting these players in the UI or showing a summary).
- **Data Persistence:** Use Core Data to save the state of the user's manually selected team (which players are selected).

### 2. Architecture & Error Handling

- **Code Organization:** Structure your code logically. Consider implementing a ViewModel to separate UI logic from business logic (data manipulation, validation, team creation algorithm).
- **Error Handling:** Provide clear feedback to the user for actions like exceeding the budget, trying to select more than 5 players, or if no optimal team can be formed. Alerts or on-screen messages are appropriate.

### 3. Example: Determining the "Best Team" (Based on Sample Data)

For the provided sample player data:

```
| Name        | Skill | Cost ($M) |
|-------------|-------|-----------|
| Rituraj     | 8     | 12.0      |
| Rishabh     | 7     | 10.0      |
| Rohit       | 9     | 15.0      |
| Bhuvneshwar | 6     | 8.0       |
| Hardik      | 8     | 11.0      |
| Kuldeep     | 7     | 9.0       |
| Kohli       | 9     | 14.0      |
| Dhoni       | 6     | 7.0       |
| Bumrah      | 8     | 12.0      |
| Surya       | 7     | 10.0      |
```

And the rules (5 players, max $50M budget, maximize total skill), one such "Best Team" could be:

- **Rohit** (Skill: 9, Cost: 15M)
- **Hardik** (Skill: 8, Cost: 11M)
- **Kuldeep** (Skill: 7, Cost: 9M)
- **Dhoni** (Skill: 6, Cost: 7M)
- **Bhuvneshwar** (Skill: 6, Cost: 8M)

**Total Team Skill:** 36
**Total Team Cost:** $50M

_Notes: Your algorithm should find this team or another team with the same optimal skill and cost. There might be multiple teams that meet the criteria for "best". The key is to implement an algorithm that correctly identifies a team with the maximum possible skill within the budget._

## Requirements (Provided Boilerplate)

- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+
- Core Data model for `Player` (name, skillScore, cost, isSelected) is provided.
- Sample player data generation is provided in `PersistenceController.swift`.

## Time Limit

1 hour

## Evaluation Criteria

1. Correctness and completeness of implemented core features.
2. Logic for the "Create Best Team" feature.
3. Code organization and architecture (use of ViewModel, separation of concerns).
4. Swift best practices and code readability.
5. UI/UX implementation and user feedback.
6. Effective use of Core Data for persistence.
7. Approach to error handling.

## Getting Started

1. Review this README thoroughly to understand the requirements.
2. Examine `ContentView.swift` and its TODO comments which guide the implementation.
3. Plan your approach, especially for the "Create Best Team" algorithm.
4. Build and run the project to see the initial (empty) UI.

## Project Structure

- `TeamCreator/` - Main app target
  - `Models/TeamCreator.xcdatamodeld` - Core Data model (Player entity provided)
  - `Views/ContentView.swift` - Main UI file (You need to implement)
  - `TeamCreatorApp.swift` - App entry point with `PersistenceController` (Sample data generation included)
  - `Utilities/` (You may add files here, e.g., ViewModel)
