import { auth } from "@/auth";
import { SignIn, SignOut } from "@/components/auth-components";
import Link from "next/link";

export default async function Home() {
  const session = await auth();

  return (
    <main className="flex min-h-screen flex-col items-center justify-center p-24">
      <div className="z-10 max-w-5xl w-full items-center justify-between font-mono text-sm lg:flex flex-col gap-8 text-center">
        <h1 className="text-4xl font-bold">Welcome to the Ralph Loop App</h1>
        
        {session ? (
          <div className="flex flex-col gap-4 items-center">
            <p className="text-xl">Welcome, {session.user?.name}</p>
            <div className="flex gap-4">
              <Link
                href="/profile"
                className="px-4 py-2 bg-green-600 text-white rounded hover:bg-green-700 transition"
              >
                Go to Profile
              </Link>
              <SignOut />
            </div>
          </div>
        ) : (
          <div className="flex flex-col gap-4 items-center">
            <p className="text-lg text-gray-600">Please sign in to continue</p>
            <SignIn />
          </div>
        )}
      </div>
    </main>
  );
}
