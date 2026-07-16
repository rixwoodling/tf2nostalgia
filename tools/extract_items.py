#!/usr/bin/env python3

import re
import sys
from pathlib import Path

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

    item_count = 0

    with items_game.open("r", encoding="utf-8", errors="ignore") as f:
        for line in f:
            if re.match(r'^\s*"\d+"\s*$', line):
                item_count += 1

    print(f"Found {item_count} item definitions.")


if __name__ == "__main__":
    main()
