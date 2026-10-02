# MAA Fire Safety Checks – Refined synced version 7.2

This version keeps the existing Supabase database and Render deployment and adds the requested refinements.

## New in 7.2

- Shared Supabase progress between iPhone and desktop
- Editable inspection items for extinguishers, emergency lighting, fire doors, electronic locks and final exits
- Reference-photo thumbnails in **Manage items**
- Replace/take a reference photo directly from **Manage items**
- Reorder inspection items with **↑ / ↓** controls
- Automatic floor grouping in the management screen
- **Jump to location** while carrying out an inspection
- Progress percentage and current check number
- Separate **evidence photos** for FAIL / ISSUE results; evidence belongs only to that inspection
- Completed history with PASS / FAIL / ISSUE counts and item-level details
- Evidence photos can be viewed from completed history
- Dashboard shows last completed date and next due date
- Admin-protected **Export backup** downloads all database records as JSON
- Added items continue to appear on an **Additional inspection items** page in the official PDF
- Fixed editing an official item so it remains marked as an official form item
- New service-worker cache version so the updated PWA replaces the previous cached interface

## Render environment variables

Required:

- `SUPABASE_URL` = Supabase project URL
- `SUPABASE_SERVICE_ROLE_KEY` = Supabase secret/server key

Recommended:

- `APP_ADMIN_PIN` = a private 4–6 digit PIN used for Manage Items and Export Backup

Optional:

- `SUPABASE_PHOTO_BUCKET` = `inspection-photos`

The existing `SUPABASE_SECRET_KEY` variable may remain in Render, but version 7.2 reads `SUPABASE_SERVICE_ROLE_KEY`.

## Supabase database

No new SQL migration is required for the 7.2 refinements. Evidence photos are stored in the existing private `inspection-photos` Storage bucket using the inspection ID and item ID.

If setting the project up from scratch, run `supabase_schema.sql` once in Supabase SQL Editor.

## Updating the existing GitHub / Render deployment

1. Open the repository `maa-fire-safety`.
2. Open the existing `MAA_Fire_Safety_PWA` folder.
3. Upload the **contents** of this package into that folder. Do not create another nested `MAA_Fire_Safety_PWA` folder.
4. Commit directly to `main` with a message such as `Refine inspection workflow and evidence photos`.
5. Render should auto-deploy. If not, use **Manual Deploy → Deploy latest commit**.
6. Keep Render **Root Directory** as `MAA_Fire_Safety_PWA`.
7. When Render shows **Live**, open the web app and press Refresh. The service worker cache has been bumped, so the new interface should take over automatically.

## Security note

Keep the Supabase server/secret key only in Render Environment Variables. Never paste it into GitHub or browser code.
