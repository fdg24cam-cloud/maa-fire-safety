# MAA Fire Safety Checks – Synced / Editable version

This version adds:

- Supabase-backed shared progress between iPhone and desktop
- Shared completed inspection history
- Shared reference photos for every inspection item
- Add new extinguishers, lights, locks, fire doors and final exits
- Correct item names, IDs, type and order
- Deactivate old items without losing history
- Delete newly-added items only when they have never been used
- Original MAA Word forms retained for original items
- New items are appended to the generated PDF on an **Additional inspection items** page
- Existing extinguisher reference photos remain built into the app

## One-time Supabase setup

1. Create a free Supabase project.
2. Open **SQL Editor** in Supabase.
3. Open `supabase_schema.sql` from this package, paste the complete contents into a new query and click **Run**.
4. In Supabase go to **Project Settings → API** and copy:
   - Project URL
   - `service_role` key (keep this secret; never put it in browser code or GitHub)
5. In Render open the existing `maa-fire-safety` service → **Environment** and add:
   - `SUPABASE_URL` = your Project URL
   - `SUPABASE_SERVICE_ROLE_KEY` = your service_role key
   - `APP_ADMIN_PIN` = a PIN of your choice for the **Manage items** screen
   - optional: `SUPABASE_PHOTO_BUCKET` = `inspection-photos`
6. Save the environment variables and redeploy.
7. Open `/health` on your Render URL. It should report `"mode":"supabase"`.

The first app request after Supabase is configured automatically imports the five official inspection lists from the Word templates into the new database.

## Important security note

`SUPABASE_SERVICE_ROLE_KEY` belongs only in Render Environment Variables. Do not commit it to GitHub and do not paste it into `index.html`, `app.py`, or any public file.

The `APP_ADMIN_PIN` protects adding/editing/deactivating inspection items. Inspection use itself remains deliberately simple for on-site use. If the app will be used by a wider group, add full user authentication before sharing the URL broadly.

## Updating the existing GitHub / Render deployment

Replace the contents of the existing `MAA_Fire_Safety_PWA` folder in GitHub with this package, commit the changes, then let Render auto-deploy. Keep the Render **Root Directory** as `MAA_Fire_Safety_PWA`.
