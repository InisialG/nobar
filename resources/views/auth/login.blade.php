<x-app-layout>
    <div class="max-w-md mx-auto my-12 px-4" x-data="{ step: 1, phone: '{{ old('phone_number') }}', participantCount: {{ old('participant_count', 1) }} }">
        <div class="bg-white p-8 rounded-3xl shadow-sm border border-slate-200 relative overflow-hidden">
            
            <div class="text-center mb-8">
                <h1 class="font-heading font-bold text-2xl text-slate-900 mb-2">
                    Registrasi
                </h1>
                <p class="text-xs text-slate-500" x-show="step === 1">
                    Masukan nomor HP Anda untuk mulai memesan tiket.
                </p>
                <p class="text-xs text-slate-500" x-show="step === 2" x-cloak style="display: none;">
                    Tentukan jumlah peserta dan lengkapi data masing-masing.
                </p>
            </div>

            @if (session('error'))
                <div class="mb-6 p-4 rounded-2xl bg-rose-50 border border-rose-200 text-rose-800 text-xs flex items-start gap-3">
                    <svg class="w-5 h-5 flex-shrink-0 text-rose-600 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                    <span class="font-semibold leading-relaxed">{{ session('error') }}</span>
                </div>
            @endif

            @if (session('success'))
                <div class="mb-6 p-4 rounded-2xl bg-emerald-50 border border-emerald-200 text-emerald-800 text-xs flex items-start gap-3">
                    <svg class="w-5 h-5 flex-shrink-0 text-emerald-600 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                    <span class="font-semibold leading-relaxed">{{ session('success') }}</span>
                </div>
            @endif

            <!-- Form Registrasi Multi-Step -->
            <form method="POST" action="{{ route('login') }}">
                @csrf
                @if(isset($event_slug) && isset($session_id))
                    <input type="hidden" name="event_slug" value="{{ $event_slug }}">
                    <input type="hidden" name="session_id" value="{{ $session_id }}">
                @endif
                <div class="space-y-4">
                    
                    <!-- Step 1: Nomor HP -->
                    <div x-show="step === 1">
                        <label class="block text-xs font-semibold text-slate-700 mb-1">Nomor WhatsApp / HP</label>
                        <input type="text" name="phone_number" x-model="phone" x-ref="phone" required class="w-full px-4 py-3 rounded-xl bg-slate-50 border border-slate-300 text-slate-900 text-sm focus:border-[#ffb200] focus:ring-1 focus:ring-[#ffb200] outline-none" placeholder="Contoh: 081234567890">
                        @error('phone_number')
                            <span class="text-rose-600 text-xs mt-1 block font-semibold">{{ $message }}</span>
                        @enderror
                    </div>

                    <!-- Step 2: Jumlah Peserta & Data Dinamis -->
                    <div x-show="step === 2" x-cloak style="display: none;" class="mt-2">
                        <label class="block text-xs font-semibold text-slate-700 mb-1">Jumlah Peserta (termasuk Anda, maks 4)</label>
                        <select name="participant_count" x-model.number="participantCount" :required="step === 2" class="w-full px-4 py-3 rounded-xl bg-slate-50 border border-slate-300 text-slate-900 text-sm focus:border-[#ffb200] focus:ring-1 focus:ring-[#ffb200] outline-none">
                            <option value="1">1 Orang</option>
                            <option value="2">2 Orang</option>
                            <option value="3">3 Orang</option>
                            <option value="4">4 Orang</option>
                        </select>
                        @error('participant_count')
                            <span class="text-rose-600 text-xs mt-1 block font-semibold">{{ $message }}</span>
                        @enderror
                    </div>

                    <div x-show="step === 2" x-cloak style="display: none;" class="mt-4 space-y-4">
                        <template x-for="i in participantCount" :key="i">
                            <div class="p-4 bg-slate-50 border border-slate-200 rounded-xl space-y-3">
                                <h4 class="font-bold text-xs text-slate-800" x-text="'Data Peserta ' + i"></h4>
                                
                                <div>
                                    <label class="block text-xs font-semibold text-slate-700 mb-1">Nama Lengkap</label>
                                    <input type="text" :name="'names[' + (i-1) + ']'" required class="w-full px-3 py-2.5 rounded-lg bg-white border border-slate-300 text-slate-900 text-sm focus:border-[#ffb200] focus:ring-1 focus:ring-[#ffb200] outline-none" placeholder="Masukkan nama peserta">
                                </div>

                                <div>
                                    <label class="block text-xs font-semibold text-slate-700 mb-1">Organisasi</label>
                                    <select :name="'organizations[' + (i-1) + ']'" required class="w-full px-3 py-2.5 rounded-lg bg-white border border-slate-300 text-slate-900 text-sm focus:border-[#ffb200] focus:ring-1 focus:ring-[#ffb200] outline-none">
                                        <option value="">-- Pilih Organisasi --</option>
                                        <option value="Keluarga Besar PMVB">Keluarga Besar PMVB</option>
                                        <option value="Sekber PMVBI">Sekber PMVBI</option>
                                    </select>
                                </div>
                            </div>
                        </template>
                    </div>

                    <div class="pt-2">
                        <button type="button" x-show="step === 1" @click="if($refs.phone.reportValidity()) step = 2" class="w-full py-3.5 px-4 rounded-xl bg-[#ffb200] hover:bg-[#e6a100] text-[#8B0000] font-extrabold text-sm shadow-md shadow-[#ffb200]/20 transition-all">
                            Lanjut
                        </button>

                        <button type="submit" x-show="step === 2" x-cloak style="display: none;" class="w-full py-3.5 px-4 rounded-xl bg-[#ffb200] hover:bg-[#e6a100] text-[#8B0000] font-extrabold text-sm shadow-md shadow-[#ffb200]/20 transition-all">
                            Registrasi
                        </button>
                        
                        <button type="button" x-show="step === 2" x-cloak style="display: none;" @click="step = 1" class="w-full py-3.5 px-4 rounded-xl bg-slate-100 hover:bg-slate-200 text-slate-600 font-extrabold text-sm transition-all mt-3">
                            Kembali
                        </button>
                    </div>
                </div>
            </form>

        </div>
    </div>
</x-app-layout>
