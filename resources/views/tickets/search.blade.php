<x-app-layout>
    <div class="max-w-md mx-auto px-4 sm:px-6 lg:px-8 py-20 space-y-8">
        
        <div class="text-center">
            <h1 class="font-heading font-extrabold text-3xl text-slate-900 mb-2">Cari Tiket Saya</h1>
            <p class="text-sm text-slate-500">Masukkan nomor WhatsApp / HP yang Anda gunakan saat pendaftaran untuk melihat atau mengunduh tiket Anda.</p>
        </div>

        <div class="bg-white p-6 rounded-3xl border border-slate-200 shadow-sm">
            <form method="POST" action="{{ route('my-tickets.search') }}">
                @csrf
                <div class="space-y-4">
                    <div>
                        <label for="phone_number" class="block text-sm font-bold text-slate-700 mb-1">Nomor WhatsApp / HP</label>
                        <input type="tel" name="phone_number" id="phone_number" class="w-full rounded-xl border-slate-300 focus:border-[#ffb200] focus:ring-[#ffb200] text-sm" placeholder="Contoh: 081234567890" required>
                    </div>

                    <button type="submit" class="w-full py-3.5 px-4 rounded-xl bg-[#ffb200] hover:bg-[#e6a100] text-[#8B0000] font-extrabold text-sm shadow-md shadow-[#ffb200]/20 transition-all mt-6">
                        Cari & Buka Tiket Saya
                    </button>
                </div>
            </form>
        </div>

    </div>
</x-app-layout>
