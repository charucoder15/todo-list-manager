#!/bin/bash

FILE="tasks.txt"

# file create if not exists
touch $FILE

while true
do
    echo "-----------------------------"
    echo "      TO-DO LIST MANAGER     "
    echo "-----------------------------"
    echo "1. Add Task"
    echo "2. View Tasks"
    echo "3. Delete Task"
    echo "4. Mark Task as Done"
    echo "5. Exit"
    echo "-----------------------------"
    read -p "Enter your choice: " choice

    case $choice in

    1)
        read -p "Enter task: " task
        echo "[ ] $task" >> $FILE
        echo "Task added!"
        ;;

    2)
        echo "Your Tasks:"
        nl -w2 -s'. ' $FILE
        ;;

    3)
        nl -w2 -s'. ' $FILE
        read -p "Enter task number to delete: " num
        sed -i "${num}d" $FILE
        echo "Task deleted!"
        ;;

    4)
        nl -w2 -s'. ' $FILE
        read -p "Enter task number to mark done: " num
        sed -i "${num}s/\[ \]/[✔]/" $FILE
        echo "Task marked as done!"
        ;;

    5)
        echo "Exiting..."
        break
        ;;

    *)
        echo "Invalid choice!"
        ;;

    esac
done