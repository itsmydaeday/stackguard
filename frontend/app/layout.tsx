import type { Metadata } from 'next';
import './globals.css';
import { Nav } from '@/components/nav';

export const metadata: Metadata = {
  title: 'StackGuard',
  description: 'Sprint 0 security posture shell',
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body className="text-slate-100">
        <Nav />
        <main className="mx-auto w-full max-w-4xl px-4 pb-24 pt-6 md:pt-20">{children}</main>
      </body>
    </html>
  );
}
