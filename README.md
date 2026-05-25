# RZ/V AI SDK Snap

A snap package containing selected AI application examples from the
[Renesas RZ/V AI SDK](https://github.com/renesas-rz/rzv_ai_sdk), built for
the Renesas RZ/V2L platform.

## Overview

This repository provides the build configuration to package RZ/V AI SDK
examples as a [snap](https://snapcraft.io/). The snap is compiled/cross-compiled for
`arm64` (AArch64) and targets devices running Ubuntu on the Renesas RZ/V2L
SoC. The DRP-AI TVM runtime is sourced from
[renesas-rz/rzv_drp-ai_tvm](https://github.com/renesas-rz/rzv_drp-ai_tvm).

## Included Applications

| Snap command | Application | Description |
|---|---|---|
| `rzv-ai-sdk-collection.object-detection` | R01 Object Detection | General-purpose object detection |
| `rzv-ai-sdk-collection.object-tracker MIPI` | Q01 Footfall Counter | Counts people passing through a scene using object tracking |
| `rzv-ai-sdk-collection.object-counter <COCO\|animal\|vehicle> MIPI` | Q08 Object Counter | Counts objects in a scene |

## Requirements

- Renesas RZ/V2L board running Ubuntu (noble / 24.04)
- Camera connected to the board

## Building

The snap is built with [Snapcraft](https://snapcraft.io/docs/snapcraft-overview)
and compiled/cross-compiled from an `amd64` or `arm64` host:

```bash
snapcraft pack
```

> **Note:** The snap is currently set to `grade: devel` and `confinement: devmode`.

## Running the AI Snap Demo

For demonstration purposes, a sample snap is provided that contains three applications from the Renesas AI SDK: object-tracker, object-counter, and object-detection.

Follow these steps to deploy and test the sample snap on your device:

### Step 1: Install and Run Ubuntu Frame

On the RZ/V2L board, install Ubuntu Frame, which serves as a reliable and secure display server for embedded Linux devices.

```bash
$ sudo snap install ubuntu-frame --channel=24/stable
```

Next, run Ubuntu Frame on the device. You will notice the Ubuntu Frame interface displayed on your HDMI-connected monitor.

```bash
$ ubuntu-frame &
```

### Step 2: Install Required Snaps

If not already installed, install the rz-gpu-snap-core24 snap to enable the GPU capabilities (Mali drivers) on the board.

```bash
$ sudo snap install --devmode rz-gpu-snap-core24_50p0+20250903_arm64.snap
```

Then, install the AI SDK collection snap:

```bash
$ sudo snap install --devmode rzv-ai-sdk-collection_1.0_arm64.snap
```

### Step 3: Connect Interfaces

Create a connection between the Ubuntu Frame, the newly installed AI snap, and the GPU snap so they can access the necessary hardware capabilities:

```bash
$ sudo snap connect ubuntu-frame:gpu-2404 rz-gpu-snap-core24
$ sudo snap connect rzv-ai-sdk-collection:gpu-2404 rz-gpu-snap-core24
```

## Installation

Install the locally built snap with:

```bash
sudo snap install --devmode rzv-ai-sdk-collection_1.0_arm64.snap
```

## Usage

Run any of the included applications using its snap command. For example:

```bash
rzv-ai-sdk-collection.object-detection
```

To run the object tracker with MIPI camera support:

```bash
rzv-ai-sdk-collection.object-tracker MIPI
```

To run the object counter with a specific model (COCO, animal, or vehicle) and MIPI camera support:

```bash
rzv-ai-sdk-collection.object-counter COCO MIPI
```

## License

This project is licensed under the GNU General Public License v3.0 — see the
[LICENSE](LICENSE) file for details.

The upstream AI SDK source code is provided by Renesas Electronics Corporation
and is subject to its own licensing terms. Refer to the
[renesas-rz/rzv_ai_sdk](https://github.com/renesas-rz/rzv_ai_sdk) repository
for details.
