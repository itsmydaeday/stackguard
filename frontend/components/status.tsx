'use client';

import { useEffect, useState } from 'react';

const backendBase = process.env.NEXT_PUBLIC_BACKEND_URL || 'http://localhost:8000';

export function BackendStatus() {
  const [status, setStatus] = useState<'loading' | 'ok' | 'down'>('loading');

  useEffect(() => {
    fetch(`${backendBase}/health`)
      .then((res) => (res.ok ? setStatus('ok') : setStatus('down')))
      .catch(() => setStatus('down'));
  }, []);

  return (
    <div className="rounded border border-slate-700 bg-slate-900 p-4">
      <p className="text-xs uppercase tracking-wide text-slate-400">Backend</p>
      <p className="mt-1 text-lg font-semibold text-white">
        {status === 'loading' && 'Checking...'}
        {status === 'ok' && 'Healthy'}
        {status === 'down' && 'Unavailable'}
      </p>
    </div>
  );
}
