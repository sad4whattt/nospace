// Task Manager with Multiple Bugs

interface Task {
    id: number;
    title: string;
    completed: boolean;
    priority: string;
    dueDate: Date;
}

class TaskManager {
    private tasks: Task[];
    
    constructor() {
        this.tasks = [];
    }
    
    // Problem: Parameter types not specified
    addTask(title, priority, dueDate) {
        const task: Task = {
            id: this.generateId(),
            title: title,
            completed: false,
            priority: priority,
            dueDate: new Date(dueDate)
        };
        
        this.tasks.push(task);
        return task;
    }
    
    // Problem: Return type should be Task | undefined
    getTaskById(id: number): Task {
        return this.tasks.find(task => task.id === id);
    }
    
    // Problem: Comparing objects directly instead of properties
    removeTask(taskToRemove: Task): boolean {
        const index = this.tasks.indexOf(taskToRemove);
        if (index > -1) {
            this.tasks.splice(index, 1);
            return true;
        }
        return false;
    }
    
    // Problem: Async function not properly handling promises
    async loadTasksFromAPI(): Promise<Task[]> {
        const response = fetch('https://api.example.com/tasks');  // Problem: Missing await
        const data = response.json();  // Problem: Missing await
        return data;
    }
    
    // Problem: Array method used incorrectly
    calculateCompletionRate(): number {
        const completed = this.tasks.filter(task => task.completed);
        return completed.length / this.tasks.length * 100;  // Problem: No check for empty array
    }
    
    // Problem: Infinite loop potential
    private generateId(): number {
        let id = Math.floor(Math.random() * 1000);
        while (this.tasks.find(task => task.id === id)) {
            id = Math.floor(Math.random() * 1000);  // Problem: Could loop forever
        }
        return id;
    }
    
    // Problem: Mutating array during iteration
    removeCompletedTasks(): void {
        for (let i = 0; i < this.tasks.length; i++) {
            if (this.tasks[i].completed) {
                this.tasks.splice(i, 1);  // Problem: Modifies array during iteration
            }
        }
    }
    
    // Problem: String comparison case sensitivity
    getTasksByPriority(priority: string): Task[] {
        return this.tasks.filter(task => task.priority === priority);
    }
}

// Problem: Interface property marked as optional but used as required
interface User {
    name: string;
    email?: string;
    tasks: Task[];
}

// Problem: Function parameter destructuring without type annotation
function createUser({name, email, tasks}) {
    const user: User = {
        name: name,
        email: email,
        tasks: tasks
    };
    return user;
}

// Problem: Type assertion without proper type checking
function processTaskData(data: any): Task[] {
    return data as Task[];  // Problem: Unsafe type assertion
}

// Problem: Promise not handled properly
async function initializeApp() {
    const taskManager = new TaskManager();
    
    // Problem: Not awaiting async function
    const tasks = taskManager.loadTasksFromAPI();
    console.log(tasks);  // Problem: Will log Promise object, not actual data
    
    // Problem: Potential null reference
    const firstTask = taskManager.getTaskById(1);
    console.log(firstTask.title);  // Problem: firstTask might be undefined
    
    // Problem: Wrong argument types
    taskManager.addTask(123, "high", "not-a-date");  // Problem: Wrong types
    
    // Problem: Division by zero not handled
    const rate = taskManager.calculateCompletionRate();
    console.log(`Completion rate: ${rate}%`);
}

// Problem: Event listener callback not properly typed
document.addEventListener('DOMContentLoaded', function(event) {
    const button = document.getElementById('addTask');
    button.addEventListener('click', (e) => {  // Problem: button might be null
        const input = document.getElementById('taskInput') as HTMLInputElement;
        const value = input.value;  // Problem: input might be null
        
        // Problem: Creating task with wrong data types
        const taskManager = new TaskManager();
        taskManager.addTask(value, null, undefined);
    });
});

// Problem: Enum-like object without proper typing
const Priority = {
    LOW: 'low',
    MEDIUM: 'medium',
    HIGH: 'high'
};

// Problem: Function tries to modify readonly property
function updateTaskTitle(task: Readonly<Task>, newTitle: string) {
    task.title = newTitle;  // Problem: Attempting to modify readonly property
}

// Problem: Generic type constraint not properly used
function cloneTask<T extends Task>(task: T): T {
    return Object.assign({}, task);  // Problem: Shallow copy, Date objects not properly cloned
}

// Problem: Export/import issues
export { TaskManager, Task };  // Problem: Can't export interface this way
export default TaskManager;  // Problem: Already exported above

// Run the buggy app
initializeApp();