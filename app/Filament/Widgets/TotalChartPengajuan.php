<?php

namespace App\Filament\Widgets;

use App\Models\Surat;
use Filament\Widgets\ChartWidget;
use Illuminate\Support\Facades\DB;

class TotalChartPengajuan extends ChartWidget
{
    protected static ?string $heading = 'Total Pengajuan Surat';
    protected static ?string $pollingInterval = null;
    protected static ?int $sort = 3;

    protected function getData(): array
    {
        // Mengambil data total pengajuan surat tanpa filter bulan
        $riwayat = Surat::groupBy('status')
            ->select(
                DB::raw('count(status) as total'),
                'status'
            )
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
                    'label' => 'Total Pengajuan Surat',
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
}
