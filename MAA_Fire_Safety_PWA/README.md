# MAA Fire Safety Checks – iPhone PWA

This is the deployable iPhone/web version of the Museum of Archaeology and Anthropology fire-safety inspection app.

## What it does
- Fire Extinguishers — monthly
- Fire Doors — every six months
- Electronic Locks — monthly
- Emergency Lighting — monthly
- Final Exits — monthly
- Saves unfinished inspection progress in the phone/browser
- Keeps completed inspection history in the phone/browser
- Generates a PDF by filling the original Word template and converting it to PDF
- On iPhone, the **Share / Send PDF** button opens the normal iOS share sheet (Mail, Files, AirDrop, etc.)
- Can be installed from Safari with **Share → Add to Home Screen**

## Deploy on Render (recommended)
1. Create a GitHub repository and upload this whole folder.
2. Sign in to Render.com and choose **New → Blueprint** (or New Web Service).
3. Connect the repository. Render will detect `render.yaml` / `Dockerfile`.
4. Deploy.
5. Open the HTTPS address Render gives you in Safari on the iPhone.
6. Tap **Share → Add to Home Screen**.

The Docker image contains LibreOffice, so the server can preserve the existing Word-form layout when creating PDFs.

## Local test with Docker
```bash
docker build -t maa-fire-checks .
docker run --rm -p 8080:8080 maa-fire-checks
```
Open http://localhost:8080

## Important data note
Inspection history is stored in the browser on the device, not in the Render server database. Clearing Safari website data will remove that local history. The PDF itself should be saved or emailed after each completed inspection.
