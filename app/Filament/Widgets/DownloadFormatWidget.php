<?php

namespace App\Filament\Widgets;

use Filament\Forms\Form;
use Filament\Widgets\Widget;
use Illuminate\Support\Facades\Auth;
use Filament\Forms\Components\Actions;
use Filament\Forms\Contracts\HasForms;
use Filament\Forms\Components\Actions\Action;
use Filament\Forms\Concerns\InteractsWithForms;

class DownloadFormatWidget extends Widget implements HasForms
{
    use InteractsWithForms;
    protected static string $view = 'filament.widgets.download-format-widget';

    public function form(Form $form): Form
    {
        $user = Auth::user();
        $mahasiswa = $user->mahasiswa;

        return $form
            ->schema([
                Actions::make([
                    // Surat Keterangan Aktif - hanya untuk Teknik Informatika
                    Action::make('download surat keterangan aktif')
                        ->action(function () use ($mahasiswa) {
                            if ($mahasiswa && $mahasiswa->prodi === 'Teknik Informatika') {
                                return response()->download(public_path('surataktif.pdf'));
                            }elseif ($mahasiswa && $mahasiswa->prodi === 'Teknik Elektro') {
                                return response()->download(public_path('surataktifetr.pdf'));
                            } else {
                                abort(403, 'Anda tidak memiliki akses untuk mendownload surat ini.');
                            }
                        }),

                    // Surat Keterangan Magang - hanya untuk Teknik Elektro
                    Action::make('download surat keterangan magang')
                        ->action(function () use ($mahasiswa) {
                            if ($mahasiswa && $mahasiswa->prodi === 'Teknik Informatika') {
                                return response()->download(public_path('suratmagang.pdf'));
                            }elseif ($mahasiswa && $mahasiswa->prodi === 'Teknik Elektro') {
                                return response()->download(public_path('suratmagangetr.pdf'));
                            } else {
                                abort(403, 'Anda tidak memiliki akses untuk mendownload surat ini.');
                            }
                        }),

                    // Surat Keterangan Skripsi - bebas akses bagi semua prodi
                    Action::make('download surat keterangan skripsi')
                        ->action(function () {
                            return response()->download(public_path('suratpenelitian.pdf'));
                        }),
                ])
            ])
            ->statePath('data');
    }

    public static function canView(): bool
    {
        $user = Auth::user();

        // Akses widget hanya untuk mahasiswa dan admin
        return $user->hasAnyRole(['mahasiswa']);
    }
}
