import SwiftUI

struct TaskRowView: View {

    @Binding var task: Task
    
    var body: some View {
        HStack {
            Button(action: {
                toggleTaskCompletion()
            }) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .green : .gray)
                    .font(.title2)
            }
            .buttonStyle(PlainButtonStyle())
            
            Text(task.title)
                .strikethrough(task.isCompleted, color: .gray)
                .foregroundColor(task.isCompleted ? .gray : .primary)
            
            Spacer()
        }
        .padding(.vertical, 4)
    }
    
    private func toggleTaskCompletion() {
        task.isCompleted.toggle()
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskRowView(task: .constant(Task(title: "Пример задачи")))
    }
}
