<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        \App\Models\EventSession::observe(\App\Observers\EventSessionObserver::class);

        // Force URL root dan scheme berdasarkan APP_URL di .env
        // Ini WAJIB agar link benar saat deploy di subdirektori (misal /boro-events/public)
        $appUrl = config('app.url');
        if ($appUrl) {
            \Illuminate\Support\Facades\URL::forceRootUrl($appUrl);
            $scheme = parse_url($appUrl, PHP_URL_SCHEME);
            if ($scheme) {
                \Illuminate\Support\Facades\URL::forceScheme($scheme);
            }
        }
    }
}
