# MAA Fire Safety Checks – Final release 8.0

Final production version for the Museum of Archaeology and Anthropology fire-safety inspection workflow.

## Included

- Supabase synchronization between iPhone and desktop
- Fire extinguishers, fire doors, electronic locks, emergency lighting and final exits
- Editable inspection inventory with add/edit/deactivate/delete-safe rules
- Shared reference photos and inspection-specific evidence photos
- Floor grouping, item reordering and jump-to-location
- PASS / FAIL / ISSUE workflow with notes
- Official PDF generation from the existing forms
- Completed inspection history with PASS/FAIL/ISSUE counts
- Re-download of an official PDF from completed history
- Last-completed and next-due dates on the dashboard
- Compact iPhone dashboard and two-column desktop dashboard
- Admin lock/unlock indicator and PIN-protected management/backup
- Full JSON backup export
- PWA installable from Safari and desktop browsers

## Render environment variables

Required:

- `SUPABASE_URL`
- `SUPABASE_SERVICE_ROLE_KEY`

Recommended:

- `APP_ADMIN_PIN` – private 4–6 digit PIN

Optional:

- `SUPABASE_PHOTO_BUCKET=inspection-photos`

The extra `SUPABASE_SECRET_KEY` variable may remain in Render but is not read by this version.

## Deployment update

1. Open GitHub repository `maa-fire-safety`.
2. Open `MAA_Fire_Safety_PWA`.
3. Upload the **contents** of this folder there. Do not upload the outer folder and do not create a nested `MAA_Fire_Safety_PWA`.
4. Commit directly to `main` with message `MAA Fire Safety final release v8`.
5. Keep Render Root Directory as `MAA_Fire_Safety_PWA`.
6. Render should auto-deploy; otherwise use **Manual Deploy → Deploy latest commit**.
7. When Render shows **Live**, reopen the PWA. Cache version 8 forces the updated interface to replace the old cached version.

## Security

Keep the Supabase secret/server key only in Render Environment Variables. Never place it in GitHub, JavaScript, screenshots, or chat messages.
