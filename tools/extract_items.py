#!/usr/bin/env python3

import json
import sys
from pathlib import Path

try:
    import vdf
except ImportError:
    print("ERROR: Python package 'vdf' is not installed.")
    print()
    print("Example:")
    print()
    print("    python3 -m venv venv")
    print("    source venv/bin/activate")
    print("    pip install vdf")
    sys.exit(1)

DEFAULT_ITEMS_GAME = Path("/srv/tf2/tf/scripts/items/items_game.txt")
OUTPUT_JSON = Path(__file__).parent.parent / "data" / "items.json"


def get_items_game():
    if len(sys.argv) > 2:
        print(f"Usage: {Path(sys.argv[0]).name} [items_game.txt]")
        sys.exit(1)

    path = Path(sys.argv[1]) if len(sys.argv) == 2 else DEFAULT_ITEMS_GAME

    if not path.exists():
        print(f"ERROR: {path} not found")
        sys.exit(1)

    return path


def load_schema(items_game):
    print(f"Loading: {items_game}")

    with items_game.open("r", encoding="utf-8", errors="ignore") as f:
        return vdf.load(f)


def extract_items(schema):
    items = schema["items_game"]["items"]

    output = {}

    itemdefs = sorted(
        (itemdef for itemdef in items if itemdef != "default"),
        key=int
    )

    for itemdef in itemdefs:
        item = items[itemdef]

        output[itemdef] = {
            "name": item.get("name"),
            "item_name": item.get("item_name"),
            "prefab": item.get("prefab"),
            "baseitem": item.get("baseitem") == "1"
        }

    return {
        "item_count": len(output),
        "items": output
    }


def write_json(data):
    OUTPUT_JSON.parent.mkdir(parents=True, exist_ok=True)

    with OUTPUT_JSON.open("w", encoding="utf-8") as f:
        json.dump(data, f, indent=4)

    print(f"Wrote {data['item_count']} items.")
    print(f"Output: {OUTPUT_JSON}")


def main():
    items_game = get_items_game()
    schema = load_schema(items_game)
    data = extract_items(schema)
    write_json(data)


if __name__ == "__main__":
    main()
