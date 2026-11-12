from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(title="TaskFlow API - Projeto DevOps")
tasks_db = []

class Task(BaseModel):
    title: str
    done: bool = False

@app.get("/health")
def health_check():
    return {"status": "healthy", "version": "1.0.0"}

@app.get("/tasks")
def list_tasks():
    return {"tasks": tasks_db}


@app.post("/tasks", status_code=201)
def create_task(task: Task):
    new_task = {"id": len(tasks_db) + 1, "title": task.title, "done": task.done}
    tasks_db.append(new_task)
    return new_task
