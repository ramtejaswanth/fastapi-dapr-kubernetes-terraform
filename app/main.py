from fastapi import FastAPI, HTTPException
from app.models import Item
from app.dapr_client import save_state, get_state

app = FastAPI()

@app.post("/items/")
async def create_item(item: Item):
    await save_state(item.id, item.value)
    return {"message": f"Item '{item.id}' saved successfully."}

@app.get("/items/{item_id}")
async def read_item(item_id: str):
    value = await get_state(item_id)
    if value is None:
        raise HTTPException(status_code=404, detail="Item not found")
    return {"id": item_id, "value": value}

