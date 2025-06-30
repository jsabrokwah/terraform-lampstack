document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('todoForm');
    const taskInput = document.getElementById('taskInput');
    const todoList = document.getElementById('todoList');

    // Function to fetch todos
    function fetchTodos() {
        fetch('api/read.php')
            .then(response => response.json())
            .then(data => {
                todoList.innerHTML = '';
                data.forEach(todo => {
                    const li = document.createElement('li');
                    li.innerHTML = `
                        <span>${todo.task}</span>
                        <button class="edit" data-id="${todo.id}">Edit</button>
                        <button class="delete" data-id="${todo.id}">Delete</button>
                    `;
                    todoList.appendChild(li);
                });
            });
    }

    // Initial fetch
    fetchTodos();

    // Form submission
    form.addEventListener('submit', function(e) {
        e.preventDefault();
        const task = taskInput.value;

        fetch('api/create.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ task: task })
        })
        .then(response => response.json())
        .then(data => {
            fetchTodos();
            taskInput.value = '';
        });
    });

    // Delete todo
    todoList.addEventListener('click', function(e) {
        if (e.target.classList.contains('delete')) {
            const id = e.target.dataset.id;

            fetch('api/delete.php', {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ id: id })
            })
            .then(response => response.json())
            .then(data => {
                fetchTodos();
            });
        }
    });
});
