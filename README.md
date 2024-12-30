# Flutter_ai_chatbot

An intelligent chatbot built using advanced AI models and Flutter for a seamless user experience that allows users to interact with a chat interface and provide feedback through a draggable slider.

- **Backend:** Python, Flask, Transformers
- **Frontend:** Flutter
- **Features:** Real-time chat, feedback system, and more.

用Flutter設計的聊天機器人app

裡面有兩個檔案app.py及LLM_test.py，
app.py是後端，
LLM_test.py是給你測試模型用的。

[Repository Link](https://github.com/Chunfu927/Flutter_ai_chatbot)

## Usage Guidelines

- **Chat Screen:** Users can send messages and view the conversation history.
- **Feedback Screen:** Users can adjust a slider to provide feedback and submit it to the backend.

## Project Structure

```
Flutter_ai_chatbot
├── lib
│   ├── main.dart                # Entry point of the Flutter application
│   ├── screens
│   │   ├── chat_screen.dart     # Chat interface for user interactions
│   │   └── feedback_screen.dart  # Feedback submission interface
├── pubspec.yaml                 # Flutter project configuration
├── README.md                    # Project documentation
└── backend
    └── app.py                   # Backend logic and API endpoints
```

### presentation：

https://github.com/user-attachments/assets/cfe5e4a1-2d88-41fa-8325-4cd88d99c278

## Setup Instructions

1. **Clone the repository:**

   ```
   git clone https://github.com/Chunfu927/Flutter_ai_chatbot
   cd ai_chatbot
   ```

2. **Install Flutter dependencies:**

   ```
   flutter pub get
   ```

3. **Run the backend server:**
   Navigate to the `backend` directory and run:

   ```
   python app.py
   ```

4. **Run the Flutter application:**
   In the root directory of the project, execute:
   ```
   flutter run
   ```

## Contributing

Feel free to submit issues or pull requests for improvements and bug fixes. I appreciate all contributions and feedback!

## License

This project is licensed under the MIT License.

