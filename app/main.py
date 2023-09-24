from fastapi import FastAPI
from mangum import Mangum
from starlette.endpoints import HTTPEndpoint
from starlette.requests import Request
from starlette.responses import JSONResponse
from starlette.routing import Route
import time


class Homepage(HTTPEndpoint):
    async def get(self, request: Request) -> JSONResponse:
        return JSONResponse({'hello': 'world'})


class User(HTTPEndpoint):
    async def get(self, request: Request) -> JSONResponse:
        username = request.path_params['username']
        return JSONResponse({'username': username})


class Time(HTTPEndpoint):
    async def get(self, request: Request) -> JSONResponse:
        return JSONResponse({'time': time.time()})


class Address(HTTPEndpoint):
    async def get(self, request: Request) -> JSONResponse:
        address = request.headers.get("X-Forwarded-For", "Unknown")
        return JSONResponse({'address': address})


routes = [
    Route("/", Homepage),
    Route("/users/{username:str}", User),
    Route("/time/", Time),
    Route("/address/", Address)
]

app = FastAPI(routes=routes)

handler = Mangum(app, lifespan="auto")
