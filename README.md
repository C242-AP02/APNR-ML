# Machine Learning Server for APNR (Automatic Plate Number Recognition)

This repository contains a Flask-based server that provides an endpoint for Automatic Plate Number Recognition (APNR). The server accepts an image file via a `POST` request and returns the recognized plate number along with the region and an annotated image.

## Features
- **Endpoint**: `/predict`
- **Method**: `POST`
- **Input**:
  - **Key**: `file`
  - **Type**: Image file (uploaded via `multipart/form-data`)
- **Output**: JSON response containing:
  - `annotated_image`: Base64-encoded string of the annotated image.
  - `plate_number`: The recognized license plate number.
  - `region`: The region where the plate number was recognized.

Example: 
```json
{
    "plates": [
        {
            "annotated_image": <Base64 Image>,
            "plate_number": "AA 8814 PB",
            "region": "Kabupaten Magelang"
        }
    ]
}
```

## Requirements
To run the server, you'll need to have the following:

- Python 3.11

## Installation and Setup

Follow these steps to set up the server on your local machine.

### 1. Clone the repository

Start by cloning the repository to your local machine:

```bash
git clone https://github.com/C242-AP02/APNR-ML.git
cd APNR-ML
```

### 2. Downloading the models
> **Note**: If you are using Docker, skip this step, as the models will be automatically downloaded during the build process.


overwrite the following code in app.py
```python
trocr_model = VisionEncoderDecoderModel.from_pretrained("models/rayyaa/finetune-trocr")
trocr_processor = TrOCRProcessor.from_pretrained("models/rayyaa/finetune-trocr")
```
into
```python
trocr_model = VisionEncoderDecoderModel.from_pretrained("/rayyaa/finetune-trocr")
trocr_processor = TrOCRProcessor.from_pretrained("/rayyaa/finetune-trocr")
```

### 3. Install dependencies
```bash
pip install -r requirements.txt
```

### 4. Running the Server
```bash
python app.py
```
The server will start on port 8080




