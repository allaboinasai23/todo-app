document.addEventListener('DOMContentLoaded', () => {
    const taskInput = document.getElementById('taskInput');
    const addTaskBtn = document.getElementById('addTaskBtn');
    const taskList = document.getElementById('taskList');

    // Fetch initial tasks
    const fetchTasks = async () => {
        const res = await fetch('/api/tasks');
        const tasks = await res.json();
        renderTasks(tasks);
    };

    const renderTasks = (tasks) => {
        taskList.innerHTML = '';
        tasks.forEach(task => {
            const li = document.createElement('li');
            li.className = `task-item ${task.completed ? 'completed' : ''}`;
            li.innerHTML = `
                <input type="checkbox" ${task.completed ? 'checked' : ''} onchange="toggleTask(${task.id}, this.checked)">
                <span class="task-text">${task.title}</span>
                <button class="delete-btn" onclick="deleteTask(${task.id})">×</button>
            `;
            taskList.appendChild(li);
        });
    };

    addTaskBtn.addEventListener('click', async () => {
        const title = taskInput.value.trim();
        if (!title) return;

        const res = await fetch('/api/tasks', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ title })
        });
        
        if (res.ok) {
            taskInput.value = '';
            fetchTasks();
        }
    });

    window.toggleTask = async (id, completed) => {
        await fetch(`/api/tasks/${id}`, {
            method: 'PUT',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ completed })
        });
        fetchTasks();
    };

    window.deleteTask = async (id) => {
        await fetch(`/api/tasks/${id}`, {
            method: 'DELETE'
        });
        fetchTasks();
    };

    fetchTasks();
});
