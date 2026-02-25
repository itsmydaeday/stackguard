'use client';

import { FormEvent, useState } from 'react';

const backendBase = process.env.NEXT_PUBLIC_BACKEND_URL || 'http://localhost:8000';

export default function LoginPage() {
  const [message, setMessage] = useState('');

  async function onSubmit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    const form = new FormData(event.currentTarget);
    const username = String(form.get('username') || '');
    const password = String(form.get('password') || '');

    const body = new URLSearchParams({ username, password });
    const response = await fetch(`${backendBase}/api/v1/token`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body,
    });

    if (!response.ok) {
      setMessage('Login failed');
      return;
    }

    const data = await response.json();
    localStorage.setItem('stackguard_token', data.access_token);
    setMessage('Login succeeded. Open Overview.');
  }

  return (
    <section className="mx-auto mt-10 max-w-md rounded-xl border border-slate-700 bg-slate-900/80 p-6 shadow-2xl">
      <h1 className="text-2xl font-semibold">StackGuard Login</h1>
      <p className="mt-2 text-sm text-slate-300">Use dev seed credentials from README.</p>
      <form className="mt-6 space-y-3" onSubmit={onSubmit}>
        <input className="w-full rounded border border-slate-600 bg-slate-950 p-2" name="username" placeholder="Username" required />
        <input className="w-full rounded border border-slate-600 bg-slate-950 p-2" type="password" name="password" placeholder="Password" required />
        <button className="w-full rounded bg-mintbrand px-3 py-2 font-semibold text-slate-950" type="submit">
          Sign in
        </button>
      </form>
      {message ? <p className="mt-3 text-sm text-slate-200">{message}</p> : null}
    </section>
  );
}
