<?php

namespace App\Filament\Resources;

use Auth;
use Filament\Forms;
use Filament\Tables;
use App\Models\Surat;
use Filament\Forms\Form;
use Filament\Tables\Grouping\Group;
use Filament\Tables\Table;
use Filament\Resources\Resource;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Actions;
use Illuminate\Support\Facades\Storage;
use Filament\Notifications\Notification;
use Filament\Forms\Components\FileUpload;
use Filament\Tables\Filters\SelectFilter;
use Illuminate\Database\Eloquent\Builder;
use Filament\Forms\Components\Actions\Action;
use App\Filament\Resources\SuratResource\Pages;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Filament\Resources\SuratResource\RelationManagers;

class SuratResource extends Resource
{
    protected static ?string $model = Surat::class;

    protected static ?string $navigationIcon = 'heroicon-o-document';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                FileUpload::make('file')
                    ->downloadable(),
                Select::make('mahasiswa_id')
                    ->disabled(function () {
                        return !Auth::user()->hasRole('mahasiswa');
                    })
                    ->disabled()
                    ->default(Auth::user()->mahasiswa?->id)
                    ->relationship('mahasiswa', 'nama'),

                Forms\Components\Select::make('jenis_surat')
                    ->label('Jenis Surat')
                    ->disabled(function () {
                        return !Auth::user()->hasRole('mahasiswa');
                    })
                    ->options([
                        'Keterangan Aktif Kuliah' => 'Keterangan Aktif Kuliah',
                        'Izin Magang' => 'Izin Magang',
                        'Izin Penelitian' => 'Izin Penelitian',
                    ])
                    ->reactive()  // Mengubah form sesuai pilihan jenis surat
                    ->required(),

                Forms\Components\Select::make('status')
                    ->label('Status Surat')
                    ->disabled(function () {
                        return !Auth::user()->hasRole(['staff', 'kaprodi',
                            'Kaprodi Teknik Informatika',
                            'Kaprodi Teknik Elektro',
                            'Kaprodi Teknik Kimia',
                            'Kaprodi Teknik Industri'
                        ]);
                    })
                    ->options(function () {
                        $user = Auth::user();

                        if ($user->hasRole('staff')) {
                            return [
                                'Menunggu' => 'Menunggu',
                                'Diproses' => 'Diproses',
                                'Ditolak' => 'Ditolak',

                            ];
                        }
                        if ($user->hasRole([
                            'Kaprodi Teknik Informatika',
                            'Kaprodi Teknik Elektro',
                            'Kaprodi Teknik Kimia',
                            'Kaprodi Teknik Industri'
                        ])) {
                            return [
                                'Diproses' => 'Diproses',
                                'Disetujui' => 'Disetujui',
                                'Ditolak' => 'Ditolak',
                            ];

                        }

                        return [
                            'Menunggu' => 'Menunggu',
                            'Diproses' => 'Diproses',
                            'Disetujui' => 'Disetujui',
                            'Ditolak' => 'Ditolak',
                        ];
                    }),
                Forms\Components\Fieldset::make('Detail Surat')
                    ->disabled(function () {
                        return !Auth::user()->hasRole('mahasiswa');
                    })
                    ->schema(function ($get) {
                        if ($get('jenis_surat') === 'Keterangan Aktif Kuliah') {
                            return [
                                Forms\Components\TextInput::make('detail_surat.tahun_ajaran')
                                    ->label('Tahun Ajaran')
                                    ->required(),
                                Forms\Components\TextInput::make('detail_surat.semester')
                                    ->label('Semester')
                                    ->required(),
                            ];
                        }

                        if ($get('jenis_surat') === 'Izin Magang') {
                            return [
                                Forms\Components\TextInput::make('detail_surat.perusahaan')
                                    ->label('Perusahaan')
                                    ->required(),
                                Forms\Components\DatePicker::make('detail_surat.tanggal_mulai')
                                    ->label('Tanggal Mulai')
                                    ->required(),
                                Forms\Components\DatePicker::make('detail_surat.tanggal_selesai')
                                    ->label('Tanggal Selesai')
                                    ->required(),
                            ];
                        }

                        if ($get('jenis_surat') === 'Izin Penelitian') {
                            return [
                                Forms\Components\TextInput::make('detail_surat.judul_penelitian')
                                    ->label('Judul Penelitian')
                                    ->required(),
                                Forms\Components\TextInput::make('detail_surat.dosen_pembimbing')
                                    ->label('Dosen Pembimbing')
                                    ->required(),
                            ];
                        }

                        return [];
                    }),

                Forms\Components\DatePicker::make('tanggal_pengajuan')
                    ->default(now())
                    ->label('Tanggal Pengajuan')
                    ->readOnly()  // Otomatis set ke tanggal saat ini
                    ->required(),


            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('mahasiswa.nama')
                    ->sortable()
                    ->label('Mahasiswa'),
                Tables\Columns\TextColumn::make('jenis_surat')->label('Jenis Surat'),
                Tables\Columns\TextColumn::make('tanggal_pengajuan')->label('Tanggal Pengajuan')
                    ->date(),
                Tables\Columns\TextColumn::make('status')->label('Status'),

                Tables\Columns\TextColumn::make('created_at')->label('Tanggal Dibuat'),
                Tables\Columns\TextColumn::make('updated_at')->label('Tanggal Terakhir Diubah'),


            ])
            ->filters([
                SelectFilter::make('status')
                    ->options([
                        'Menunggu' => 'Menunggu',
                        'Diproses' => 'Diproses',
                        'Disetujui' => 'Disetujui',
                        'Ditolak' => 'Ditolak',
                    ])
            ])
            ->groups([
                Group::make('status')
            ])
            ->defaultGroup('status')
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListSurats::route('/'),
            'create' => Pages\CreateSurat::route('/create'),
            'edit' => Pages\EditSurat::route('/{record}/edit'),
        ];
    }

    public static function getEloquentQuery(): Builder
    {
        $user = Auth::user();
        if ($user->hasRole('mahasiswa')) {
            return parent::getEloquentQuery()
                ->whereHas('mahasiswa.user', function ($query) use ($user) {
                    $query->where('id', $user->id);
                });
        }
        if (
            $user->hasRole([
                'Kaprodi Teknik Informatika',
                'Kaprodi Teknik Elektro',
                'Kaprodi Teknik Kimia',
                'Kaprodi Teknik Industri'
            ])
        ) {
            $prodi = $user
                ->getRoleNames()
                ->map(fn($item) =>
                    str_replace('Kaprodi ', '', $item))
                ->toArray();
            return parent::getEloquentQuery()
                ->whereHas('mahasiswa', fn($query) => $query->whereIn('prodi', $prodi))
                ->where('status', 'Diproses');
        }

        return parent::getEloquentQuery();
    }
}
