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

def get_items_game():
    if len(sys.argv) > 2:
        print(f"Usage: {Path(sys.argv[0]).name} [items_game.txt]")
        sys.exit(1)

    if len(sys.argv) == 2:
        path = Path(sys.argv[1])
    else:
        path = DEFAULT_ITEMS_GAME

    if not path.exists():
        print(f"ERROR: {path} not found")
        sys.exit(1)

    return path

def main():
    items_game = get_items_game()

    print(f"Loading: {items_game}")

    with items_game.open("r", encoding="utf-8", errors="ignore") as f:
        data = vdf.load(f)

    items = data["items_game"]["items"]

    output = {
        "item_count": 0,
        "items": {}
    }

    for itemdef, item in items.items():
        if itemdef == "default":
            continue

        output["items"][itemdef] = {
            "name": item.get("name"),
            "prefab": item.get("prefab"),
            "baseitem": item.get("baseitem") == "1"
        }

    output["item_count"] = len(output["items"])

    output_file = Path(__file__).parent.parent / "data" / "items.json"
    output_file.parent.mkdir(parents=True, exist_ok=True)

    import json

    with output_file.open("w", encoding="utf-8") as f:
        sorted_items = {}

        for itemdef in sorted(items.keys(), key=int):
            if itemdef == "default":
                continue

            item = items[itemdef]

            sorted_items[itemdef] = {
                "name": item.get("name"),
                "prefab": item.get("prefab"),
                "baseitem": item.get("baseitem") == "1"
            }

        output = {
            "item_count": len(sorted_items),
            "items": sorted_items
        }

    print(f"Wrote {output['item_count']} items.")
    print(f"Output: {output_file}")

if __name__ == "__main__":
    main()

