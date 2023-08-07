from fastapi import FastAPI
from mangum import Mangum
from starlette.requests import Request

app = FastAPI()


@app.get("/")
def root(request: Request):
    aws_event = request.scope.get("aws.event")
    return {"aws_event": aws_event}


handler = Mangum(app, lifespan="auto")
