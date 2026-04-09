
import SwiftUI

struct ContentView: View {
    
    @State private var tasks: [Task] = []
    
    @State private var newTaskTitle: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Поле для ввода новой задачи
                HStack {
                    TextField("Добавить новую задачу...", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.purple)
                        .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 1.4) // обводка
                            )
                    
                    Button(action: addTask) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                    .disabled(newTaskTitle.isEmpty) 
                }
                .padding()
                
                // Список задач
                List {
                    ForEach($tasks) { $task in
                        TaskRowView(task: $task)
                    }
                    .onDelete(perform: deleteTask) // Добавляем возможность удаления
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Мои задачи")
        }
    }
    
    private func addTask() {
        let trimmedTitle = newTaskTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTitle.isEmpty else { return } // Не добавляем пустые задачи
        
        let newTask = Task(title: trimmedTitle)
        tasks.append(newTask)
        newTaskTitle = "" // Очищаем поле ввода
    }
    
    private func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }


