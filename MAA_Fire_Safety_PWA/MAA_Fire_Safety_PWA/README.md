# MAA Fire Safety Checks — iPhone PWA

Updated version using the five current MAA inspection documents as the official PDF templates.

## Tests
- Fire Extinguishers — monthly — 27 locations
- Fire Doors — every six months — 12 locations
- Electronic Locks — monthly — 8 locations
- Emergency Lighting — monthly — 24 locations
- Final Exits — monthly — 3 locations

## Reference photos
- The 27 fire-extinguisher reference photos were recovered from the images embedded in `Fire Extinguishers.docx` and are built into the app.
- The extinguisher PDF template was rebuilt with those same reference photos in a web/PDF-compatible format so they remain visible when Render generates the PDF.
- Every location in every test also supports `Take photo` and `Choose photo` on iPhone. A user photo overrides the built-in reference photo for that location on that device.

## Deploy on Render
Use Docker. If the repository contains this folder, set Root Directory to:

`MAA_Fire_Safety_PWA`

The Dockerfile is inside this folder. No environment variables are required.

After deployment, open the Render URL in Safari on iPhone and use Share → Add to Home Screen.
