'use client';

import Link from 'next/link';
import { usePathname } from 'next/navigation';

const navItems = [
  { href: '/overview', label: 'Overview' },
  { href: '/assets', label: 'Assets' },
  { href: '/findings', label: 'Findings' },
  { href: '/compliance', label: 'Compliance' },
  { href: '/scenarios', label: 'Scenarios' },
];

export function Nav() {
  const pathname = usePathname();

  return (
    <nav className="fixed bottom-0 left-0 right-0 border-t border-slate-700 bg-slate-950/95 p-2 backdrop-blur md:top-0 md:bottom-auto md:border-b md:border-t-0">
      <ul className="mx-auto flex max-w-4xl items-center justify-between gap-2 text-xs md:text-sm">
        {navItems.map((item) => {
          const active = pathname.startsWith(item.href);
          return (
            <li key={item.href}>
              <Link
                href={item.href}
                className={`rounded px-2 py-1 ${active ? 'bg-mintbrand text-slate-950' : 'text-slate-300 hover:text-white'}`}
              >
                {item.label}
              </Link>
            </li>
          );
        })}
      </ul>
    </nav>
  );
}
