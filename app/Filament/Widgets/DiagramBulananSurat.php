<?php

namespace App\Filament\Widgets;

use DB;
use App\Models\Surat;
use Filament\Widgets\ChartWidget;
use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Support\Facades\Auth;

class DiagramBulananSurat extends ChartWidget
{
    protected static ?string $heading = 'Pengajuan Surat Bulan Ini';
    protected static ?int $sort = 2;
    protected static ?string $pollingInterval = null;

    public function getHeading(): string|Htmlable|null
    {
        return static::$heading . " (" . now()->monthName . ")";
    }

    protected function getData(): array
    {
        $riwayat = Surat::whereMonth('tanggal_pengajuan', now()->month)
            ->groupBy('status')
            ->select(DB::raw('count(status) as total'), 'status')
            ->orderByRaw("
                CASE
                    WHEN status = 'Menunggu' THEN 1
                    WHEN status = 'Diproses' THEN 2
                    WHEN status = 'Disetujui' THEN 3
                    WHEN status = 'Ditolak' THEN 4
                    ELSE 5
                END
            ")
            ->get();

        return [
            'datasets' => [
                [
                    'label' => 'Pengajuan Surat',
                    'data' => $riwayat->map(fn($item) => $item->total)->toArray(),
                    'backgroundColor' => [
                        '#FFCE56',
                        '#36A2EB',
                        '#5cff4d',
                        '#FF6384',
                    ],
                ]
            ],
            'labels' => $riwayat->map(fn($item) => $item->status)->toArray()
        ];
    }

    protected function getType(): string
    {
        return 'pie';
    }

    protected function getOptions(): array
    {
        return [
            'plugins' => [
                'legend' => [
                    'display' => true,
                    'position' => 'top',
                ],
            ],
            'scales' => [
                'x' => ['display' => false],
                'y' => ['display' => false],
            ],
        ];
    }

    public static function canView(): bool
    {
        $user = Auth::user();
        return $user && ($user->hasRole('staff') || $user->hasRole('kaprodi') || $user->hasRole('admin'));
    }
}
