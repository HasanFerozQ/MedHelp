# Email setup: supportdesk@medihelp.live → medihelp28592@gmail.com

Use **only Gmail** for your inbox. Use **ImprovMX (free)** for forwarding `supportdesk@medihelp.live` — you already have ImprovMX MX records in Namecheap DNS.

---

## Part A — Receive mail at supportdesk@medihelp.live in Gmail (free)

### Step 1: ImprovMX account

1. Go to [https://improvmx.com](https://improvmx.com) and sign up (free).
2. Add domain: **medihelp.live**
3. ImprovMX will show DNS records. Your Namecheap DNS already has:
   - MX `@` → `mx1.improvmx.com` (priority 10)
   - MX `@` → `mx2.improvmx.com` (priority 20)
   - TXT `@` → `v=spf1 include:_spf.improvmx.com ~all`
4. In ImprovMX dashboard, click **Verify** / wait until domain shows as active.

### Step 2: Forward supportdesk → Gmail

1. In ImprovMX → **Aliases**
2. Add alias:
   - **Alias:** `supportdesk`
   - **Forward to:** `medihelp28592@gmail.com`
3. Save.

### Step 3: Test inbound mail

1. From another email account, send to **supportdesk@medihelp.live**
2. Check **medihelp28592@gmail.com** (and Spam) within a few minutes.

> Do **not** use Namecheap “Redirect Email” and ImprovMX at the same time. Your DNS uses ImprovMX MX records — configure forwarding only in ImprovMX.

---

## Part B — Reply as supportdesk@medihelp.live from Gmail (free)

### Step 1: Gmail App Password

1. Open [Google Account → Security](https://myaccount.google.com/security)
2. Turn on **2-Step Verification**
3. Search **App passwords** → Create → name it `MediHelp`
4. Copy the **16-character** password (no spaces when pasting into forms)

### Step 2: Gmail “Send mail as”

1. Gmail → **Settings** (gear) → **See all settings** → **Accounts and Import**
2. **Send mail as** → **Add another email address**
3. Name: `MediHelp Support`
4. Email: **supportdesk@medihelp.live**
5. Uncheck “Treat as alias” if you want replies to always show the support address
6. SMTP:
   - Server: `smtp.gmail.com`
   - Port: `587`
   - Username: **medihelp28592@gmail.com**
   - Password: **App password** from Step 1
   - TLS: Yes
7. Gmail sends a verification code to **supportdesk@medihelp.live**
8. Because of Part A forwarding, the code arrives in **medihelp28592@gmail.com** — paste it in Gmail

### Step 3: Test reply

1. Open a message that was sent to supportdesk@medihelp.live
2. Reply — choose **From: supportdesk@medihelp.live**

---

## Part C — Contact form → medihelp28592@gmail.com (website)

The contact form POSTs to `/api/feedback`. When configured, it:

1. Saves to Supabase `feedback_submissions`
2. Sends you an email via **Gmail SMTP**

### Vercel environment variables

Project → **Settings** → **Environment Variables** → add:

| Variable | Value |
|----------|--------|
| `FEEDBACK_SMTP_HOST` | `smtp.gmail.com` |
| `FEEDBACK_SMTP_PORT` | `587` |
| `FEEDBACK_SMTP_USER` | `medihelp28592@gmail.com` |
| `FEEDBACK_SMTP_PASS` | your 16-char Gmail app password |
| `FEEDBACK_TO_EMAIL` | `medihelp28592@gmail.com` |

Also ensure (for database backup):

| Variable | Value |
|----------|--------|
| `SUPABASE_URL` | your Supabase project URL |
| `SUPABASE_SERVICE_ROLE_KEY` | service role key from Supabase |

**Redeploy** the site after saving variables.

### Supabase: create feedback table

In Supabase → **SQL Editor**, run the file:

`supabase/migrations/20260609_feedback_admin_rpc.sql`

This creates `feedback_submissions` and the admin RPC to read messages in `/med-trivia-admin`.

---

## Part D — Read feedback in admin panel

1. Open [https://www.medihelp.live/med-trivia-admin](https://www.medihelp.live/med-trivia-admin)
2. Enter your **Trivia Admin Secret** (not saved — re-enter each visit)
3. Section **Contact & feedback inbox** lists all submissions

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| Contact form: table not found | Run `20260609_feedback_admin_rpc.sql` in Supabase SQL Editor |
| Contact form: no email | Add `FEEDBACK_SMTP_*` in Vercel and redeploy |
| supportdesk@ not arriving | Check ImprovMX alias + domain verified; wait up to 1 hour for DNS |
| Gmail “Send as” fails | Use App Password, not normal Gmail password |
| 550 bounce on supportdesk@ | MX must point to ImprovMX, not privateemail.com |
