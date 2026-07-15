#!/usr/bin/env python3

import re
from pathlib import Path

ITEMS_GAME = Path("/srv/tf2/tf/scripts/items/items_game.txt")


def main():
    if not ITEMS_GAME.exists():
        print(f"ERROR: {ITEMS_GAME} not found")
        return

    item_count = 0

    with ITEMS_GAME.open("r", encoding="utf-8", errors="ignore") as f:
        for line in f:
            if re.match(r'^\s*"\d+"\s*$', line):
                item_count += 1

    print(f"Found {item_count} item definitions.")


if __name__ == "__main__":
    main()
