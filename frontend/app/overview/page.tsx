import { BackendStatus } from '@/components/status';

export default function OverviewPage() {
  return (
    <section className="space-y-4">
      <h1 className="text-2xl font-semibold">Overview</h1>
      <BackendStatus />
      <div className="rounded border border-slate-700 bg-slate-900 p-4 text-slate-200">Sprint 0 baseline dashboard.</div>
    </section>
  );
}
