# PlantUML image generator

This simple project aims to simplify the way we generate images (PNG or SVG) from PlantUML files locally.

It already has support for creating images using C4 + PlantUML structure.

Requirements:
- Docker;
- Make;

## How to use

We use Makefile to simplify how we generate images. Here's the current targets:

```bash
# Build
build_image:    Build Docker image for neo-plantuml


# Image generation
export_png:     Export diagrams as PNG. Target folder: diagrams/outputs 
export_svg:     Export diagrams as SVG. Target folder: diagrams/outputs 
export_images:  Export diagrams as both PNG and SVG. Target folder: diagrams/outputs
```

Steps:

1. Create a `diagrams` folder in the root directory.
2. Add your plantuml file to `diagrams`;
3. Build project image using `make build_image`;
4. Use Makefile targets to create your images. Ex: `make export_png`;

The final structure will look something like this:

```bash
~$ tree
.
├── diagrams
│   └── ... your diagram .puml files
├── outputs
│   └── ... your diagram images as png or svg
├── Dockerfile
├── Makefile
└── README.md
```

You can edit or make any changes you deem necessary to your workflow.
