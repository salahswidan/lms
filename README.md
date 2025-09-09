# LMS - Learning Management System  demo : https://drive.google.com/file/d/1oyBeXvmf1AiyRLW_6Wm16Trk_GMM65av/view?usp=drive_link


A feature-rich Learning Management System (LMS) application built with Flutter. This project demonstrates a clean architecture approach, utilizing modern Flutter practices for building a scalable and maintainable mobile application.

## Features

-   **Onboarding:** A smooth, multi-step onboarding experience for new users.
-   **Authentication:** Simple and clean user authentication screens for login and sign-up.
-   **Course Management:**
    -   View enrolled courses with progress tracking.
    -   Detailed course view with modules, lesson lists, and descriptions.
    -   Play video lessons by launching external video URLs.
-   **Course Discovery:**
    -   **Explore:** Browse courses by categories like Development, Design, and Marketing.
    -   **Search:** Find courses with a dedicated search page and view recent search history.
-   **E-commerce Functionality:**
    -   **Shopping Cart:** Add desired courses to a cart.
    -   **Checkout:** A complete checkout process with the ability to apply coupon codes.
    -   **Payment:** A flexible payment screen supporting Mobile Wallet and Credit Card (Visa/MasterCard) options.
-   **User Profile:** A screen displaying user information and learning statistics.

## Tech Stack & Architecture

This project is built with a focus on code quality, scalability, and separation of concerns.

-   **Framework:** Flutter
-   **State Management:** [flutter_bloc](https://pub.dev/packages/flutter_bloc) for predictable state management.
-   **Navigation:** [go_router](https://pub.dev/packages/go_router) for a declarative, URL-based routing solution.
-   **Service Location:** [get_it](https://pub.dev/packages/get_it) for dependency injection.
-   **Icons:** [phosphor_flutter](https://pub.dev/packages/phosphor_flutter) for a clean and modern icon set.
-   **Architecture:** The application follows a feature-first architecture. Code is organized into features (e.g., `auth`, `courses`, `home`), with each feature containing its own `data`, `domain`, and `presentation` layers.
    -   `lib/core`: Contains shared application logic, including constants, theme, services, and shared cubits.
    -   `lib/features`: Each subdirectory represents a distinct feature of the application.
    -   `assets/`: Includes static assets like images and a `courses.json` file which serves as a local data source for course information.
 

      <img width="508" height="1079" alt="لقطة شاشة 2025-09-09 211712" src="https://github.com/user-attachments/assets/ed100262-b084-4463-b862-cd8a8fd1c3b8" />
      <img width="511" height="1079" alt="لقطة شاشة 2025-09-09 211954" src="https://github.com/user-attachments/assets/afecd07e-89cd-4a2d-966e-2fcbdab6b504" />
      <img width="512" height="1079" alt="لقطة شاشة 2025-09-09 212238" src="https://github.com/user-attachments/assets/948648f5-c512-4fbc-82cd-2d8623b150f1" />
      <img width="507" height="1079" alt="لقطة شاشة 2025-09-09 212034" src="https://github.com/user-attachments/assets/0b88aaba-b941-42c3-99b8-abba9ace9d21" />
      <img width="507" height="1071" alt="لقطة شاشة 2025-09-09 212104" src="https://github.com/user-attachments/assets/698308ff-a835-404f-87b5-535b7c2f71a6" />
      <img width="512" height="1079" alt="لقطة شاشة 2025-09-09 212325" src="https://github.com/user-attachments/assets/490a5a23-a0d9-4dc8-b5df-85d9fdf8a966" />
      <img width="515" height="1079" alt="لقطة شاشة 2025-09-09 212411" src="https://github.com/user-attachments/assets/b85e0af0-b6e5-4088-8168-519c2c12a292" />
      <img width="511" height="1079" alt="لقطة شاشة 2025-09-09 212455" src="https://github.com/user-attachments/assets/a8e28656-47b3-4a8b-9bf6-914b86ab7db9" />
      <img width="510" height="1079" alt="لقطة شاشة 2025-09-09 212859" src="https://github.com/user-attachments/assets/4bcc44ad-3237-4bfb-b8a7-06998780f794" />





 



      

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

Ensure you have the Flutter SDK installed on your machine. For installation instructions, refer to the [official Flutter documentation](https://flutter.dev/docs/get-started/install).

### Installation

1.  **Clone the repository:**
    ```sh

    git clone https://github.com/salahswidan/lms.git
    ```

2.  **Navigate to the project
 directory:**
    ```sh
    cd lms
    ```

3.  **Install dependencies:**

    ```sh
    flutter pub get
    ```

4.  **Run the application:**
    ```sh
    flutter run
