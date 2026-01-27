import { auth } from "@/auth";
import { redirect } from "next/navigation";
import Link from "next/link";
import Image from "next/image";

export default async function ProfilePage() {
  const session = await auth();

  if (!session?.user) {
    redirect("/");
  }

  const { name, email, image } = session.user;

  return (
    <main className="flex min-h-screen flex-col items-center justify-center p-24">
      <div className="z-10 max-w-md w-full items-center font-mono text-sm border p-8 rounded-lg shadow-lg bg-white">
        <h1 className="text-2xl font-bold mb-6 text-center">User Profile</h1>
        
        <div className="flex flex-col items-center gap-4">
          {image && (
            <div className="relative w-24 h-24 rounded-full overflow-hidden border-2 border-blue-500">
              <Image
                src={image}
                alt={name || "User Avatar"}
                fill
                className="object-cover"
              />
            </div>
          )}
          
          <div className="flex flex-col items-center">
            <span className="text-gray-500 text-xs uppercase tracking-widest">Name</span>
            <p className="text-xl font-semibold">{name}</p>
          </div>

          <div className="flex flex-col items-center">
            <span className="text-gray-500 text-xs uppercase tracking-widest">Email</span>
            <p className="text-lg">{email}</p>
          </div>

          <div className="mt-6 flex gap-4">
            <Link
              href="/"
              className="px-4 py-2 border rounded hover:bg-gray-100 transition"
            >
              Back Home
            </Link>
          </div>
        </div>
      </div>
    </main>
  );
}
