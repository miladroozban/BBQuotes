# BBQuotes

A SwiftUI application for iOS that brings the world of Breaking Bad to your fingertips. Explore characters, view random quotes, and discover episode details from the iconic series.

## Features

*   **Character Explorer**: Browse through the main characters from the Breaking Bad universe. View detailed information including their portrayed actor, status, and a random quote associated with them.
*   **Random Quotes**: Get a random quote from a specific character or from the entire series at the tap of a button.
*   **Episode Viewer**: Discover random episodes with details such as title, season, episode number, and series.
*   **Smooth UI**: Built with SwiftUI for a clean, responsive, and native iOS experience.

## Tech Stack

*   **Language**: Swift 100%
*   **UI Framework**: SwiftUI
*   **Architecture**: MVVM (Model-View-ViewModel)
*   **Data Source**: The app uses a local JSON data source (included in the project) containing character and episode information.

## Getting Started

### Prerequisites

*   Xcode (latest version recommended)
*   iOS 15.0 or later (or the minimum version your project targets)

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/miladroozban/BBQuotes.git
    ```
2.  **Open the project:**
    Navigate to the cloned directory and open `BBQuotes.xcodeproj` in Xcode.
3.  **Build and Run:**
    Select your target simulator or physical device and press `Cmd + R` to build and run the app.

## Project Structure

A high-level overview of the main directories and files:

*   `BBQuotes/`: Contains the main application source code.
    *   **Models**: Defines the data structures for `Character` and `Episode`.
    *   **ViewModels**: Handles the business logic and data fetching for the views.
    *   **Views**: Contains the SwiftUI views for the main interface.
        *   `CharacterView`: Displays a random character with details.
        *   `EpisodeView`: Displays a random episode with details.
*   `Resources/`: Holds static assets like images and the local JSON database.
*   `BBQuotes.xcodeproj`: The Xcode project file.

## Future Improvements

Here are some potential areas for future development:

*   [ ] Networking: Replace the local JSON with a live API for up-to-date quotes and data.
*   [ ] Search: Add functionality to search for specific characters or episodes.
*   [ ] Favorites: Allow users to save their favorite quotes or characters.
*   [ ] Sharing: Add a share button to easily share quotes with others.

## Acknowledgements

*   Data and inspiration from the TV series **Breaking Bad**.
*   Built with ❤️ using Swift and SwiftUI.

---
**Developed by Milad Roozban**
