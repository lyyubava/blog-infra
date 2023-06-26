import os
from typing import List

def get_all_templates(path: str) -> List:
    templates = []
    for directory, _, files in os.walk(path):
        for file in files:
            if file.endswith(".j2"):
                template = os.path.join(directory, file)
                templates.append(template)
    return templates
    


if __name__ == "__main__":
    print(get_all_templates("infra"))