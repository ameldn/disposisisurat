<?php

namespace App\Filament\Widgets;

use App\Models\Surat;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Card;
use App\Models\User;
use App\Models\Task;
use Carbon\Carbon;

class AdminDashboardWidget extends BaseWidget
{
    protected function getCards(): array
    {
        return [
            // Menampilkan Total Pengguna
            Card::make('Total Pengguna', User::count()),

            // Menampilkan Pengguna Terdaftar Hari Ini
            Card::make('Pengguna terdaftar hari ini', User::whereDate('created_at', Carbon::today())->count()),

            // Menampilkan Tugas yang Dibuat Hari Ini
            Card::make('Surat yang dibuat hari ini', Surat::whereDate('created_at', Carbon::today())->count()),
        ];
    }

    public static function canView(): bool
    {
        // Hanya tampilkan widget ini untuk admin
        return auth()->user() && auth()->user()->hasRole('admin');
    }
}
