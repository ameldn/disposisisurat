<?php

namespace App\Filament\Widgets;

use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Card;
use App\Models\Surat;
use Illuminate\Support\Facades\Auth;

class StaffKaprodiDashboardWidget extends BaseWidget
{
    protected function getCards(): array
    {
        // Count the letters by status
        $waitingCount = Surat::where('status', 'Menunggu')->count();
        $inProcessCount = Surat::where('status', 'Diproses')->count(); // Added count for 'Diproses'
        $rejectedCount = Surat::where('status', 'Ditolak')->count();
        $approvedCount = Surat::where('status', 'Disetujui')->count();

        return [
            Card::make('Surat Menunggu Diproses', $waitingCount),
            Card::make('Surat Diproses', $inProcessCount), // Card for 'Diproses'
            Card::make('Surat Ditolak', $rejectedCount),
            Card::make('Surat Disetujui', $approvedCount),
        ];
    }

    public static function canView(): bool
    {
        // Only show this widget to users with 'staff' or 'kaprodi' roles
        $user = Auth::user();
        return $user && ($user->hasRole('staff') || $user->hasRole('kaprodi'));
    }
}
