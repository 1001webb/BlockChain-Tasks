// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract TasksContract {
    uint public taskCounter = 0;

    constructor () { // Is excecuted the first time to create this contract
        createTask("Primer tarea de ejemplo", "Hacer algo de tarea de ejemplo");
    }

    // Events get the values 
    event TaskCreated(  
        uint id,
        string title,
        string description,
        bool done,
        uint createdAt
    );

    event TaskToggleDone(uint id, bool done);

    struct Task {
        uint id;
        string title;
        string description;
        bool done;
        uint createdAt; // timestamp
    }
    mapping (uint => Task) public tasks; // list of tasks

    function createTask(string memory _title, string memory _description) public {
        taskCounter += 1;
        tasks[taskCounter] = Task(taskCounter, _title, _description, false, block.timestamp);
        emit TaskCreated(taskCounter, _title, _description, false, block.timestamp); // Send the events response to the 'contract log'
    }
    
    function toggleDone(uint _id) public {
        Task memory _task = tasks[_id];
        _task.done = !_task.done;
        tasks[_id] = _task; 
        emit TaskToggleDone(_id, _task.done);
    }
}