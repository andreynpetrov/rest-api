from fastapi import FastAPI
from mangum import Mangum
from starlette.requests import Request

app = FastAPI()


@app.get("/")
def root(request: Request):
    print(request.scope["aws.event"])
    return {"aws_event": request.scope["aws.event"]}


handler = Mangum(app, lifespan="auto")
