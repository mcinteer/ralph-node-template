import { signIn, signOut } from "@/auth";

export function SignIn() {
  return (
    <form
      action={async () => {
        "use server";
        await signIn("google");
      }}
    >
      <button
        type="submit"
        className="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700 transition"
      >
        Sign in with Google
      </button>
    </form>
  );
}

export function SignOut() {
  return (
    <form
      action={async () => {
        "use server";
        await signOut();
      }}
    >
      <button
        type="submit"
        className="px-4 py-2 bg-gray-200 text-gray-800 rounded hover:bg-gray-300 transition"
      >
        Sign Out
      </button>
    </form>
  );
}
