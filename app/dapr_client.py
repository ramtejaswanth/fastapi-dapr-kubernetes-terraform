import aiohttp
import json

DAPR_STATE_URL = "http://localhost:3500/v1.0/state/statestore"

async def save_state(item_id: str, value: str):
    payload = [{
        "key": item_id,
        "value": value
    }]
    async with aiohttp.ClientSession() as session:
        async with session.post(DAPR_STATE_URL, json=payload) as resp:
            return await resp.text()

async def get_state(item_id: str):
    url = f"{DAPR_STATE_URL}/{item_id}"
    async with aiohttp.ClientSession() as session:
        async with session.get(url) as resp:
            if resp.status == 200:
                return await resp.text()
            return None

