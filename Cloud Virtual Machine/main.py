# A basic FastAPI file looks like this

from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello World"}

# This code defines your application, but it won’t run on itself if you call it with python directly. 
# To run it, you need a server program: Uvicorn. That will be your server.

# Run the First API App With Uvicorn

# uvicorn main:app --reload --port=XX (poner puerto)
