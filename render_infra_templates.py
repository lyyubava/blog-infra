from argparse import ArgumentParser
from jinja2 import FileSystemLoader, Environment
import os
from typing import List

parser = ArgumentParser()
parser.add_argument("--state_bucket", type=str, help="State bucket name")
parser.add_argument("--infra_dir", type=str, help="Directory to render templates in")
args = parser.parse_known_args()
environment = Environment(loader=FileSystemLoader("."))

def get_all_templates(template_directory: str) -> List:
    templates = []
    for directory, _, files in os.walk(template_directory):
        for file in files:
            if file.endswith(".j2"):
                template = os.path.join(directory, file)
                templates.append(template)
    return templates
    
def render_templates(args):
    print(args)
    templates = get_all_templates(args.infra_dir)
    for t in templates:
        template = environment.get_template(t)
        rendered_template = template.render(**{"bucket": args.state_bucket})
        rendered_template_path = t.replace(".j2", "")
        with open(rendered_template_path, "w") as f:
            f.write(rendered_template)

def main():
    render_templates(args)

if __name__ == "__main__":
    main()





    
