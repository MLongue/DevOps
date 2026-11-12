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
