# Spec 003: Identity Provider (Login with Google)

## Goal

Implement a production-ready authentication system using Google OAuth2.
This serves as the foundation for user identity in the application.

## User Stories

- As a user, I want to click a "Sign in with Google" button so I don't have
  to remember a new password.
- As a user, I want to see my Google profile name and email once logged in
  so I know I am in the right account.
- As a user, I want to be able to sign out securely.
- As a developer, I want my session persisted in a database so I don't lose
  my login state on refresh.

## Technical Stack

- **Framework**: Next.js (App Router)
- **Authentication**: Auth.js (NextAuth v5)
- **Database**: SQLite
- **ORM**: Prisma
- **Styling**: Tailwind CSS

## Requirements

### 1. Initial Setup

- Initialize a Next.js project if not present.
- Install `next-auth`, `prisma`, and `@prisma/client`.
- Initialize Prisma with the SQLite provider.

### 2. Authentication Logic

- Configure `auth.ts` with the Google Provider.
- Create a `.env.example` file containing:
  - `AUTH_SECRET` (Generate via `npx auth secret`)
  - `AUTH_GOOGLE_ID`
  - `AUTH_GOOGLE_SECRET`
- Implement a Prisma Adapter for Auth.js to store user sessions in SQLite.

### 3. UI Components

- **Home Page (`/`)**:
  - If authenticated: Show "Welcome, [Name]" and a "Sign Out" button.
  - If guest: Show a "Sign in with Google" button.
- **Protected Profile (`/profile`)**:
  - Redirect to `/` if not authenticated.
  - Show user's Google avatar, name, and email.

## Manual Setup Required (Google Cloud)

To make this work, the user must:

1. Go to the [Google Cloud Console](https://console.cloud.google.com/).
2. Create a new Project.
3. Navigate to **APIs & Services > OAuth consent screen** and configure it for
   "External".
4. Navigate to **APIs & Services > Credentials > Create Credentials > OAuth
   client ID**.
5. Select **Web application**.
6. Add **Authorized redirect URIs**:
   - `http://localhost:3000/api/auth/callback/google`
7. Copy the **Client ID** and **Client Secret** into your `.env` file.

## Backlog Preview

- [x] Initialize Next.js and Prisma [passes: true]
- [x] Configure Auth.js with Google Provider [passes: true]
- [x] Create UI for Home and Profile pages [passes: true]
- [x] Verify end-to-end Login/Logout flow [passes: true]
