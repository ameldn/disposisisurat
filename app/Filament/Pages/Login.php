<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use Filament\Pages\Auth\Login as Base;
use Illuminate\Contracts\Support\Htmlable;

class Login extends Base
{
    protected static ?string $navigationIcon = 'heroicon-o-document-text';

    protected static string $view = 'filament.pages.login';
    protected static string $layout = 'layouts.auth';

    public function getHeading(): string | Htmlable
    {
        return "Login";
    }

    public function getTitle(): string | Htmlable
    {
        return __('filament-panels::pages/auth/login.title');
    }
}
