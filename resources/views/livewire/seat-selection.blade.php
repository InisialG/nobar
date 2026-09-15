<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6 sm:py-10" wire:poll.2s="cleanupExpiredLocks" 
    x-data="{ 
        selectedSeatIds: @entangle('selectedSeatIds'),
        maxAllowed: {{ $maxAllowedSeats ?? 4 }},
        toggle(id) {
            if (this.selectedSeatIds.includes(id)) {
                this.selectedSeatIds = this.selectedSeatIds.filter(i => i !== id);
                $wire.toggleSeat(id);
            } else {
                if (this.selectedSeatIds.length >= this.maxAllowed) {
                    alert('Maksimal pemesanan adalah 4 tiket per nomor HP (Sisa kuota Anda: ' + this.maxAllowed + ' kursi).');
                    return;
                }
                this.selectedSeatIds.push(id);
                $wire.toggleSeat(id);
            }
        }
     }">
    
    <!-- Top Bar: Event & Session Info + View Mode Selector -->
    <div class="bg-white p-5 sm:p-6 rounded-3xl mb-6 sm:mb-8 flex flex-col lg:flex-row lg:items-center justify-between gap-4 border border-slate-200 shadow-sm">
        <div>
            <a href="{{ url('/events/' . $event->slug) }}" class="text-xs font-semibold text-[#8B0000] hover:underline flex items-center gap-1 mb-1">
                <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M15 19l-7-7 7-7"></path></svg>
                Kembali ke Detail Event
            </a>
            <h1 class="font-heading font-extrabold text-xl sm:text-2xl text-slate-900">{{ $event->title }}</h1>
            <p class="text-xs text-slate-500 mt-1">
                {{ $venue->name }} — Sesi: <strong class="text-slate-800">{{ \Carbon\Carbon::parse($eventSession->session_date)->translatedFormat('l, d F Y') }} (Pukul {{ \Carbon\Carbon::parse($eventSession->start_time)->format('H:i') }} WIB)</strong>
            </p>
        </div>
    </div>

    @if (session()->has('error'))
        <div class="mb-6 p-4 rounded-2xl bg-rose-50 border border-rose-200 text-rose-800 text-sm flex items-center justify-between shadow-sm">
            <span class="font-semibold">{{ session('error') }}</span>
        </div>
    @endif

    <!-- Legenda Status Kursi -->
    <div class="mb-6 bg-white p-3.5 sm:p-4 rounded-2xl border border-slate-200 flex items-center justify-start gap-6 text-xs shadow-sm">
        <div class="flex items-center gap-1.5">
            <span class="w-4 h-4 rounded-md bg-[#ffb200] border border-[#ffb200]"></span>
            <span class="text-slate-700 font-semibold">Tersedia</span>
        </div>
        <div class="flex items-center gap-1.5">
            <span class="w-4 h-4 rounded-md bg-emerald-500 ring-2 ring-emerald-500/40"></span>
            <span class="text-slate-700 font-semibold">Pilihan Anda</span>
        </div>
        <div class="flex items-center gap-1.5">
            <span class="w-4 h-4 rounded-md bg-rose-600"></span>
            <span class="text-slate-700 font-semibold">Telah Dipesan</span>
        </div>
    </div>

    <!-- MAIN CONTENT AREA BASED ON VIEW MODE -->
    <div class="grid grid-cols-1 lg:grid-cols-12 gap-8 pb-24 lg:pb-0">
        
        <!-- LEFT AREA: DENAH -->
        <div class="lg:col-span-8 space-y-6">

            <!-- DENAH INTERAKTIF -->
            <div class="bg-white p-4 sm:p-8 rounded-3xl overflow-x-auto touch-auto border border-slate-200 shadow-sm relative">
                
                <!-- Stage & Layout Header Bar -->
                <div class="flex items-center justify-between mb-4 border-b border-slate-200 pb-3 text-xs text-slate-600">
                    <span class="font-bold flex items-center gap-1.5 text-slate-800">
                        <svg class="w-4 h-4 text-[#8B0000]" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 5v2m0 4v2m0 4v2M5 5a2 2 0 00-2 2v3a2 2 0 002 2h14a2 2 0 002-2V7a2 2 0 00-2-2H5z"></path></svg>
                        Denah Interaktif Presisi
                    </span>
                </div>

                <!-- Mobile Hint Banner -->
                <div class="sm:hidden text-center mb-4">
                    <span class="text-[11px] text-slate-600 bg-slate-100 px-3 py-1.5 rounded-full border border-slate-200 inline-flex items-center gap-1.5 font-medium">
                        👈 Geser denah ke samping untuk melihat seluruh kursi 👉
                    </span>
                </div>

                <!-- Seat Grid Container matching Poster Stage Box -->
                <div class="inline-block min-w-full align-middle">
                    <div class="w-max mx-auto flex flex-col items-center gap-2 sm:gap-2.5 p-3 sm:p-5 rounded-2xl bg-slate-50 border border-slate-200">
                        
                        <!-- Official STAGE Box -->
                        <div class="w-full max-w-xs mx-auto mb-6 sm:mb-8 text-center">
                            <div class="py-2.5 px-8 bg-slate-800 rounded-xl border border-slate-700 shadow-md flex items-center justify-center mx-auto w-48">
                                <span class="font-heading font-black text-xs sm:text-sm tracking-[0.25em] uppercase text-white">STAGE</span>
                            </div>
                        </div>

                        <!-- Global Grid Container untuk Lorong Vertikal Lurus -->
                        <div class="grid grid-cols-[1fr_auto_1fr] gap-x-4 sm:gap-x-8 gap-y-1 sm:gap-y-1.5 w-full min-w-max mt-4">
                            <!-- Headers Zona -->
                            <div class="text-right text-[10px] sm:text-xs font-bold text-slate-400 tracking-widest uppercase mb-2">Zona Kiri</div>
                            <div class="text-center text-[10px] sm:text-xs font-bold text-slate-400 tracking-widest uppercase px-4 sm:px-8 mb-2">Zona Tengah</div>
                            <div class="text-left text-[10px] sm:text-xs font-bold text-slate-400 tracking-widest uppercase mb-2">Zona Kanan</div>

                            @foreach($groupedSeatsByRow as $rowLetter => $zones)
                                <!-- ZONA KIRI -->
                                <div class="flex items-center gap-1 sm:gap-1.5 justify-end border-b border-slate-100 pb-1.5 min-h-[36px]" wire:key="zone-L-{{ $rowLetter }}">
                                    @if(!empty($zones['L']))
                                        <span class="w-5 sm:w-6 text-[11px] sm:text-xs font-bold text-slate-500 text-center uppercase shrink-0 select-none">{{ $rowLetter }}</span>
                                        <div class="flex items-center gap-1 sm:gap-1.5 flex-nowrap justify-end">
                                            @foreach($zones['L'] as $seatAvail)
                                                @php
                                                    $seatMaster = $seatAvail->seatMaster;
                                                    $category = $seatMaster->seatCategory;
                                                    $isSelected = in_array($seatAvail->id, $selectedSeatIds);
                                                    $isLockedOrSold = ($seatAvail->status === 'sold') || ($seatAvail->status === 'locked' && !$isSelected && ($seatAvail->locked_until > now() || $seatAvail->order_id !== null));
                                                    $bgColor = '#ffb200';
                                                @endphp
                                                <button 
                                                    wire:key="seat-{{ $seatAvail->id }}"
                                                    type="button" @click="toggle({{ $seatAvail->id }})" @if($isLockedOrSold) disabled @endif
                                                    title="Kursi {{ $seatMaster->seat_code }}"
                                                    :class="selectedSeatIds.includes({{ $seatAvail->id }}) ? 'bg-emerald-500 text-white ring-4 ring-emerald-500/40 scale-110 shadow-lg z-10' : '{{ $isLockedOrSold ? 'bg-rose-600 text-white border border-rose-500/50 cursor-not-allowed opacity-90' : 'text-slate-900 hover:scale-110 hover:shadow-md cursor-pointer' }}'"
                                                    class="w-6 h-6 sm:w-7 sm:h-7 shrink-0 rounded-md text-[9px] sm:text-[10px] font-extrabold flex items-center justify-center transition-all duration-150 touch-manipulation select-none active:scale-95 relative group"
                                                    :style="selectedSeatIds.includes({{ $seatAvail->id }}) ? '' : '{{ !$isLockedOrSold ? "background-color: {$bgColor}" : '' }}'">
                                                    {{ (int)$seatMaster->col_num }}
                                                    <span class="absolute -top-10 left-1/2 -translate-x-1/2 px-2.5 py-1 bg-slate-900 text-white text-[9px] rounded font-medium whitespace-nowrap opacity-0 group-hover:opacity-100 transition-opacity pointer-events-none z-20 shadow-xl">
                                                        {{ $seatMaster->seat_code }} @if(!$event->is_free) • Rp {{ number_format($category?->price ?? 0, 0, ',', '.') }} @endif
                                                    </span>
                                                </button>
                                            @endforeach
                                        </div>
                                    @endif
                                </div>

                                <!-- ZONA TENGAH -->
                                <div class="flex items-center gap-1 sm:gap-1.5 justify-center border-b border-slate-100 border-l border-r border-slate-200 px-2 sm:px-4 pb-1.5 min-h-[36px]" wire:key="zone-C-{{ $rowLetter }}">
                                    @if(!empty($zones['C']))
                                        <span class="w-5 sm:w-6 text-[10px] font-bold text-slate-300 text-center uppercase shrink-0 select-none">{{ $rowLetter }}</span>
                                        <div class="flex items-center gap-1 sm:gap-1.5 flex-nowrap justify-center">
                                            @foreach($zones['C'] as $seatAvail)
                                                @php
                                                    $seatMaster = $seatAvail->seatMaster;
                                                    $category = $seatMaster->seatCategory;
                                                    $isSelected = in_array($seatAvail->id, $selectedSeatIds);
                                                    $isLockedOrSold = ($seatAvail->status === 'sold') || ($seatAvail->status === 'locked' && !$isSelected && ($seatAvail->locked_until > now() || $seatAvail->order_id !== null));
                                                    $bgColor = '#ffb200';
                                                @endphp
                                                <button 
                                                    wire:key="seat-{{ $seatAvail->id }}"
                                                    type="button" @click="toggle({{ $seatAvail->id }})" @if($isLockedOrSold) disabled @endif
                                                    title="Kursi {{ $seatMaster->seat_code }}"
                                                    :class="selectedSeatIds.includes({{ $seatAvail->id }}) ? 'bg-emerald-500 text-white ring-4 ring-emerald-500/40 scale-110 shadow-lg z-10' : '{{ $isLockedOrSold ? 'bg-rose-600 text-white border border-rose-500/50 cursor-not-allowed opacity-90' : 'text-slate-900 hover:scale-110 hover:shadow-md cursor-pointer' }}'"
                                                    class="w-6 h-6 sm:w-7 sm:h-7 shrink-0 rounded-md text-[9px] sm:text-[10px] font-extrabold flex items-center justify-center transition-all duration-150 touch-manipulation select-none active:scale-95 relative group"
                                                    :style="selectedSeatIds.includes({{ $seatAvail->id }}) ? '' : '{{ !$isLockedOrSold ? "background-color: {$bgColor}" : '' }}'">
                                                    {{ (int)$seatMaster->col_num }}
                                                    <span class="absolute -top-10 left-1/2 -translate-x-1/2 px-2.5 py-1 bg-slate-900 text-white text-[9px] rounded font-medium whitespace-nowrap opacity-0 group-hover:opacity-100 transition-opacity pointer-events-none z-20 shadow-xl">
                                                        {{ $seatMaster->seat_code }} @if(!$event->is_free) • Rp {{ number_format($category?->price ?? 0, 0, ',', '.') }} @endif
                                                    </span>
                                                </button>
                                            @endforeach
                                        </div>
                                        <span class="w-5 sm:w-6 text-[10px] font-bold text-slate-300 text-center uppercase shrink-0 select-none">{{ $rowLetter }}</span>
                                    @endif
                                </div>

                                <!-- ZONA KANAN -->
                                <div class="flex items-center gap-1 sm:gap-1.5 justify-start border-b border-slate-100 pb-1.5 min-h-[36px]" wire:key="zone-R-{{ $rowLetter }}">
                                    @if(!empty($zones['R']))
                                        <div class="flex items-center gap-1 sm:gap-1.5 flex-nowrap justify-start">
                                            @foreach($zones['R'] as $seatAvail)
                                                @php
                                                    $seatMaster = $seatAvail->seatMaster;
                                                    $category = $seatMaster->seatCategory;
                                                    $isSelected = in_array($seatAvail->id, $selectedSeatIds);
                                                    $isLockedOrSold = ($seatAvail->status === 'sold') || ($seatAvail->status === 'locked' && !$isSelected && ($seatAvail->locked_until > now() || $seatAvail->order_id !== null));
                                                    $bgColor = '#ffb200';
                                                @endphp
                                                <button 
                                                    wire:key="seat-{{ $seatAvail->id }}"
                                                    type="button" @click="toggle({{ $seatAvail->id }})" @if($isLockedOrSold) disabled @endif
                                                    title="Kursi {{ $seatMaster->seat_code }}"
                                                    :class="selectedSeatIds.includes({{ $seatAvail->id }}) ? 'bg-emerald-500 text-white ring-4 ring-emerald-500/40 scale-110 shadow-lg z-10' : '{{ $isLockedOrSold ? 'bg-rose-600 text-white border border-rose-500/50 cursor-not-allowed opacity-90' : 'text-slate-900 hover:scale-110 hover:shadow-md cursor-pointer' }}'"
                                                    class="w-6 h-6 sm:w-7 sm:h-7 shrink-0 rounded-md text-[9px] sm:text-[10px] font-extrabold flex items-center justify-center transition-all duration-150 touch-manipulation select-none active:scale-95 relative group"
                                                    :style="selectedSeatIds.includes({{ $seatAvail->id }}) ? '' : '{{ !$isLockedOrSold ? "background-color: {$bgColor}" : '' }}'">
                                                    {{ (int)$seatMaster->col_num }}
                                                    <span class="absolute -top-10 left-1/2 -translate-x-1/2 px-2.5 py-1 bg-slate-900 text-white text-[9px] rounded font-medium whitespace-nowrap opacity-0 group-hover:opacity-100 transition-opacity pointer-events-none z-20 shadow-xl">
                                                        {{ $seatMaster->seat_code }} @if(!$event->is_free) • Rp {{ number_format($category?->price ?? 0, 0, ',', '.') }} @endif
                                                    </span>
                                                </button>
                                            @endforeach
                                        </div>
                                        <span class="w-5 sm:w-6 text-[11px] sm:text-xs font-bold text-slate-500 text-center uppercase shrink-0 select-none">{{ $rowLetter }}</span>
                                    @endif
                                </div>

                                @if($rowLetter === 'H')
                                    <!-- Walkway / Gang Tengah -->
                                    <div class="col-span-3 h-8 sm:h-12 w-full flex items-center justify-center my-1 sm:my-2 bg-slate-100/50 rounded-lg">
                                        <span class="text-[9px] sm:text-[10px] text-slate-400 tracking-[0.5em] uppercase font-bold">Jalan Lintas / Walkway</span>
                                    </div>
                                @endif
                            @endforeach
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <!-- RIGHT AREA: SUMMARY & CHECKOUT CARD -->
        <div class="lg:col-span-4">
            <div class="bg-white p-6 sm:p-8 rounded-3xl sticky top-28 border border-slate-200 shadow-sm flex flex-col justify-between h-auto">
                <div>
                    <div class="flex items-center justify-between mb-2">
                        <h3 class="font-heading font-bold text-xl text-slate-900">Ringkasan Kursi Terpilih</h3>
                        @if (!empty($selectedSeatIds))
                            <button wire:click="clearAllSelectedSeats" type="button" class="text-xs text-rose-600 hover:text-rose-800 font-bold hover:underline cursor-pointer">
                                Reset Pilihan
                            </button>
                        @endif
                    </div>
                    <p class="text-xs text-slate-500 mb-6">Pilih minimal 1 kursi. <br/><strong class="text-rose-600">(Maksimal 4 tiket per nomor HP)</strong></p>

                    @if (empty($selectedSeatIds))
                        <div class="p-8 text-center border-2 border-dashed border-slate-200 rounded-2xl mb-6 bg-slate-50">
                            <svg class="w-12 h-12 text-slate-400 mx-auto mb-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M15 5v2m0 4v2m0 4v2M5 5a2 2 0 00-2 2v3a2 2 0 002 2h14a2 2 0 002-2V7a2 2 0 00-2-2H5z"></path></svg>
                            <span class="text-xs text-slate-700 font-semibold block">Belum ada kursi yang dipilih.</span>
                            <span class="text-[11px] text-slate-500">Klik / sentuh kursi berwarna di denah sebelah kiri.</span>
                        </div>
                    @else
                        <div class="space-y-3 mb-6 max-h-60 overflow-y-auto pr-1">
                            @foreach ($selectedSeatIds as $seatId)
                                @php
                                    $item = $seatAvailabilities->firstWhere('id', $seatId);
                                    $master = $item?->seatMaster;
                                    $cat = $master?->seatCategory;
                                @endphp
                                @if ($master)
                                    <div class="p-3.5 rounded-xl bg-slate-50 border border-slate-200 flex items-center justify-between">
                                        <div class="flex items-center gap-3">
                                            <span class="w-3.5 h-3.5 rounded-md shadow-sm border border-emerald-400 bg-emerald-500 shrink-0"></span>
                                            <div>
                                                <span class="font-bold text-sm text-slate-900 block">Kursi {{ $master->seat_code }}</span>

                                            </div>
                                        </div>
                                        @if(!$event->is_free)
                                        <span class="font-bold text-sm text-[#8B0000]">Rp {{ number_format($cat?->price ?? 0, 0, ',', '.') }}</span>
                                        @else
                                        <span class="font-bold text-sm text-emerald-600">Gratis</span>
                                        @endif
                                    </div>
                                @endif
                            @endforeach
                        </div>
                    @endif

                    <!-- Timer Countdown Badge -->
                    @if (!empty($selectedSeatIds))
                        <div class="p-3.5 rounded-xl bg-orange-50 border border-orange-200 text-[#8B0000] text-xs flex items-center gap-2 mb-6 font-medium">
                            <svg class="w-4 h-4 text-[#8B0000] animate-spin shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                            <span>Kursi terkunci sementara (<strong>10 Menit</strong>) saat Anda memilih.</span>
                        </div>
                    @endif
                </div>

                <!-- Total & Checkout Button (Desktop) -->
                <div class="pt-6 border-t border-slate-200 hidden lg:block space-y-4">
                    <div class="flex items-center justify-between">
                        <span class="text-xs text-slate-500 font-semibold flex items-center gap-1.5">
                            <span>{{ $event->is_free ? 'Total' : 'Total Pembayaran' }}</span>
                            <svg wire:loading wire:target="toggleSeat, clearAllSelectedSeats" class="w-3.5 h-3.5 text-[#8B0000] animate-spin" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        </span>
                        @if(!$event->is_free)
                        <span class="font-heading font-extrabold text-2xl text-[#8B0000]">
                            Rp {{ number_format($totalPrice, 0, ',', '.') }}
                        </span>
                        @else
                        <span class="font-heading font-extrabold text-2xl text-emerald-600">
                            Gratis
                        </span>
                        @endif
                    </div>

                    <button 
                        wire:click="proceedToCheckout"
                        @if (count($selectedSeatIds) < 1) disabled @endif
                        class="w-full py-4 px-6 rounded-2xl bg-[#ffb200] hover:bg-[#e6a100] text-[#8B0000] font-extrabold text-sm text-center shadow-md shadow-[#ffb200]/20 disabled:opacity-40 disabled:cursor-not-allowed transition-all flex items-center justify-center gap-2">
                        <span>{{ count($selectedSeatIds) < 1 ? 'Pilih Min. 1 Kursi' : ($event->is_free ? 'Ambil Tiket Gratis' : 'Lanjut ke Pembayaran') }}</span>
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg>
                    </button>

                    <!-- SPECIAL ADMIN ONLY: VVIP COMPLIMENTARY RESERVATION BUTTON & RESET ALL SEATS -->
                    @if (Auth::check() && Auth::user()->isAdmin())
                        <div class="pt-4 border-t border-purple-200 bg-purple-50/80 p-4 rounded-2xl border space-y-3">
                            <span class="text-[11px] font-extrabold uppercase tracking-wider text-purple-900 block">Akses Admin: Kontrol Kursi</span>
                            <p class="text-[11px] text-purple-800 leading-snug">Terbitkan E-Tiket VVIP atau kosongkan seluruh status kursi sesi ini.</p>
                            
                            <button 
                                wire:click="reserveVvipSeats"
                                @if (empty($selectedSeatIds)) disabled @endif
                                class="w-full py-3 px-4 rounded-xl bg-purple-600 hover:bg-purple-700 disabled:opacity-40 disabled:cursor-not-allowed text-white font-extrabold text-xs text-center shadow-md shadow-purple-600/20 transition-all flex items-center justify-center gap-2 cursor-pointer">
                                <span>Terbitkan Tiket VVIP (Bebas Bayar)</span>
                                <svg class="w-4 h-4 text-purple-200" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z"></path></svg>
                            </button>

                            @if (Auth::user()->isSuperAdmin())
                            <button 
                                wire:click="resetAllSeatsInSession"
                                wire:confirm="Apakah Anda yakin ingin MENGOSONGKAN SELURUH KURSI pada sesi ini menjadi Tersedia kembali?"
                                type="button"
                                class="w-full py-2.5 px-4 rounded-xl bg-rose-50 hover:bg-rose-100 border border-rose-200 text-rose-700 font-extrabold text-xs text-center transition-all flex items-center justify-center gap-2 cursor-pointer">
                                <span>Reset Semua Kursi (Buka Semua)</span>
                            </button>
                            @endif
                        </div>
                    @endif
                </div>
            </div>
        </div>

    </div>

    <!-- Sticky Floating Action Bar at Bottom (SPECIAL MOBILE UX) -->
    <div class="fixed bottom-0 left-0 right-0 p-4 bg-white/95 backdrop-blur-2xl border-t border-slate-200 shadow-2xl lg:hidden z-40">
        <div class="max-w-md mx-auto flex items-center justify-between gap-4">
            <div>
                <span class="text-[10px] text-slate-500 uppercase tracking-wider block font-bold">
                    {{ count($selectedSeatIds) }} Kursi Terpilih
                </span>
                @if(!$event->is_free)
                <span class="font-heading font-extrabold text-xl text-[#8B0000] block leading-tight">
                    Rp {{ number_format($totalPrice, 0, ',', '.') }}
                </span>
                @else
                <span class="font-heading font-extrabold text-xl text-emerald-600 block leading-tight">
                    Gratis
                </span>
                @endif
            </div>

            <button 
                wire:click="proceedToCheckout"
                @if (count($selectedSeatIds) < 1) disabled @endif
                class="px-6 py-3.5 rounded-2xl bg-[#ffb200] text-[#8B0000] font-extrabold text-sm shadow-md shadow-[#ffb200]/20 disabled:opacity-40 disabled:cursor-not-allowed transition-all flex items-center gap-2 shrink-0 touch-manipulation">
                <span>{{ count($selectedSeatIds) < 1 ? 'Pilih Min. 1 Kursi' : ($event->is_free ? 'Ambil Tiket' : 'Lanjut Pembayaran') }}</span>
                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg>
            </button>
        </div>
    </div>



</div>
