# Spec 001: Identity Provider (Login with Google)

## Goal

Implement a basic web application that allows users to authenticate using
Google OAuth2. This serves as the foundation for user management and secured
routes.

## Proposed Structure

```text
.
├── app/
│   ├── main.py         # FastAPI application entry point
│   ├── auth.py         # Authentication logic and OAuth2 setup
│   └── templates/      # HTML templates
│       ├── index.html  # Landing page with Login button
│       └── profile.html # User profile page (protected)
├── .env.example        # Environment variables template
└── requirements.txt    # Python dependencies
```

## Implementation Details

### 1. Web Server (FastAPI)

- Use FastAPI for the backend.
- Use Jinja2 for server-side rendering of templates.

### 2. Google OAuth2 Integration

- Use `authlib` or `fastapi-sso` to handle the Google OAuth2 flow.
- Requirements:
  - `GOOGLE_CLIENT_ID`
  - `GOOGLE_CLIENT_SECRET`
- The application should handle the callback and create a session for the
  user.

### 3. Routes

- `/`: Public landing page with a "Login with Google" button.
- `/login`: Redirects to Google's OAuth consent screen.
- `/auth/callback`: Handles the redirect from Google, validates the token,
  and sets a session cookie.
- `/profile`: Protected route. Displays user's name, email, and profile
  picture. Redirects to `/` if not authenticated.
- `/logout`: Clears the session cookie and redirects to `/`.

### 4. Dependencies

- `fastapi`
- `uvicorn`
- `python-multipart`
- `itsdangerous` (for sessions)
- `authlib` or `httpx` (for OAuth)
- `jinja2`

## Acceptance Criteria

- [ ] `main.py` successfully runs a web server on port 8000.
- [ ] Clicking "Login with Google" initiates the OAuth2 flow.
- [ ] After successful login, the user is redirected to `/profile`.
- [ ] `/profile` displays the authenticated user's information.
- [ ] Unauthenticated users cannot access `/profile`.
- [ ] Logout works and clears the session.
