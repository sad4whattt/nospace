// Task Manager with Multiple Bugs
// JAVASCRIPT!!!!!!!!
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
    addTask(title: string, priority: string, dueDate: string): Task | undefined {
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
    getTaskById(id: number): Task | undefined {
        return this.tasks.find(task => task.id === id);
    }
    removeTask(taskToRemove: Task): boolean {
        const index = this.tasks.findIndex(task => task.id === taskToRemove.id);
        if (index > -1) {
            this.tasks.splice(index, 1);
            return true;
        }
        return false;
    }
    async loadTasksFromAPI(): Promise<Task[]> {
        const response = await fetch('https://api.example.com/tasks');
        if (!response.ok) throw new Error("Failed to fetch");
        const data = await response.json();
        return data;
    }
    calculateCompletionRate(): number {
        const completed = this.tasks.filter(task => task.completed);
        if (this.tasks.length === 0) return 0;
        return completed.length / this.tasks.length * 100;
    }
    private generateId(): number {
        let id = Math.floor(Math.random() * 1000);
        let attempt = 0;
        while (this.tasks.some(task => task.id === id) && attempt++ < 100) {
            id = Math.floor(Math.random() * 1000);
        }
        return id;
    }
    removeCompletedTasks(): void {
        this.tasks = this.tasks.filter(task => !task.completed);
    }
    getTasksByPriority(priority: string): Task[] {
        return this.tasks.filter(task => task.priority.toLowerCase() === priority.toLowerCase());
    }
}

interface User {
    name: string;
    email?: string;
    tasks: Task[];
}

function createUser({name, email, tasks}: {name: string, email?: string, tasks: Task[]}): User {
    const user: User = {
        name: name,
        email: email,
        tasks: tasks
    };
    return user;
}

function processTaskData(data: any): Task[] {
    if (Array.isArray(data)) {
        return data.map(task => Object.assign({}, task));
    }
    throw new Error('Invalid data format');
}

async function initializeApp() {
    const taskManager = new TaskManager();
    try {
        const tasks = await taskManager.loadTasksFromAPI();
        console.log(tasks);
        const firstTask = tasks[0];
        console.log(firstTask.title);
        const newTask = taskManager.addTask('Test Task', 'low', '2022-12-31');
        const rate = taskManager.calculateCompletionRate();
        console.log(`Completion rate: ${rate}%`);
    } catch (error) {
        console.error(error);
    }
}

document.addEventListener('DOMContentLoaded', (event) => {
    const button = document.getElementById('addTask');
    const input = document.getElementById('taskInput') as HTMLInputElement;
    button.addEventListener('click', (e) => {
        const value = input.value;
        const taskManager = new TaskManager();
        const newTask = taskManager.addTask(value, 'low', '2022-12-31');
        if (!newTask) {
            alert('Failed to add task');
        }
    });
});

type Priority = 'low' | 'medium' | 'high';

function updateTaskTitle(task: Task, newTitle: string): void {
    task.title = newTitle;
}

function cloneTask<T extends Task>(task: T): T {
    return Object.assign({}, task);
}

export { TaskManager, Task };
export default TaskManager;

initializeApp();
