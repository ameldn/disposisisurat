<?php

namespace App\Filament\Resources;

use Filament\Forms;
use Filament\Tables;
use Filament\Forms\Form;
use App\Models\Mahasiswa;
use Filament\Tables\Table;
use Filament\Resources\Resource;
use Illuminate\Support\Facades\Auth;
use Filament\Forms\Components\Select;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\TextInput;
use Illuminate\Database\Eloquent\Builder;
use App\Filament\Resources\MahasiswaResource\Pages;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Filament\Resources\MahasiswaResource\RelationManagers;

class MahasiswaResource extends Resource
{
    protected static ?string $model = Mahasiswa::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    public static function shouldRegisterNavigation(): bool
    {
        // Only allow specific roles (e.g., 'staff', 'kaprodi', 'admin') to see the menu
        return Auth::user()->hasAnyRole(['staff', 'admin']);
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('user_id')
                ->relationship(
                    'user',
                    'name',
                    function ($query) {
                        $query->whereDoesntHave('mahasiswa')
                            ->whereHas(
                                'roles',
                                fn ($query) => $query->where('name', 'mahasiswa')
                            );
                    }
                ),
                TextInput::make('nama'),
                TextInput::make('nim'),
                TextInput::make('email'),
                TextInput::make('no_telpon'),
                TextInput::make('fakultas'),
                Select::make('prodi')
                ->options([
                    'Teknik Informatika' => 'Teknik Informatika',
                    'Teknik Elektro' => 'Teknik Elektro',
                    'Teknik Mesin' => 'Teknik Mesin',
                ]),
                TextInput::make('angkatan'),
                Select::make('status_aktif')
                    ->options([
                        'aktif' => 'Aktif',
                        'nonaktif' => 'Non Aktif',

                    ])
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('nama'),
                TextColumn::make('nim'),
                TextColumn::make('email')

            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
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
            'index' => Pages\ListMahasiswas::route('/'),
            'create' => Pages\CreateMahasiswa::route('/create'),
            'edit' => Pages\EditMahasiswa::route('/{record}/edit'),
        ];
    }
}
