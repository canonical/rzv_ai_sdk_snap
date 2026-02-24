# RZ/V AI SDK Snap

A snap package containing selected AI application examples from the
[Renesas RZ/V AI SDK](https://github.com/renesas-rz/rzv_ai_sdk), built for
the Renesas RZ/V2L platform.

## Overview

This repository provides the build configuration to package RZ/V AI SDK
examples as a [snap](https://snapcraft.io/). The snap is cross-compiled for
`arm64` (AArch64) and targets devices running Ubuntu on the Renesas RZ/V2L
SoC. The DRP-AI TVM runtime is sourced from
[renesas-rz/rzv_drp-ai_tvm](https://github.com/renesas-rz/rzv_drp-ai_tvm).

## Included Applications

| Snap command | Application | Description |
|---|---|---|
| `rzv-ai-sdk-collection.object-tracker` | Q01 Footfall Counter | Counts people passing through a scene using object tracking |
| `rzv-ai-sdk-collection.face-recognition` | Q02 Face Authentication | Detects and authenticates faces |
| `rzv-ai-sdk-collection.fish-classification` | Q04 Fish Classification | Classifies fish species from camera input |
| `rzv-ai-sdk-collection.suspicious-activity` | Q05 Suspicious Activity Detection | Detects suspicious activities in a scene |
| `rzv-ai-sdk-collection.expiry-date-extraction` | Q06 Expiry Date Extraction | Extracts expiry dates from product images using OCR |
| `rzv-ai-sdk-collection.plant-leaf-disease-classify` | Q07 Plant Leaf Disease Classification | Classifies diseases on plant leaves |
| `rzv-ai-sdk-collection.object-counter` | Q08 Object Counter | Counts objects in a scene |
| `rzv-ai-sdk-collection.crack-segmentation` | Q09 Crack Segmentation | Segments and detects cracks in surfaces |
| `rzv-ai-sdk-collection.suspicious-person-detector` | Q10 Suspicious Person Detection | Detects suspicious persons in a scene |
| `rzv-ai-sdk-collection.fish-detector` | Q11 Fish Detection | Detects fish in camera input |
| `rzv-ai-sdk-collection.object-detection` | R01 Object Detection | General-purpose object detection |

## Requirements

- Renesas RZ/V2L board running Ubuntu (noble / 24.04)
- Camera connected to the board
- Wayland compositor

## Building

The snap is built with [Snapcraft](https://snapcraft.io/docs/snapcraft-overview)
and cross-compiled from an `amd64` or `arm64` host:

```bash
snapcraft --build-for arm64
```

> **Note:** The snap is currently set to `grade: devel` and `confinement: devmode`.

## Installation

Install the locally built snap with:

```bash
sudo snap install --devmode rzv-ai-sdk-collection_*.snap
```

## Usage

Run any of the included applications using its snap command. For example:

```bash
rzv-ai-sdk-collection.object-detection
```

All applications require access to a camera, an OpenGL-capable GPU, and a
Wayland display server.

## License

This project is licensed under the GNU General Public License v3.0 — see the
[LICENSE](LICENSE) file for details.

The upstream AI SDK source code is provided by Renesas Electronics Corporation
and is subject to its own licensing terms. Refer to the
[renesas-rz/rzv_ai_sdk](https://github.com/renesas-rz/rzv_ai_sdk) repository
for details.
