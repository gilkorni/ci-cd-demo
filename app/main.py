from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()


class Message(BaseModel):
    text: str


@app.get("/is_alive")
def is_alive():
    return {"status": "alive"}


@app.post("/echo")
def echo(msg: Message):
    return {"you_sent": msg.text}
